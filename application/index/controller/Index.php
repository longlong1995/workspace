<?php
namespace app\index\controller;
use think\Controller;
use traits\controller\Jump;
use app\index\model\User;
use app\index\model\Doctor;
use app\index\model\Link;
use app\index\model\Goods;
use app\index\model\Goodssort;
use app\index\model\Order;
use app\index\model\Closeip;
use app\index\model\Sort;
use app\index\model\Message;
use app\index\model\Beauty;
use app\index\model\Beautyorder;
use app\index\model\Hits;
use think\Session;
use think\Cookie;
use think\Upload;
use think\Validate;
use think\Url;
use think\Db;
class Index extends Controller
{
     public function __construct()
     {
		if (WEB_CLOSE == 'true') {
		exit('当前站点已关闭, 如果您是管理员<a href="/admin/index/login.html">请点击这里跳转至后台登录页面</a>');
		}
		// define('CITY', $this->city());
    define('CITY', '上海');
		parent::__construct();
     }
     /**
     * 获取当前城市
     */
     public function city()
     {
		$ip = request()->ip();
		$url = 'http://restapi.amap.com/v3/ip?ip='.$ip.'&output=json&key=81f3d5a86f54f1376b0d2f8a6d34ee64';
		$a = file_get_contents($url);
		$city = json_decode($a);
		return $city->city;
    }

    public function index()
    {
      if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        $data = input('post.');
        if (!empty($data['name']) || !empty($data['email'])) {
          $data['addtime'] = time();
          $message = new Message($data);
          $message->allowField(true)->save();
          echo '<script>alert("请注意查收邮件");location.href="index.html";</script>';
        }
      }
	    Db::table('mc_hits')->where('hid', 1)->setInc('hits');
      $uid = Session::get('uid');
      $user = User::get($uid);
      $link = Link::order('orderby','desc')->select();
      $i = 1;
      $beauty_info = Beauty::where('isdel', 0)->limit(3)->select();
      $doctor_info = Doctor::where('isdel', 0)->order('orderby', 'desc')->select();
      $beautySort_info = Sort::select();
      $beautyorder_info = Beautyorder::view('Beautyorder', '*')
                                      ->view('User', 'uid, username', 'User.uid = Beautyorder.uid')
                                      ->view('Beauty', 'bid, bname, images', 'Beauty.bid = Beautyorder.bid')
                                      ->where('status', 3)
                                      ->limit(3)
                                      ->order('book_time', 'desc')
                                      ->select();
      $user_count = User::where('isdel', 0)->count();

