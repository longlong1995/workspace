<?php
namespace app\index\controller;
use think\Controller;
use app\index\model\User as UserModel;
use app\index\validate\User as UserValidate;
use traits\controller\Jump;
use app\index\model\Closeip;
use think\Session;
use think\Upload;
use think\Request;
use think\Cookie;
use app\extra\php\api_demo\SmsDemo;
class User extends Controller
{
	public function login()
	{
		//登陆页面
		if ($_SERVER['REQUEST_METHOD'] == 'POST') {
			if (input('?post.login')) {
				$data = input('post.');
				$user = UserModel::get(['username' => $data['username']]);
				$request = Request::instance();
	            $ip = ip2long($request->ip());
	            if (!strcmp($ip, '::1')) {
					$ip = '127.0.0.1';
				} 
				$ip = ip2long($ip);

				// 查询禁止表
				$closeip = Closeip::getByIp($ip);
				
				// 匹配注册ip是否被禁止
				if ($closeip) {
					// 判断当前时间有没有达到结束时间数
					if (time() < $closeip->overtime) {
						$this->error('当前IP已被锁定', 'index/index/index,html');
					} else {
						Closeip::destroy($closeip->id);
					}
				}
				if ($user) {
					if ($user->allow_login == 0) {
							if ($user->password == MD5($data['password'])) {
								Session::set('username', $user->username);
								Session::set('usertype', $user->usertype);
								Session::set('uid', $user->uid);
								UserModel::where('uid', $user->uid)->update(['last_time' => time()]);
								
								$this->success('登陆成功', $data['url']);
							} else {
								$this->error('用户名或密码错误');
							}

					} else {
						$this->error('当前用户已被锁定');
					}
				} else {
					$this->error('用户名或密码错误');
				}
			}
				
		}
		if (empty($_SERVER['HTTP_REFERER'])) {
			$url = '/index/index/index.html';
		} else {
			$url = $_SERVER['HTTP_REFERER'];
		}
		$this->assign('url', $url);
		return $this->fetch();
	}

