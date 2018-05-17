<?php
namespace app\admin\controller;
use think\Controller;
use traits\controller\Jump;
use app\admin\model\User;
use app\admin\model\Link;
use app\admin\model\Closeip;
use app\admin\model\Doctor;
use app\admin\model\Message;
use app\admin\model\Goodssort;
use app\admin\model\Goods;
use app\admin\model\Sort;
use app\admin\model\Beauty;
use app\admin\model\Order;
use app\admin\model\Beautyorder;
use think\Session;
use think\Upload;
use think\Validate;
use think\Request;
class Index extends Controller
{
	/**
	 * 管理员登录
	 * @return 登录视图
	 */
	public function login()
	{
		if ($_SERVER['REQUEST_METHOD'] == 'POST') {
			$data = input('post.');
			$user = User::get(['username' => $data['username']]);
			if ($user) {
				if ($user->allow_login == 0) {
					if ($user->usertype == '管理员') {
						if ($user->password == MD5($data['password'])) {
							Session::set('username', $user->username);
							Session::set('usertype', $user->usertype);
							Session::set('uid', $user->uid);
							User::where('uid', $user->uid)->update(['last_time' => time()]);
							$this->success('登陆成功', 'index');
						} else {
							$this->error('用户名或密码错误');
						}
					} else {
						$this->error('当前用户权限不足', 'index/index/index');
					}
				} else {
					$this->error('当前用户已被锁定');
				}
			} else {
				$this->error('用户名或密码错误');
			}
		}
		return $this->fetch();
	}

	/**
	 * 后台首页
	 * @return 后台视图
	 */
	public function index()
	{
		if (!Session::has('uid')) {
			$this->error('请先登录', 'login');
		}
		$uid = Session::get('uid');
		$user = User::get($uid);

		$order_sum = Order::where('isdel', 0)->where('ispay', 1)->count() + Beautyorder::where('status', 3)->count();
		$message_sum = Message::where('isdel', 0)->count();
		$user_sum = User::where('isdel', 0)->count();
		$doctor_sum = Doctor::where('isdel', 0)->count();

		$message_info = Message::where('isdel', 0)->limit(5)->order('addtime', 'desc')->select();
		$goods_info = Order::view('Order', '*')
							->view('User', 'uid, username', 'Order.uid = User.uid')
							->view('Goods', '*', 'Order.gid = Goods.gid')
							->where('Order.isdel', 0)
							->where('Order.ispay', 1)
							->order('sales', 'desc')
							->find();
		$beauty_info = Beautyorder::view('Beautyorder', '*')
									->view('User', 'uid, username', 'User.uid = Beautyorder.uid')
									->view('Beauty', '*', 'Beauty.bid = Beautyorder.bid')
									->where('Beautyorder.status', 3)
									->order('sales', 'desc')
									->find();
		$this->assign(['user' => $user, 'message_sum' => $message_sum, 'user_sum' => $user_sum, 'doctor_sum' => $doctor_sum, 'order_sum' => $order_sum, 'message_info' => $message_info, 'goods_info' => $goods_info, 'beauty_info' => $beauty_info]);
		return $this->fetch();
	}

	/**
	 * 站点信息修改
	 * @return 站点修改视图
	 */
	public function web()
	{
		if ($_SERVER['REQUEST_METHOD'] == 'POST') {
			$data = input('post.');
			// 判断接收站点是否为空
			if (empty($data['web_name']) || empty($data['web_btm']) || empty($data['web_url']) || empty($data['web_icp'])) {
				// 跳转到站点信息页面
				echo '<script>alert("站点信息不能为空");location.href="/admin/index/web.html"</script>';die;
			}

			// 读取本站点信息
			$str = file_get_contents('../application/common.php');

			// 匹配修改定义的站点信息常量
			foreach ($data as $key => $value) {
				$key = strtoupper($key);
				$pattern = "/define\('$key', '.*?'\);/";
				$replacement = "define('$key', '$value');";
				$str = preg_replace($pattern, $replacement, $str);
			}

			// 把修改后的站点信息导入文件
			file_put_contents('../application/common.php', $str);
			// 跳转到站点信息页面
			echo '<script>alert("修改站点信息成功");location.href="/admin/index/web.html"</script>';die;
		}

		if (!Session::has('uid')) {
			$this->error('请先登录', 'login');
		}
		$uid = Session::get('uid');
		$user = User::get($uid);
		$this->assign('user', $user);
		return $this->fetch();
	}

	/**
	 * 网站LOGO修改
	 * @return LOGO修改页面
	 */
	public function logo()
	{
		if ($_SERVER['REQUEST_METHOD'] == 'POST') {
			
			// 获取表单上传文件 例如上传了001.jpg
			$file = request()->file('web_logo');
			// 判断接收站点是否为空
			if (empty($file)) {
				// 跳转到站点信息页面
				echo '<script>alert("网站LOGO不能为空");location.href="/admin/index/logo.html"</script>';die;
			}

			// 移动到框架应用根目录/public/uploads/ 目录下
			$info = $file->move(ROOT_PATH . 'public' . DS . 'uploads');

			$data['web_logo'] = '/uploads/'.str_replace('\\', '/', $info->getSaveName());

			// 读取本站点信息
			$str = file_get_contents('../application/common.php');

			// 匹配修改定义的站点信息常量
			foreach ($data as $key => $value) {
				$key = strtoupper($key);
				$pattern = "/define\('$key', '.*?'\);/";
				$replacement = "define('$key', '$value');";
				$str = preg_replace($pattern, $replacement, $str);
			}

			// 把修改后的站点信息导入文件
			file_put_contents('../application/common.php', $str);
			// 跳转到站点信息页面
			echo '<script>alert("修改网站LOGO成功");location.href="/admin/index/logo.html"</script>';die;
		}

		if (!Session::has('uid')) {
			$this->error('请先登录', 'login');
		}
		$uid = Session::get('uid');
		$user = User::get($uid);
		$this->assign('user', $user);
		return $this->fetch();
	}