      $order_count = Order::where('isdel', 0)->where('ispay', 1)->count() + Beautyorder::where('status', 3)->count();
      $doctor_count = Doctor::where('isdel', 0)->count();
	    $hits_count = Hits::get(1)->hits;
      $this->assign(['i' => 1, 'beauty_info' => $beauty_info, 'link' => $link, 'user' => $user, 'user_count' => $user_count, 'order_count' => $order_count, 'doctor_count' => $doctor_count, 'doctor_info' => $doctor_info, 'beautySort_info' => $beautySort_info, 'hits_count' => $hits_count, 'beautyorder_info' => $beautyorder_info]);
      return $this->fetch();
    }
    

    //商品页面
       public function shop()
    {
       $uid = Session::get('uid');
       $user = User::get($uid);
       $link = Link::order('orderby','desc')->select();
       $i = 1;
       if (input('get.shopid')) {
        $goods = Goods::where('isdel', 0)
                      ->where('sort_id', input('get.shopid'))
                      ->order('sales', 'desc')
                      ->paginate(12)
                      ->appends(['shopid' => input('get.shopid')]);
        $goods_hot = Goods::where('isdel', 0)
                          ->where('sort_id', input('get.shopid'))
                          ->order('sales', 'desc')
                          ->limit(5)
                          ->select();
      } else {
        $goods = Goods::where('isdel', 0)
                      ->order('sales', 'desc')
                      ->paginate(12);
        $goods_hot = Goods::where('isdel', 0)
                          ->order('sales', 'desc')
                          ->limit(5)
                          ->select();
      }
      
       $page = $goods->render();

       $goodssort_info = Goodssort::order('orderby', 'desc')->select();
	   $goods_info = Goods::where('isdel', 0)->select();

       $this->assign(['goods' => $goods, 'goodssort_info' => $goodssort_info, 'page' => $page, 'goods_hot' => $goods_hot, 'goods_info' => $goods_info]);
       $this->assign('i', 1);
       $this->assign('link', $link);
       $this->assign('user', $user);

      return $this->fetch();
    }

    //商品详情页
    public function shop_details()
    {
       $uid = Session::get('uid');
       $user = User::get($uid);
       $link = Link::order('orderby','desc')->select();
       $i = 1;
       $gid = input('get.gid');

       $goods = Goods::get($gid);
       $goods_hot = Goods::where('isdel', 0)
                          ->where('sort_id', $goods->sort_id)
                          ->order('sales', 'desc')
                          ->limit(5)
                          ->select();
       $goodssort = Goodssort::get($goods->sort_id);
       $this->assign(['i' => 1, 'goods' => $goods, 'goodssort' => $goodssort, 'goods_hot' => $goods_hot]);
       $this->assign('link', $link);
       $this->assign('user', $user);

    	return $this->fetch();
    }

    //添加购物车和立即购买方法
    public function cart()
    {
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
          $data = input('post.'); 

         $uid = Session::get('uid');
         $data['uid'] = $uid;
         $goods = Goods::get($data['gid']);
         $gid = $data['gid'];
         $rate = $goods->current_price * $data['sum'];
         $data['rate'] = $rate;
         $result = Order::where('uid', $uid)->where('gid', $gid)->where('ispay', 0)->find();
         if ($result) {
            $data['rate'] = $result->rate + $data['rate'];
            $data['sum'] = $result->sum + $data['sum'];
            $order = new Order();
            $order->allowField(true)->save($data, ['oid' => $result->oid]);
         } else {
           $order = new Order();
           $result = $order->allowField(true)->save($data);
         }

         // var_dump($result);
         //加入购物车是否成功
         if ($result) {
          $url = $_SERVER['HTTP_REFERER'];
          echo '<script>alert("加入购物车成功");location.href="'.$url.'"</script>';die;
         } else {
          echo '<script>alert("添加失败");location.href="'.$url.'"</script>';die;
         }
      }
    }
    //购物车页面
    public function shop_cart()
    {
	  if (!Session::has('uid')) {
      	$this->error('请先登录', '/index/user/login.html');
      }

      $uid = Session::get('uid');
      $user = User::get($uid);
      $link = Link::order('orderby','desc')->select();
      $time = time();
      
      $time = 'good'.$time;
      $this->assign(['link' => $link, 'user' => $user, 'time' => $time]);
      return $this->fetch();
    }

    /**
    *购物车详情
    */
    public function cartinfo()
    {
      $uid = Session::get('uid');
      $order = Db::view('Order', ['oid', 'uid', 'gid', 'sum' => 'quantity', 'isdel', 'ispay'])
                  ->view('Goods', ['gid', 'gname' => 'name', 'product_id' => 'id', 'current_price' => 'price'], 'Goods.gid = Order.gid')
                  ->where('Order.uid', $uid)
                  ->where('Order.isdel', 0)
                  ->where('Order.ispay', 0)
                  ->select();
      if (!empty($order)) {
        foreach ($order as $key => $value) {
           $data[$key] = [
            'oid' => $value['oid'],
            'id' => $value['id'],
            'name' => $value['name'],
            'quantity' => $value['quantity'],
            'price' => $value['price'],
          ];
        }
        echo json_encode($data);
      } else {
        echo json_encode(1);
      }
    }

    /**
    * 订单支付
    */
    public function cart_buy()
    {
      $uid = Session::get('uid');
      $order = new Order();
      $order_info = Order::where('uid', $uid)->where('isdel', 0)->where('ispay', 0)->select();
        foreach ($order_info as $key => $value) {
          $goods = Goods::get($value->gid);
          $sales = $goods->sales + 1;
          Goods::where('gid', $value->gid)->update(['sales' => $sales]);
      }
      $order->where('uid', $uid)->where('isdel', 0)->where('ispay', 0)->update(['ispay' => 1]);
      
      $this->success('支付完成', '/index/index/shop.html');
    }

    /**
    * 订单数量添加
    */
    public function cart_add()
    {
      $uid = Session::get('uid');
      $goods = Goods::where('product_id', input('post.oid'))->find();
      $order_info = Order::where('uid', $uid)
                    ->where('gid', $goods->gid)
                    ->where('ispay', 0)
                    ->where('isdel', 0)
                    ->find();
      $data['sum'] = $order_info->sum + 1;
      $order = new Order();
      $order->allowField(true)->save($data, ['oid' => $order_info->oid]);
    }

    /**
    * 订单数量减
    */
    public function cart_sub()
    {
      $uid = Session::get('uid');
      $goods = Goods::where('product_id', input('post.oid'))->find();
      $order_info = Order::where('uid', $uid)
                    ->where('gid', $goods->gid)
                    ->where('ispay', 0)
                    ->where('isdel', 0)
                    ->find();
      $data['sum'] = $order_info->sum - 1;
      $order = new Order();
      $order->allowField(true)->save($data, ['oid' => $order_info->oid]);
    }

    //支付成功
    public function payok()
    {
      $str = input('get.out_trade_no');
      $str = substr($str, 0, 4);
      if ($str == 'good') {
        echo '<script>location.href="/index/index/cart_buy.html"</script>';die;
      } else {
        echo '<script>location.href="/index/index/book_buy.html"</script>';die;
      }
    }


    //美容中心
    public function center()
    {
      $uid = Session::get('uid');
       $user = User::get($uid);
       $link = Link::order('orderby','desc')->select();
       if (input('get.centerid')) {
        $beauty = Beauty::where('isdel', 0)
                      ->where('sort_id', input('get.centerid'))
                      ->order('sales', 'desc')
                      ->paginate(12)
                      ->appends(['shopid' => input('get.centerid')]);
        $beauty_hot = Beauty::where('isdel', 0)
                          ->where('sort_id', input('get.centerid'))
                          ->order('sales', 'desc')
                          ->limit(5)
                          ->select();
      } else {
        $beauty = Beauty::where('isdel', 0)
                      ->order('sales', 'desc')
                      ->paginate(12);
        $beauty_hot = Beauty::where('isdel', 0)
                          ->order('sales', 'desc')
                          ->limit(5)
                          ->select();
      }
      
       $page = $beauty->render();

       $sort_info = Sort::order('orderby', 'desc')->select();
	   $beauty_info = Beauty::where('isdel', 0)->select();

       $this->assign(['beauty' => $beauty, 'sort_info' => $sort_info, 'page' => $page, 'beauty_hot' => $beauty_hot, 'beauty_info' => $beauty_info]);
       $this->assign('link', $link);
       $this->assign('user', $user);

      return $this->fetch();
    }


    //项目详情页
    public function center_details()
    {
      $uid = Session::get('uid');
       $user = User::get($uid);
       $link = Link::order('orderby','desc')->select();
       $bid = input('get.bid');

       $beauty = beauty::get($bid);
       $beauty_hot = beauty::where('isdel', 0)
                          ->order('sales', 'desc')
                          ->limit(5)
                          ->select();

       $sort = Sort::get($beauty->sort_id);

       $doctor = Doctor::where('isdel', 0)->where('sid', $beauty->sort_id)->select();
       $this->assign(['beauty' => $beauty, 'sort' => $sort, 'beauty_hot' => $beauty_hot, 'doctor' => $doctor]);
       $this->assign('link', $link);
       $this->assign('user', $user);

      return $this->fetch();
    }

    /**
    * 预约页面
    */
    public function book()
    {
      if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        $bid = input('post.bid');
      }
      $beauty = Beauty::get($bid);
      $uid = Session::get('uid');
      $user = User::get($uid);
      $link = Link::order('orderby','desc')->select();
      $book = 'book'.time();
      $this->assign(['link' => $link, 'beauty' => $beauty, 'book' => $book]);
      $this->assign('user', $user);

      return $this->fetch();
    }

    /**
    * 立即预约
    */
    public function book_add()
    {
      $data = input('post.');
      $data['addtime'] = time();
      $data['uid'] = Session::get('uid');
      $data['book_time'] = strtotime($data['book_time']);
      $beautyorder = new Beautyorder($data);
      $beautyorder->allowField(true)->save();
      Cookie::set('id', $beautyorder->id, 120);
    }

    /**
    * 预约完成
    */
    public function book_buy()
    {
      $id = Cookie::get('id');
      $beautyorder = new Beautyorder();
      $beautyorder->save(['status' => 1], ['id' => $id]);
      $beauty_id = Beautyorder::get($id);
      $beauty = Beauty::get($beauty_id->bid);
      $sales = $beauty->sales;
      $beauty->where('bid', $beauty_id->bid)->update(['sales' => $sales+1]);
      $this->success('预约成功', '/index/index/center.html');
    }

    
    // 专家列表
    public function doctor()
    {
       $uid = Session::get('uid');
       $user = User::get($uid);
       $link = Link::order('orderby','desc')->select();
       if (input('get.doctorid')) {
        $doctor = Doctor::where('isdel', 0)
                      ->where('sid', input('get.doctorid'))
                      ->paginate(12)
                      ->appends(['doctorid' => input('get.doctorid')]);
        $doctor_hot = Doctor::where('isdel', 0)
                          ->order('orderby', 'desc')
                          ->limit(5)
                          ->select();
      } else {
        $doctor = Doctor::where('isdel', 0)
                      ->paginate(12);
        $doctor_hot = Doctor::where('isdel', 0)
                          ->order('orderby', 'desc')
                          ->limit(5)
                          ->select();
      }
       $page = $doctor->render();

       $sort_info = Sort::order('orderby', 'desc')->select();
	   $doctor_info = Doctor::where('isdel', 0)->select();
       $this->assign(['doctor' => $doctor, 'page' => $page, 'doctor_hot' => $doctor_hot, 'sort_info' => $sort_info, 'doctor_info' => $doctor_info]);
       $this->assign('link', $link);
       $this->assign('user', $user);

      return $this->fetch();
    }

    //专家详情页
    public function doctor_details()
    {
       $uid = Session::get('uid');
       $user = User::get($uid);
       $link = Link::order('orderby','desc')->select();
       $bid = input('get.did');

       $doctor = Doctor::get($bid);
       $doctor_hot = Doctor::where('isdel', 0)
                          ->order('orderby', 'desc')
                          ->limit(5)
                          ->select();

       $sort = Sort::get($doctor->sid);
       $this->assign(['doctor' => $doctor, 'sort' => $sort, 'doctor_hot' => $doctor_hot]);
       $this->assign('link', $link);
       $this->assign('user', $user);

      return $this->fetch();
    }
   
   /**
    *
    * 公司简介
    */
   public function about()
    {
      //友情连接表
       $uid = Session::get('uid');
       $user = User::get($uid);
       $link = Link::order('orderby','desc')->select();
       $this->assign('link', $link);
       $this->assign('user', $user);

       return $this->fetch();
    }

    /**
    *
    * 公司历史
    */
    public function company_history()
    {
      $uid = Session::get('uid');
       $user = User::get($uid);
       $link = Link::order('orderby','desc')->select();
       $this->assign('link', $link);
       $this->assign('user', $user);

       return $this->fetch();
    }

    /**
    *
    * 公司连锁
    */
    public function company_ourteam()
    {
      $uid = Session::get('uid');
       $user = User::get($uid);
       $link = Link::order('orderby','desc')->select();
       $this->assign('link', $link);
       $this->assign('user', $user);

       return $this->fetch();
    }

    /**
    *
    * 公司地址
    */
    public function company_address()
    {
      $uid = Session::get('uid');
       $user = User::get($uid);
       $link = Link::order('orderby','desc')->select();
       $this->assign('link', $link);
       $this->assign('user', $user);

       return $this->fetch();
    }

    /**
    *
    * 公司成就
    */
    public function company_careers()
    {
      $uid = Session::get('uid');
       $user = User::get($uid);
       $link = Link::order('orderby','desc')->select();
       $this->assign('link', $link);
       $this->assign('user', $user);

       return $this->fetch();
    }

    /**
    * 服务流程
    */
    public function company_partners()
    {
       $uid = Session::get('uid');
       $user = User::get($uid);
       $link = Link::order('orderby','desc')->select();
       $this->assign('link', $link);
       $this->assign('user', $user);

       return $this->fetch();
    }

     //个人中心 修改头像页
    public function setting()
    {
     if (!Session::has('uid')) {
      $this->error('请先登录', '/index/user/login.html');
    }
      $uid = Session::get('uid');
      $user = User::get($uid);
      $link = Link::order('orderby','desc')->select();
      //判断是否是post传过来的数据
      if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        $data = input('post.');
        $file = request()->file('picture');
        // var_dump($file);
        if (empty($file)) {
          echo '<script>alert("图片不能为空");location.href="/index/index/setting";</script>';die;
        }
        // 移动到框架应用根目录/public/uploads/ 目录下
        $info = $file->move(ROOT_PATH . 'public' . DS . 'uploads');

        $data['picture'] = '/uploads/'.str_replace('\\', '/', $info->getSaveName());
        
        $uid = Session::get('uid');
        $user = new User();
        $user->allowField(true)->save($data, ['uid' => $uid]);
        $this->success('修改成功');
      }
      $this->assign('link', $link);
      $this->assign('user', $user);
      return $this->fetch();
    }

    //个人中心 修改密码页
    public function setting_password()
    {
       if (!Session::has('uid')) {
        $this->error('请先登录', '/index/user/login.html');
      }
      if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        $data = input('post.');
        $uid = Session::get('uid');
        $user = User::get($uid);
        if (md5($data['password']) !== $user->password) {
          echo '<script>alert("原始密码错误");location.href="/index/index/setting_password";</script>';die;
        }  else if (empty($data['newpassword']) || empty($data['rpassword']) || $data['newpassword'] != $data['rpassword']) {
            echo '<script>alert("两次输入不一致");location.href="/index/index/setting_password";</script>';die;
        }
        $result['password'] = md5($data['newpassword']);
        User::where('uid', $uid)->update($result);
        $this->success('修改成功');

      }

      $uid = Session::get('uid');
      $user = User::get($uid);
      $link = Link::order('orderby','desc')->select();

      $this->assign('link', $link);
      $this->assign('user', $user);
      return $this->fetch();
    }

    //个人中心 个人信息页
    public function setting_user()
    {
      if (!Session::has('uid')) {
      $this->error('请先登录', '/index/user/login.html');
    }
      if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        $data = input('post.');
        $uid = Session::get('uid');
        $user = User::get($uid);
        // var_dump($data);
        $user->allowField(true)->save($data, ['uid' => $uid]);
        $this->success('修改成功');
      }
      $uid = Session::get('uid');
      $user = User::get($uid);
      $link = Link::order('orderby','desc')->select();

      $this->assign('link', $link);
      $this->assign('user', $user);
      return $this->fetch();
    }

    //个人中心 我的订单页面
    public function setting_order()
    {
      if ($_SERVER['REQUEST_METHOD'] == 'POST') {
       if (input('?post.delete')) {
         Order::destroy(input('post.oid'));
         $this->success('删除成功');
       }
      }

      	if (!Session::has('uid')) {
      		$this->error('请先登录', '/index/user/login.html');
    	}
      $uid = Session::get('uid');
      $user = User::get($uid);
      $link = Link::order('orderby','desc')->select();
      $order_info = Order::view('Order', '*')
              ->view('User', 'uid, username', 'Order.uid = User.uid')
              ->view('Goods', 'gid, gname', 'Order.gid = Goods.gid')
			  ->where('uid', $uid)
              ->where('Order.isdel', 0)
              ->paginate(5);
      $page = $order_info->render();

      $this->assign(['order_info' => $order_info, 'page' => $page]);
      $this->assign('link', $link);
      $this->assign('user', $user);
      return $this->fetch(); 
    }

     //个人中心 我的预约页面
    public function setting_beautyorder()
    {
	if (!Session::has('uid')) {
      		$this->error('请先登录', '/index/user/login.html');
    	}
      if ($_SERVER['REQUEST_METHOD'] == 'POST') {
      if (input('post.delete')) {
        Beautyorder::destroy(input('post.id'));
         $this->success('删除成功');
      } 
    }
      $uid = Session::get('uid');
      $user = User::get($uid);
      $link = Link::order('orderby','desc')->select();
      $beautyorder_info = Beautyorder::view('Beautyorder', '*')
                     ->view('User', 'uid, username', 'Beautyorder.uid = User.uid')
                     ->view('Beauty', '*', 'Beautyorder.bid = Beauty.bid')
		    ->where('User.uid', $uid)
                     ->paginate(5);
      $page = $beautyorder_info->render();
      $this->assign(['beautyorder_info' => $beautyorder_info, 'page' => $page]);
      $this->assign('link', $link);
      $this->assign('user', $user);
      return $this->fetch();
      
   }

    /**
    * 立即预约
    */
    public function book_pay()
    {
      Cookie::set('id', input('post.id'), 120);
    }

       //搜索页面
    public function search()
    {
      if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        $data = input('post.');
        $name = $data['search'];
        $search_info = Db::table('mc_doctor')
                      ->where('name', 'like', "%$name%")
                      ->select();
        // var_dump($search_info);
        $this->assign('search_info', $search_info);
      }
      $link = Link::order('orderby','desc')->select();
      $this->assign('link', $link);
      return $this->fetch();
    }
    /**
   * 退出登录
   * @return 退出登录页面
   */
  public function layout()
  {
    Session::clear();
    $this->success('退出成功');
  }

}