	 //注册页面
	public function register()
	{
	 if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            // 接收前台post方式提交过来的数据
            $data = input('post.');
             // var_dump($data);die;
            
            // 检查用户名是否已经存在
            $user = UserModel::getByUsername($data['username']);
            if ($user) {
            	$this->error('当前用户名已经存在');
            }
            // 一个手机号只能注册一个帐号
            $phone = UserModel::getByPhone($data['phone']);
            if ($phone) {
            	$this->error('该手机号已经被注册');
            }
            $data['last_time'] = time();
            $request = Request::instance();
            $ip = ip2long($request->ip());
            if (!strcmp($ip, '::1')) {
				$ip = '127.0.0.1';
			} 

			$ip = ip2long($ip);
			// 查询禁止表
			$closeip = Closeip::getByIp($ip);
			
			// 匹配注册ip是否被禁止
			if ($closeip) {
				// 判断当前时间有没有达到结束时间数
				if (time() < $closeip->overtime) {
					$this->error('当前IP已被锁定', 'index/index/index');
				} else {
					Closeip::destroy($closeip->id);
				}
			}
			
           		 $data['ip'] = $ip;
           		 // 验证手机号
			if (empty(Cookie::get('phonecode'))) {
				$this->error('验证码不能为空');
			} else if (Cookie::get('phonecode') != $data['code']) {
				$this->error('验证码错误');
			} else if (Cookie::get('phone') != $data['phone']) {
				$this->error('手机号和验证码不匹配');
			}

			// 验证
			$validate =  new UserValidate();
            		if (!$validate->check($data)) {
               		 	return  $this->error($validate->getError());
            		}
			//把数据插入到数据库
            		$user = new UserModel($data);
            		$result = $user->allowField(true)->save();
            		if ($result) {
            			$this->success('注册成功');

            		} else {
            			$this->error('注册失败');
            		}
	  	}
		echo '<script>location.href="/index/index/index.html";</script>';       
	}
	//手机验证码方法
	public function phonecode()
	{
		$demo = new SmsDemo(
		    "LTAIXlVAp4r0oGoJ",
		    "XRpjtqkz7URDssewBtSWXQgyJVbgsA"
		);
		$phone = $_POST['phone'];
		$phonecode = mt_rand(100000, 999999);
		Cookie::set('phone', $phone, 1800);
		Cookie::set('phonecode', $phonecode, 1800);
		$response = $demo->sendSms(
		    "千锋马甲线", // 短信签名
		    "SMS_100510005", // 短信模板编号
		    $phone, // 短信接收者
		    Array(  // 短信模板中字段的值
		        "code"=>$phonecode,
		        "product"=>"dsd"
		    ),
		    "123"
		);
		
		$date = date('Ymd', time());
		
		$response = $demo->queryDetails(
		    $phone,  // phoneNumbers 电话号码
		    $date, // sendDate 发送时间
		    10, // pageSize 分页大小
		    1 // currentPage 当前页码
		    // "abcd" // bizId 短信发送流水号，选填
		);
		
	}
	
	// qq登录
	public function qqlogin()
	{
		if (!empty($_GET['code'])) {
			$code = $_GET['code'];
			$state = $_GET['state'];
			$a = file_get_contents('https://graph.qq.com/oauth2.0/token?grant_type=authorization_code&client_id=101435300&client_secret=6c78e370caea35129d3f19afbb775b5e&code='.$code.'&redirect_uri=http://www.cllscc.com/index/user/qqlogin');

			$token= strstr(strstr($a,'&', true), '=');

			$b = file_get_contents('https://graph.qq.com/oauth2.0/me?access_token'.$token);
			$b = substr(strstr(strstr($b, 'openid":"'),'"}' , true), 9);

			$c= file_get_contents('https://graph.qq.com/user/get_user_info?access_token'.$token.'&oauth_consumer_key=101435300&openid='.$b);
			
			$qqarray = json_decode($c, true);
			$qqmsg = UserModel::getByUsername($qqarray['nickname']);
			if ($qqmsg) {
				$ip = request()->ip();
				$ip = ip2long($ip);
				$closeip = Closeip::getByIp($ip);
			
				// 匹配注册ip是否被禁止
				if ($closeip) {
					// 判断当前时间有没有达到结束时间数
					if (time() < $closeip->overtime) {
						echo '<script>alert("当前IP已被锁定");location.href="/index/index/index.html";</script>';die;
					} else {
						Closeip::destroy($closeip->id);
					}
				}
				
				if ($qqmsg->allow_login == 1) {
					$this->error('当前用户已被锁定');
				}

				Session::set('username', $qqmsg->username);
				Session::set('usertype', $qqmsg->usertype);
				Session::set('uid', $qqmsg->uid);
				echo "<script> (alert( '欢迎回来！登录成功!'));location.href='/index/index/index.html';</script>";
			}else{
				$data['username'] = $qqarray['nickname'];
				$data['picture'] = $qqarray['figureurl_1'];
				$data['sex'] = $qqarray['gender'] == '男' ? 0 : ($qqarray['gender'] == '女' ? 1 : 2) ;
				$data['last_time'] = time();
				$ip = request()->ip();
				$ip = ip2long($ip);
				$closeip = Closeip::getByIp($ip);
			
				// 匹配注册ip是否被禁止
				if ($closeip) {
					// 判断当前时间有没有达到结束时间数
					if (time() < $closeip->overtime) {
						echo '<script>alert("当前IP已被锁定");location.href="/index/index/index.html";</script>';die;
					} else {
						Closeip::destroy($closeip->id);
					}
				}

				$data['ip'] = $ip;
				$data['usertype'] = 0;
				$data['password'] = '111111';
				$user = new UserModel($data);
				$user->save();
				Session::set('username', $data['username']);
				Session::set('usertype', 0);
				Session::set('uid', $user->uid);
				echo "<script> (alert('您是qq登录新用户，已注册成功，下次可用qq登录！'));location.href='/index/index/index.html'</script>";
			}
		}
	}

	public function sina()
	{
		//定义一个要发送的目标URL
		$code = input('get.code');
		$url = 'https://api.weibo.com/oauth2/access_token?client_id=940227746&client_secret=3b5f48e0fbb424fb1adcadbc708f3101&redirect_uri=http://www.cllscc.com/index/user/sina.html&code='.$code;
		
		//定义传递的参数数
		$data = ['grant_type' => 'authorization_code'];
		//定义返回值接收变量
		$str = $this->http($url, $data, 'POST', array("Content-type: text/html; charset=utf-8"));
		$str = json_decode($str);
		
		$url = 'https://api.weibo.com/2/users/show.json';
		$arr['access_token'] = $str->access_token;
		$arr['uid'] = $str->uid;
		$str = $this->http($url, $arr, 'GET', array("Content-type: text/html; charset=utf-8"));
		$str = json_decode($str);
		
		$qqmsg = UserModel::getByUsername($str->name);
		if ($qqmsg) {
			$ip = request()->ip();
			$ip = ip2long($ip);
			$closeip = Closeip::getByIp($ip);
			
			// 匹配注册ip是否被禁止
			if ($closeip) {
				// 判断当前时间有没有达到结束时间数
				if (time() < $closeip->overtime) {
					echo '<script>alert("当前IP已被锁定");location.href="/index/index/index.html";</script>';die;
				} else {
					Closeip::destroy($closeip->id);
				}
			}
				
			if ($qqmsg->allow_login == 1) {
				$this->error('当前用户已被锁定');
			}

			Session::set('username', $qqmsg->username);
			Session::set('usertype', $qqmsg->usertype);
			Session::set('uid', $qqmsg->uid);
			echo "<script> (alert( '欢迎回来！登录成功!'));location.href='/index/index/index.html';</script>";
		} else {
			$rdata['username'] = $str->name;
			$rdata['picture'] = $str->profile_image_url;
			$rdata['sex'] = 2;
			$rdata['last_time'] = time();
			$ip = request()->ip();
			$ip = ip2long($ip);
			$closeip = Closeip::getByIp($ip);
		
			// 匹配注册ip是否被禁止
			if ($closeip) {
				// 判断当前时间有没有达到结束时间数
				if (time() < $closeip->overtime) {
					echo '<script>alert("当前IP已被锁定");location.href="/index/index/index.html";</script>';die;
				} else {
					Closeip::destroy($closeip->id);
				}
			}

			$rdata['ip'] = $ip;
			$rdata['usertype'] = 0;
			$rdata['password'] = '111111';
			$user = new UserModel($rdata);
			$user->save();
			Session::set('username', $rdata['username']);
			Session::set('usertype', 0);
			Session::set('uid', $user->uid);
			echo "<script> (alert('您是微博登录新用户，已注册成功，下次可用微博登录！'));location.href='/index/index/index.html'</script>";

		}

	}
	
	/** 
	 * 发送HTTP请求方法 
 	* @param  string $url    请求URL 
 	* @param  array  $params 请求参数 
 	* @param  string $method 请求方法GET/POST 
	 * @return array  $data   响应数据 
	*/
	function http($url, $params, $method = 'GET', $header = array(), $multi = false){  
    		$opts = array(  
           		CURLOPT_TIMEOUT        => 30,  
            		CURLOPT_RETURNTRANSFER => 1,  
            		CURLOPT_SSL_VERIFYPEER => false,  
            		CURLOPT_SSL_VERIFYHOST => false,  
            		CURLOPT_HTTPHEADER     => $header  
    		);  
   		/* 根据请求类型设置特定参数 */  
    		switch(strtoupper($method)){  
        		case 'GET':  
            		$opts[CURLOPT_URL] = $url . '?' . http_build_query($params);  
            		break;  
        		case 'POST':  
            		//判断是否传输文件  
            		$params = $multi ? $params : http_build_query($params);  
           		$opts[CURLOPT_URL] = $url;  
            		$opts[CURLOPT_POST] = 1;  
            		$opts[CURLOPT_POSTFIELDS] = $params;  
            		break;  
        		default:  
            		throw new Exception('不支持的请求方式！');  
    		}  
    		/* 初始化并执行curl请求 */  
    		$ch = curl_init();  
    		curl_setopt_array($ch, $opts);
    		$data  = curl_exec($ch);
    		$error = curl_error($ch);  
    		curl_close($ch);  
    		if($error) throw new Exception('请求发生错误：' . $error);  
    		return  $data;  
	}  
	
	
	// 手机号注册查询
	public function phone()
	{
		$phone = $_POST['phone'];
		$result = UserModel::getByPhone($phone);
		if ($result) {
			echo json_encode('false');
		} else {
			echo json_encode('true');
		}
	}
	
	// 用户名查询
	public function username()
	{
		$username = $_POST['username'];
		$result = UserModel::getByUsername($username);
		if ($result) {
			echo json_encode('false');
		} else {
			echo json_encode('true');
		}
	}
	
	/**
	 * 修改收货地址
	 */
	public function updatePlace()
	{
		if ($_SERVER['REQUEST_METHOD'] == 'POST') {
			include 'index/js/area.php';
			$data = input('post.');
			if (empty($data['seachprov']) || empty($data['homecity'])) {
				echo '<script>alert("地址不能为空");location.href="/index/index/shop_cart.html";</script>';
			}
			if (empty($data['seachdistrict'])) {
				$place = $area_array[$data['seachprov']].$sub_array[$data['seachprov']][$data['homecity']].$data['placeinfo'];
			} else {
				$place = $area_array[$data['seachprov']].$sub_array[$data['seachprov']][$data['homecity']].$sub_arr[$data['homecity']][$data['seachdistrict']].$data['placeinfo'];
			}
			$uid = Session::get('uid');
			$user = new UserModel();
			$user->allowField(true)->save(['place' => $place], ['uid' => $uid]);
			echo '<script>alert("修改地址成功");location.href="/index/index/shop_cart.html";</script>';
		}
	}

	/**
	 * 退出登录
	 */
	public function logout()
	{
		// 清空session
		Session::clear();
        $this->success('退出成功', 'index/index/index');
	}
}