	/**
	 * 修改首页轮播
	 * @return 轮播页面
	 */
	public function carousel()
	{
		if ($_SERVER['REQUEST_METHOD'] == 'POST') {
			$data = input('post.');
			foreach ($data as $value) {
				if (empty($value)) {
					// 跳转到轮播信息页面
					echo '<script>alert("内容不能为空");location.href="/admin/index/carousel.html"</script>';die;
				}
			}
			
			// 获取表单上传文件 例如上传了001.jpg
			$file1 = request()->file('carousel_picture1');
			$file2 = request()->file('carousel_picture2');
			$file3 = request()->file('carousel_picture3');
			// 判断接收站点是否为空
			if (!empty($file1)) {
				// 移动到框架应用根目录/public/uploads/ 目录下
				$info1 = $file1->move(ROOT_PATH . 'public' . DS . 'uploads');
				$data['carousel_picture1'] = '/uploads/'.str_replace('\\', '/', $info1->getSaveName());
			}
			if (!empty($file2)) {
				// 移动到框架应用根目录/public/uploads/ 目录下
				$info2 = $file2->move(ROOT_PATH . 'public' . DS . 'uploads');
				$data['carousel_picture2'] = '/uploads/'.str_replace('\\', '/', $info2->getSaveName());
			}
			if (!empty($file3)) {
				// 移动到框架应用根目录/public/uploads/ 目录下
				$info3 = $file3->move(ROOT_PATH . 'public' . DS . 'uploads');
				$data['carousel_picture3'] = '/uploads/'.str_replace('\\', '/', $info3->getSaveName());
			}

			// 读取本站点信息
			$str = file_get_contents('../application/common.php');

			// 匹配修改定义的站点信息常量
			foreach ($data as $key => $value) {
				$key = strtoupper($key);
				$pattern = "/define\('$key', '.*?'\);/";
				$replacement = "define('$key', '$value');";
				$str = preg_replace($pattern, $replacement, $str);
			}

			// 把修改后的站点信息导入文件
			file_put_contents('../application/common.php', $str);
			// 跳转到站点信息页面
			echo '<script>alert("修改成功");location.href="/admin/index/carousel.html"</script>';die;
		}

		if (!Session::has('uid')) {
			$this->error('请先登录', 'login');
		}
		$uid = Session::get('uid');
		$user = User::get($uid);
		$this->assign('user', $user);
		return $this->fetch();
	}

	/**
	 * 友情链接添加修改
	 * @return 友情链接页面
	 */
	public function link()
	{
		if ($_SERVER['REQUEST_METHOD'] == 'POST') {
			$rule = [
				'orderby' 	=> 'require|number',
				'name' 		=> 'require',
				'url' 		=> 'require|url',
			];

			$msg = [
				'orderby.require' 	=> '显示顺序不能为空',
				'orderby.number' 	=> '显示顺序必须为数字',
				'name.require' 		=> '网站名称不能为空',
				'url.require' 		=> '网站链接不能为空',
				'url.url' 			=> '网站链接格式不正确',
			];

			$validate = new Validate($rule, $msg);

			if (!empty($_POST['delete'])) {
				// 删除link
				$data = input('post.lid/a');
				if (!empty($data)) {
					$str = join(',', $data);
					Link::destroy($str);
				}
			} else if (!empty($_POST['update'])) {
				// 遍历修改link信息
				if (!empty($_POST['orderby'])) {
					foreach($_POST['orderby'] as $key => $value){
						// link信息数组
						$data = [
							'lid' 		=> $key,
							'orderby' 	=> $value,
							'name' 		=> $_POST['name'][$key],
							'url' 		=> $_POST['url'][$key],
						];

						if (!$validate->check($data)) {
							// 跳转到友情链接页面
							echo '<script>alert("'.$validate->getError().'");location.href="/admin/index/link.html"</script>';die;
						}
						// 更新到数据库
						Link::update($data);
					}
				}
				
			} else if (!empty($_POST['add'])) {
				// 添加link
				$data = input('post.');

				if (!$validate->check($data)) {
					// 跳转到友情链接页面
					echo '<script>alert("'.$validate->getError().'");location.href="/admin/index/link.html"</script>';die;
				}


				// 获取表单上传文件 例如上传了001.jpg
				$file = request()->file('logo');
				// 判断上传文件是否为空
				if (empty($file)) {
					// 跳转到友情链接页面
					echo '<script>alert("图片不能为空");location.href="/admin/index/link.html"</script>';die;
				}

				// 移动到框架应用根目录/public/uploads/ 目录下
				$info = $file->move(ROOT_PATH . 'public' . DS . 'uploads');

				$data['logo'] = '/uploads/'.str_replace('\\', '/', $info->getSaveName());
				unset($data['add']);
				$link = Link::create($data);
			}
		}

		if (!Session::has('uid')) {
			$this->error('请先登录', 'login');
		}
		$uid = Session::get('uid');
		$user = User::get($uid);

		$link = Link::order('orderby', 'desc')->select();


		$this->assign(['user' => $user, 'link' => $link]);
		return $this->fetch();
	}

	/**
	 * 用户管理
	 * @return 用户管理界面
	 */
	public function userManager()
	{
		if ($_SERVER['REQUEST_METHOD'] == 'POST') {
			$data = input('post.uid/a');
			if (!empty($data)) {
				$str = join(',', $data);
				User::where('uid', 'in', $str)->update(['isdel' => 1]);
			}
		}

		if (input('get.l') !== null) {
			$l = input('get.l');
			$uid = input('get.uid');
			User::where('uid', $uid)->update(['allow_login' => $l]);
		}

		if (input('get.t') !== null) {
			$t = input('get.t');
			$uid = input('get.uid');
			User::where('uid', $uid)->update(['usertype' => $t]);
		}

		if (!Session::has('uid')) {
			$this->error('请先登录', 'login');
		}
		$uid = Session::get('uid');
		$user = User::get($uid);

		$user_info = User::where('isdel', 0)->select();

		$this->assign(['user' => $user, 'user_info' => $user_info]);
		return $this->fetch();
	}

	/**
	 * 用户详情
	 * @return 用户详情页面
	 */
	public function userInfo()
	{
		if ($_SERVER['REQUEST_METHOD'] == 'POST') {
			// 密码是否为空
			if (!empty(input('post.password'))) {
				$data['password'] = md5(input('post.password'));
			}
			// 真实姓名是否为空
			if (!empty(input('post.real_name'))) {
				$data['real_name'] = input('post.real_name');
			}
			//性别
			$data['sex'] = input('post.sex');
			// 地址是否为空
			if (!empty(input('post.place'))) {
				$data['place'] = input('post.place');
			}

			// 获取表单上传文件 例如上传了001.jpg
			$file = request()->file('picture');
			// 判断上传文件是否为空
			if (!empty($file)) {
				// 移动到框架应用根目录/public/uploads/ 目录下
				$info = $file->move(ROOT_PATH . 'public' . DS . 'uploads');

				$data['picture'] = '/uploads/'.str_replace('\\', '/', $info->getSaveName());
			}


			// 用户ID
			$uid = input('post.uid');
			$user = new User();
			$user->allowField(true)->save($data, ['uid' => $uid]);

			$this->success('修改成功');
		}

		if (input('get.uid') == null) {
			$this->error('错误操作');
		}

		if (!Session::has('uid')) {
			$this->error('请先登录', 'login');
		}
		$uid = Session::get('uid');
		$user = User::get($uid);

		$id = input('get.uid');
		$user_info = User::where('uid', $id)->find();

		$this->assign(['user' => $user, 'user_info' => $user_info]);
		return $this->fetch();
	}

	/**
	 * 用户回收站
	 * @return 用户回收站页面
	 */
	public function userRecover()
	{
		if ($_SERVER['REQUEST_METHOD'] == 'POST') {
			$data = input('post.uid/a');
			if (!empty($data)) {
				if (!empty(input('post.delete'))) {
					User::destroy($data);
				} else if (!empty(input('post.recover'))) {
					$user = new User();
					$user->where('uid', 'in', $data)->update(['isdel' => 0]);
				}
			}
		}

		if (!Session::has('uid')) {
			$this->error('请先登录', 'login');
		}
		$uid = Session::get('uid');
		$user = User::get($uid);
		$user_info = User::where('isdel', 1)->paginate(10);
		$page = $user_info->render();

		$this->assign(['user' => $user, 'user_info' => $user_info, 'page' => $page]);
		return $this->fetch();
	}

	/**
	 * 禁止IP
	 * @return 禁止IP页面
	 */
	public function closeIp()
	{
		if ($_SERVER['REQUEST_METHOD'] == 'POST') {
			// 删除
			if (!empty($_POST['delete'])) {
				$data = input('post.id/a');
				if (!empty($data)) {
					Closeip::destroy($data);
					$this->success('删除成功', '', 0, 0);
				}

			// 添加
			} else if (!empty($_POST['add'])) {
				$data = input('post.');
				$rule = [
					'closeip1' 	=> 'require|number|min:1|between:1,255',
					'closeip2' 	=> 'require|number|min:1|between:1,255',
					'closeip3' 	=> 'require|number|min:1|between:1,255',
					'closeip4' 	=> 'require|number|min:1|between:1,255',
					'day' 		=> 'require|number|min:1|between:1,255',
				];

				$msg = [
					'closeip1.require' 	=> 'ip不能为空',
					'closeip1.number' 	=> 'ip必须为数字',
					'closeip1.min'		=> 'ip至少需要1位',
					'closeip2.require' 	=> 'ip不能为空',
					'closeip2.number' 	=> 'ip必须为数字',
					'closeip2.min'		=> 'ip至少需要1位',
					'closeip3.require' 	=> 'ip不能为空',
					'closeip3.number' 	=> 'ip必须为数字',
					'closeip3.min'		=> 'ip至少需要1位',
					'closeip4.require' 	=> 'ip不能为空',
					'closeip4.number' 	=> 'ip必须为数字',
					'closeip4.min'		=> 'ip至少需要1位',
					'day.require' 	=> '时间不能为空',
					'day.number' 	=> '时间必须为数字',
					'day.min'		=> '时间至少需要1位',
				];

				$validate = new Validate($rule, $msg);

				if ($validate->check($data)) {
					$rdata['ip'] = ip2long($data['closeip1'].'.'.$data['closeip2'].'.'.$data['closeip3'].'.'.$data['closeip4']);
					$rdata['addtime'] = time();
					$rdata['overtime'] = time() + $data['day'] * 86400;
					Closeip::create($rdata);
					$this->success('添加成功', '', 1, 1);
				}
			}
		}


		if (!Session::has('uid')) {
			$this->error('请先登录', 'login');
		}
		$uid = Session::get('uid');
		$user = User::get($uid);

		$closeIp = Closeip::paginate(5);
		$page = $closeIp->render();
		$this->assign(['user' => $user, 'closeIp' => $closeIp, 'page' => $page]);
		return $this->fetch();
	}

	/**
	 * 美容师管理
	 * @return 美容师管理页面
	 */
	public function beauticianManager()
	{
		if ($_SERVER['REQUEST_METHOD'] == 'POST') {
			// 更新
			if (!empty(input('post.update'))) {
				$rule = [
					'orderby' 	=> 'require|number',
					'name' 		=> 'require',
					'wechat' 	=> 'require',
					'experience'=> 'require',
					'expert' 	=> 'require',
				];

				$msg = [
					'orderby.require' 	=> '显示顺序不能为空',
					'orderby.number' 	=> '显示顺序必须为数字',
					'name.require' 		=> '姓名不能为空',
					'wechat.require' 	=> '联系方式不能为空',
					'experience.require'=> '经历不能为空',
					'expert.require' 	=> '擅长不能为空',			
				];

				$validate = new Validate($rule, $msg);
				// 遍历修改美容师信息
				if (!empty($_POST['orderby'])) {
					foreach($_POST['orderby'] as $key => $value){
						// link信息数组
						$data = [
							'orderby' 	=> $value,
							'name' 		=> $_POST['name'][$key],
							'wechat' 	=> $_POST['wechat'][$key],
							'experience'=> $_POST['experience'][$key],
							'expert'	=> $_POST['expert'][$key],
						];

						if (!$validate->check($data)) {
							// 跳转到美容师页面
							echo '<script>alert("'.$validate->getError().'");location.href="/admin/index/beauticianManager.html"</script>';die;
						}
						// 更新到数据库
						$doctor = new Doctor();
						$doctor->allowField(true)->save($data, ['did' => $key]);
					}
				}
			// 回收站
			} else if (!empty(input('post.delete'))) {
				$data = input('post.did/a');
				if (!empty($data)) {
					$str = join(',', $data);
					Doctor::where('did', 'in', $str)->update(['isdel' => 1]);
				}
			}
		}

		if (!Session::has('uid')) {
			$this->error('请先登录', 'login');
		}
		$uid = Session::get('uid');
		$user = User::get($uid);
		$doctor_info = Doctor::view('Doctor', '*')
							->view('Sort', 'sid, sname', 'Sort.sid = Doctor.sid')
							->where('Doctor.isdel', 0)
							->order('Doctor.orderby', 'desc')
							->select();

		$this->assign(['user' => $user, 'doctor_info' => $doctor_info]);
		return $this->fetch();
	}

	/**
	 * 美容师回收站
	 * @return 美容师回收站页面
	 */
	public function beauticianRecover()
	{
		if ($_SERVER['REQUEST_METHOD'] == 'POST') {
			$data = input('post.did/a');
			if (!empty($data)) {
				// 删除
				if (!empty(input('post.delete'))) {
					Doctor::destroy($data);
				// 恢复
				} else if (!empty(input('post.recover'))) {
					$doctor = new Doctor();
					$doctor->where('did', 'in', $data)->update(['isdel' => 0]);
				}
			}
		}

		if (!Session::has('uid')) {
			$this->error('请先登录', 'login');
		}
		$uid = Session::get('uid');
		$user = User::get($uid);
		$doctor_info = Doctor::where('isdel', 1)->paginate(10);
		$page = $doctor_info->render();

		$this->assign(['user' => $user, 'doctor_info' => $doctor_info, 'page' => $page]);
		return $this->fetch();
	}

	/**
	 * 美容师添加
	 * @return 美容师添加页面
	 */
	public function beauticianAdd()
	{
		if ($_SERVER['REQUEST_METHOD'] == 'POST') {
			$rule = [
				'orderby' 	=> 'require|number',
				'name' 		=> 'require',
				'education' => 'require',
				'experience'=> 'require',
				'expert' 	=> 'require',
				'wechat' 	=> 'require',
			];

			$msg = [
				'orderby.require' 	=> '显示顺序不能为空',
				'orderby.number' 	=> '显示顺序必须为数字',
				'name.require' 		=> '姓名不能为空',
				'education.require' => '学历不能为空',
				'experience.require'=> '经历不能为空',
				'expert.require' 	=> '擅长不能为空',			
				'wechat.require' 	=> '联系方式不能为空',			
			];

			$data = input('post.');

			// 获取表单上传文件 例如上传了001.jpg
			$file = request()->file('picture');
			// 判断上传文件是否为空
			if (empty($file)) {
				// 跳转到美容师添加页面
				echo '<script>alert("图片不能为空");location.href="/admin/index/beauticianAdd.html"</script>';die;
			}

			// 移动到框架应用根目录/public/uploads/ 目录下
			$info = $file->move(ROOT_PATH . 'public' . DS . 'uploads');

			$data['picture'] = '/uploads/'.str_replace('\\', '/', $info->getSaveName());
			$validate = new Validate($rule, $msg);
			if ($validate->check($data)) {
				$data['addtime'] = time();
				unset($data['add']);
				Doctor::create($data);
			}
		}

		if (!Session::has('uid')) {
			$this->error('请先登录', 'login');
		}
		$uid = Session::get('uid');
		$user = User::get($uid);
		$sort = Sort::select();
		$this->assign(['user' => $user, 'sort' => $sort]);
		return $this->fetch();
	}

	public function beauticianOrder()
	{
		if (input('?get.status')) {
			if (input('get.status') == 2) {
				$beautyorder = Beautyorder::get(input('get.id'));
				Beautyorder::where('id', input('get.id'))->update(['status' => 2]);
				$this->success('审核通过');
			} else if (input('get.status') == 4) {
				$beautyorder = Beautyorder::get(input('get.id'));
				Beautyorder::where('id', input('get.id'))->update(['status' => 4]);
				$this->success('审核驳回');
			}
			
		} else if (input('?get.sale')) {
			$beautyorder = Beautyorder::get(input('get.id'));
			$beauty = Beauty::get($beautyorder->bid);
			$sales = $beauty->sales + 1;
			Beauty::where('bid', $beautyorder->bid)->update(['sales' => $sales]);
			Beautyorder::where('id', input('get.id'))->update(['status' => 3, 'rate' => $beauty->payment]);
			$this->success('该订单已完成消费');
		} else if (input('?get.delete')) {
			Beautyorder::destroy(input('get.id'));
		}

		if (!Session::has('uid')) {
			$this->error('请先登录', 'login');
		}
		$color = ['blue', 'green', 'yellow', 'red'];
		$uid = Session::get('uid');
		$user = User::get($uid);

		$beautyorder_info = Beautyorder::view('Beautyorder', '*')
										->view('User', 'uid, username', 'User.uid = Beautyorder.uid')
										->view('Beauty', 'bid, bname, deposit, payment', 'Beauty.bid = Beautyorder.bid')
										->paginate(8);
		$page = $beautyorder_info->render();

		$this->assign(['user' => $user, 'color' => $color, 'beautyorder_info' => $beautyorder_info, 'page' => $page]);
		return $this->fetch();
	}

	public function order()
	{
		if ($_SERVER['REQUEST_METHOD'] == 'POST') {
			$data = input('post.oid/a');
			if (!empty($data)) {
				Order::where('oid', 'in', $data)->update(['isdel' => 1]);
			}
		}

		if (!Session::has('uid')) {
			$this->error('请先登录', 'login');
		}
		$uid = Session::get('uid');
		$user = User::get($uid);

		$order_info = Order::view('Order', '*')
							->view('User', 'uid, username', 'Order.uid = User.uid')
							->view('Goods', 'gid, gname', 'Order.gid = Goods.gid')
							->where('Order.isdel', 0)
							->where('Order.ispay', 1)
							->select();
		$this->assign(['user' => $user, 'order_info' => $order_info]);
		return $this->fetch();
	}

	public function unorder()
	{
		if ($_SERVER['REQUEST_METHOD'] == 'POST') {
			$data = input('post.oid/a');
			if (!empty($data)) {
				Order::where('oid', 'in', $data)->update(['isdel' => 1]);
			}
		}

		if (!Session::has('uid')) {
			$this->error('请先登录', 'login');
		}
		$uid = Session::get('uid');
		$user = User::get($uid);

		$order_info = Order::view('Order', '*')
							->view('User', 'uid, username', 'Order.uid = User.uid')
							->view('Goods', 'gid, gname', 'Order.gid = Goods.gid')
							->where('Order.isdel', 0)
							->where('Order.ispay', 0)
							->select();
		$this->assign(['user' => $user, 'order_info' => $order_info]);
		return $this->fetch();
	}

	public function orderRecover()
	{
		if ($_SERVER['REQUEST_METHOD'] == 'POST') {
			if (input('?post.delete')) {
				Order::destroy(input('post.oid/a'));
			} else if (input('?post.recover')) {
				Order::where('oid', 'in', input('post.oid/a'))->update(['isdel' => 0]);
			}
		}

		if (!Session::has('uid')) {
			$this->error('请先登录', 'login');
		}
		$uid = Session::get('uid');
		$user = User::get($uid);

		$order_info = Order::view('Order', '*')
							->view('User', 'uid, username', 'Order.uid = User.uid')
							->view('Goods', 'gid, gname', 'Order.gid = Goods.gid')
							->where('Order.isdel', 1)
							->select();
		$this->assign(['user' => $user, 'order_info' => $order_info]);
		return $this->fetch();
	}

	public function sort()
	{
		if ($_SERVER['REQUEST_METHOD'] == 'POST') {
			if (input('?post.delete')) {
				if (!empty(input('post.sid/a'))) {
					Sort::destroy(input('post.sid/a'));
				}
			} else if (input('?post.update')) {
				// 遍历修改分类信息
				if (!empty($_POST['orderby'])) {
					foreach($_POST['orderby'] as $key => $value){
						// 分类信息数组
						if (empty($value) || empty($_POST['sname'][$key])) {
							echo '<script>alert("修改信息不能为空");location.href="/admin/index/Sort.html";</script>';
						}
						$data = [
							'orderby' 	=> $value,
							'sname' 	=> $_POST['sname'][$key],
						];
						
						// 更新到数据库
						$doctor = new Sort();
						$doctor->allowField(true)->save($data, ['sid' => $key]);
					}
				}
			}
		}

		if (!Session::has('uid')) {
			$this->error('请先登录', 'login');
		}
		$uid = Session::get('uid');
		$user = User::get($uid);

		$sort_info = Sort::order('orderby', 'desc')->select();

		$this->assign(['user' => $user, 'sort_info' => $sort_info]);
		return $this->fetch();
	}

	public function sortAdd()
	{
		if ($_SERVER['REQUEST_METHOD'] == 'POST') {
			$data = input('post.');
			if (!empty($data['orderby']) && !empty($data['sname'])) {
				unset($data['add']);
				Sort::create($data);
			}
		}

		if (!Session::has('uid')) {
			$this->error('请先登录', 'login');
		}
		$uid = Session::get('uid');
		$user = User::get($uid);
		$this->assign('user', $user);
		return $this->fetch();
	}

	public function itemsManager()
	{
		if ($_SERVER['REQUEST_METHOD'] == 'POST') {
			if (input('?post.delete')) {
				$data = input('post.bid/a');
				Beauty::where('bid', 'in', $data)->update(['isdel' => 1]);
			} else if (input('?post.update')) {
				$rule = [
					'bname'				=> 'require',
					'description'		=> 'require',
					'deposit'			=> 'number|require',
					'payment'			=> 'number|require',
					'sort_id'			=> 'require',
				];

				$msg = [
					'bname.require' 			=> '项目名不能为空',
					'description.require' 		=> '项目描述不能为空',
					'deposit.number' 			=> '定金必须为数字',
					'deposit.require' 			=> '定金不能为空',
					'payment.number' 			=> '全额必须为数字',
					'payment.require' 			=> '全额不能为空',
					'sort_id.require' 			=> '类别不能为空',
				];
				$validate = new Validate($rule, $msg);
				// 遍历修改信息
				if (!empty($_POST['bname'])) {
					foreach($_POST['bname'] as $key => $value){
						// link信息数组
						if (empty($value) || empty($_POST['bname'][$key]) || empty($_POST['description'][$key]) || empty($_POST['deposit'][$key]) || empty($_POST['payment'][$key]) || empty($_POST['sort_id'][$key])) {
							echo '<script>alert("修改信息不能为空");location.href="/admin/index/itemsManager.html"</script>';
						}
						$data = [
							'bname' 		=> $_POST['bname'][$key],
							'description' 	=> $_POST['description'][$key],
							'deposit'		=> $_POST['deposit'][$key],
							'payment'		=> $_POST['payment'][$key],
							'sort_id'		=> $_POST['sort_id'][$key],
						];


						if (!$validate->check($data)) {
							// 跳转到美容师页面
							echo '<script>alert("'.$validate->getError().'");location.href="/admin/index/itemsManager.html"</script>';die;
						}
						// 更新到数据库
						$goods = new Beauty();
						$goods->allowField(true)->save($data, ['bid' => $key]);
					}
				}
			}
		}

		if (!Session::has('uid')) {
			$this->error('请先登录', 'login');
		}
		$uid = Session::get('uid');
		$user = User::get($uid);

		$beauty_info = Beauty::where('isdel', 0)->select();
		$sort_data = Sort::select();

		$this->assign(['user' => $user, 'beauty_info' => $beauty_info, 'sort_data' => $sort_data]);
		return $this->fetch();
	}

	public function itemsRecover()
	{
		if ($_SERVER['REQUEST_METHOD'] == 'POST') {
			if (input('post.delete')) {
				Beauty::destroy(input('post.bid/a'));
			} else if (input('post.recover')) {
				Beauty::where('bid', 'in', input('post.bid/a'))->update(['isdel' => 0]);
			}
		}

		if (!Session::has('uid')) {
			$this->error('请先登录', 'login');
		}
		$uid = Session::get('uid');
		$user = User::get($uid);

		$beauty_info = Beauty::where('isdel', 1)->paginate(10);
		$page = $beauty_info->render();
		$sort_data = Sort::select();

		$this->assign(['user' => $user, 'beauty_info' => $beauty_info, 'sort_data' => $sort_data, 'page' => $page]);
		return $this->fetch();
	}

	public function itemsAdd()
	{
		if ($_SERVER['REQUEST_METHOD'] == 'POST') {
			$data = input('post.');
			$rule = [
				'bname'				=> 'require',
				'description'		=> 'require',
				'deposit'			=> 'number|require',
				'payment'			=> 'number|require',
				'product_id'		=> 'number|require',
				'sort_id'			=> 'require',
				'description_1'		=> 'require',
				'description_2'		=> 'require',
				'description_3'		=> 'require',
			];

			$msg = [
				'bname.require' 			=> '项目名不能为空',
				'description.require' 		=> '项目描述不能为空',
				'current_price.number' 		=> '定金必须为数字',
				'current_price.require' 	=> '定金不能为空',
				'original_price.number' 	=> '全额必须为数字',
				'original_price.require' 	=> '全额不能为空',
				'product_id.number' 		=> '商品编号必须为数字',
				'product_id.require' 		=> '商品编号不能为空',
				'sort_id.require' 			=> '类别不能为空',
				'description_1.require' 	=> '项目详情描述不能为空',
				'description_2.require' 	=> '项目详情描述不能为空',
				'description_3.require' 	=> '项目详情描述不能为空',
			];
			$validate = new Validate($rule, $msg);
			if ($validate->check($data)) {
				// 获取表单上传文件 例如上传了001.jpg
				$file = request()->file('images');
				$file1 = request()->file('detail_1');
				$file2 = request()->file('detail_2');
				$file3 = request()->file('detail_3');
				// 判断上传文件是否为空
				if (empty($file) || empty($file1) || empty($file2) || empty($file3)) {
					// 跳转到商品添加页面
					echo '<script>alert("图片不能为空");location.href="/admin/index/itemsAdd.html";</script>';die;
				}

				// 移动到框架应用根目录/public/uploads/ 目录下
				$info = $file->move(ROOT_PATH . 'public' . DS . 'uploads');
				$info1 = $file1->move(ROOT_PATH . 'public' . DS . 'uploads');
				$info2 = $file2->move(ROOT_PATH . 'public' . DS . 'uploads');
				$info3 = $file3->move(ROOT_PATH . 'public' . DS . 'uploads');

				$data['images'] = '/uploads/'.str_replace('\\', '/', $info->getSaveName());
				$detail_1 = '<img src="/uploads/'.str_replace('\\', '/', $info1->getSaveName()).'" />';
				$description_1 = '<p>'.$data['description_1'].'</p>';
				$detail_2 = '<img src="/uploads/'.str_replace('\\', '/', $info2->getSaveName()).'" />';
				$description_2 = '<p>'.$data['description_2'].'</p>';
				$detail_3 = '<img src="/uploads/'.str_replace('\\', '/', $info3->getSaveName()).'" />';
				$description_3 = '<p>'.$data['description_3'].'</p>';
				$data['detail'] = $detail_1.$description_1.$detail_2.$description_2.$detail_3.$description_3;
				$data['addtime'] = time();
				$beauty = new Beauty($data);
				$beauty->allowField(true)->save();
			}
		}

		if (!Session::has('uid')) {
			$this->error('请先登录', 'login');
		}
		$uid = Session::get('uid');
		$user = User::get($uid);

		$sort_data = Sort::select();

		$this->assign(['user' => $user, 'sort_data' => $sort_data]);
		return $this->fetch();
	}

	public function goodsSort()
	{
		if ($_SERVER['REQUEST_METHOD'] == 'POST') {
			if (input('?post.delete')) {
				if (!empty(input('post.id/a'))) {
					Goodssort::destroy(input('post.id/a'));
				}
			} else if (input('?post.update')) {
				// 遍历修改分类信息
				if (!empty($_POST['orderby'])) {
					foreach($_POST['orderby'] as $key => $value){
						// 分类信息数组
						if (empty($value) || empty($_POST['name'][$key])) {
							echo '<script>alert("修改信息不能为空");location.href="/admin/index/goodsSort.html"</script>';
						}
						$data = [
							'orderby' 	=> $value,
							'name' 		=> $_POST['name'][$key],
						];
						
						// 更新到数据库
						$doctor = new Goodssort();
						$doctor->allowField(true)->save($data, ['id' => $key]);
					}
				}
			}
		}

		if (!Session::has('uid')) {
			$this->error('请先登录', 'login');
		}
		$uid = Session::get('uid');
		$user = User::get($uid);

		$sort_info = Goodssort::order('orderby', 'desc')->select();

		$this->assign(['user' => $user, 'sort_info' => $sort_info]);
		return $this->fetch();
	}

	public function goodsSortAdd()
	{
		if ($_SERVER['REQUEST_METHOD'] == 'POST') {
			
			$data = input('post.');
			if (!empty($data['orderby']) && !empty($data['name'])) {
				unset($data['add']);
				Goodssort::create($data);
			}
		}

		if (!Session::has('uid')) {
			$this->error('请先登录', 'login');
		}
		$uid = Session::get('uid');
		$user = User::get($uid);
		$this->assign('user', $user);
		return $this->fetch();
	}

	public function goodsManager()
	{
		if ($_SERVER['REQUEST_METHOD'] == 'POST') {
			if (input('?post.delete')) {
				$data = input('post.gid/a');
				Goods::where('gid', 'in', $data)->update(['isdel' => 1]);
			} else if (input('?post.update')) {
				$rule = [
					'gname'				=> 'require',
					'description'		=> 'require',
					'current_price'		=> 'number|require',
					'original_price'	=> 'number|require',
					'sort_id'			=> 'require',
				];

				$msg = [
					'gname.require' 			=> '商品名不能为空',
					'description.require' 		=> '描述不能为空',
					'current_price.number' 		=> '现价必须为数字',
					'current_price.require' 	=> '现价不能为空',
					'original_price.number' 	=> '原价必须为数字',
					'original_price.require' 	=> '原价不能为空',
					'sort_id.require' 			=> '类别不能为空',	
				];
				$validate = new Validate($rule, $msg);
				// 遍历修改信息
				if (!empty($_POST['gname'])) {
					foreach($_POST['gname'] as $key => $value){
						// link信息数组
						if (empty($value) || empty($_POST['gname'][$key]) || empty($_POST['description'][$key]) || empty($_POST['current_price'][$key]) || empty($_POST['original_price'][$key]) || empty($_POST['sort_id'][$key])) {
							echo '<script>alert("修改信息不能为空");location.href="/admin/index/goodsManager.html"</script>';
						}
						$data = [
							'gname' 		=> $_POST['gname'][$key],
							'description' 	=> $_POST['description'][$key],
							'current_price'	=> $_POST['current_price'][$key],
							'original_price'=> $_POST['original_price'][$key],
							'sort_id'		=> $_POST['sort_id'][$key],
						];


						if (!$validate->check($data)) {
							// 跳转到美容师页面
							echo '<script>alert("'.$validate->getError().'");location.href="/admin/index/goodsManager.html"</script>';die;
						}
						// 更新到数据库
						$goods = new Goods();
						$goods->allowField(true)->save($data, ['gid' => $key]);
					}
				}
			}
		}

		if (!Session::has('uid')) {
			$this->error('请先登录', 'login');
		}
		$uid = Session::get('uid');
		$user = User::get($uid);

		$goods_info = Goods::where('isdel', 0)->select();
		$sort_data = Goodssort::select();

		$this->assign(['user' => $user, 'goods_info' => $goods_info, 'sort_data' => $sort_data]);
		return $this->fetch();
	}

	public function goodsRecover()
	{
		if ($_SERVER['REQUEST_METHOD'] == 'POST') {
			if (input('post.delete')) {
				Goods::destroy(input('post.gid/a'));
			} else if (input('post.recover')) {
				Goods::where('gid', 'in', input('post.gid/a'))->update(['isdel' => 0]);
			}
		}

		if (!Session::has('uid')) {
			$this->error('请先登录', 'login');
		}
		$uid = Session::get('uid');
		$user = User::get($uid);

		$goods_info = Goods::where('isdel', 1)->paginate(10);
		$page = $goods_info->render();
		$sort_data = Goodssort::select();

		$this->assign(['user' => $user, 'goods_info' => $goods_info, 'sort_data' => $sort_data, 'page' => $page]);
		return $this->fetch();
	}

	public function goodsAdd()
	{
		if ($_SERVER['REQUEST_METHOD'] == 'POST') {
			$data = input('post.');
			$rule = [
				'gname'				=> 'require',
				'description'		=> 'require',
				'current_price'		=> 'number|require',
				'original_price'	=> 'number|require',
				'product_id'		=> 'number|require',
				'shipping_address'	=> 'require',
				'sort_id'			=> 'require',
			];

			$msg = [
				'gname.require' 			=> '商品名不能为空',
				'description.require' 		=> '描述不能为空',
				'current_price.number' 		=> '现价必须为数字',
				'current_price.require' 	=> '现价不能为空',
				'original_price.number' 	=> '原价必须为数字',
				'original_price.require' 	=> '原价不能为空',
				'product_id.number' 		=> '商品编号必须为数字',
				'product_id.require' 		=> '商品编号不能为空',
				'shipping_address.require' 	=> '产地不能为空',	
				'sort_id.require' 			=> '类别不能为空',	
			];
			$validate = new Validate($rule, $msg);
			if ($validate->check($data)) {
				// 获取表单上传文件 例如上传了001.jpg
				$file = request()->file('images');
				$file1 = request()->file('detail_1');
				$file2 = request()->file('detail_2');
				$file3 = request()->file('detail_3');
				$file4 = request()->file('detail_4');
				// 判断上传文件是否为空
				if (empty($file) || empty($file1) || empty($file2) || empty($file3) || empty($file4)) {
					// 跳转到商品添加页面
					echo '<script>alert("图片不能为空");location.href="/admin/index/goodsAdd.html";</script>';die;
				}

				// 移动到框架应用根目录/public/uploads/ 目录下
				$info = $file->move(ROOT_PATH . 'public' . DS . 'uploads');
				$info1 = $file1->move(ROOT_PATH . 'public' . DS . 'uploads');
				$info2 = $file2->move(ROOT_PATH . 'public' . DS . 'uploads');
				$info3 = $file3->move(ROOT_PATH . 'public' . DS . 'uploads');
				$info4 = $file4->move(ROOT_PATH . 'public' . DS . 'uploads');

				$data['images'] = '/uploads/'.str_replace('\\', '/', $info->getSaveName());
				$detail_1 = '<img src="/uploads/'.str_replace('\\', '/', $info1->getSaveName()).'" />';
				$detail_2 = '<img src="/uploads/'.str_replace('\\', '/', $info2->getSaveName()).'" />';
				$detail_3 = '<img src="/uploads/'.str_replace('\\', '/', $info3->getSaveName()).'" />';
				$detail_4 = '<img src="/uploads/'.str_replace('\\', '/', $info4->getSaveName()).'" />';
				$data['detail'] = $detail_1.$detail_2.$detail_3.$detail_4;
				$data['addtime'] = time();
				Goods::create($data);
			}
		}

		if (!Session::has('uid')) {
			$this->error('请先登录', 'login');
		}
		$uid = Session::get('uid');
		$user = User::get($uid);

		$sort_data = Goodssort::select();

		$this->assign(['user' => $user, 'sort_data' => $sort_data]);
		return $this->fetch();
	}


	public function messageManager()
	{
		if ($_SERVER['REQUEST_METHOD'] == 'POST') {
			$data = input('post.mid/a');
			if (!empty($data)) {
				Message::where('mid', 'in', $data)->update(['isdel' => 1]);
			}
		} else if (input('?get.mid')) {
			$mid = input('get.mid');
			Message::where('mid', $mid)->update(['issend' => 1]);
		}

		if (!Session::has('uid')) {
			$this->error('请先登录', 'login');
		}
		$uid = Session::get('uid');
		$user = User::get($uid);

		$message_info = Message::view('Message', '*')
								->view('Sort', 'sid, sname', 'Sort.sid = Message.sort_id')
								->where('Message.isdel', 0)
								->select();

		$this->assign(['user' => $user, 'message_info' => $message_info]);
		return $this->fetch();
	}

	public function messageRecover()
	{
		if ($_SERVER['REQUEST_METHOD'] == 'POST') {
			if (input('?post.delete')) {
				Message::destroy(input('post.mid/a'));	
			} else if (input('?post.recover')) {
				Message::where('mid', 'in', input('post.mid/a'))->update(['isdel' => 0]);
			}
		}

		if (!Session::has('uid')) {
			$this->error('请先登录', 'login');
		}
		$uid = Session::get('uid');
		$user = User::get($uid);

		$message_info = Message::where('isdel', 1)->paginate(10);
		$page = $message_info->render();

		$this->assign(['user' => $user, 'message_info' => $message_info, 'page' => $page]);
		return $this->fetch();
	}


	/**
	 * 退出登录
	 * @return 前台首页
	 */
	public function layout()
	{
		Session::clear();
		$this->success('退出成功', 'index/index/index');
	}
}