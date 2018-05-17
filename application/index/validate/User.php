<?php
namespace app\index\validate;
use think\Validate;
class User extends Validate
{
	protected $rule = [
		'username' => 'require|min:6',
		'password' => 'require|min:6',
		'phone'	   => 'require|min:11|max:11',
		'code'	   => 'require|min:6|max:6',
	];

	protected $msg = [
		'username.require' => '用户名不能为空',
		'username.min' => '用户名不少于6位',
		'password.require' => '密码不能为空',
		'password.min' => '密码至少是6位',
		'phone.require' => '手机号不能为空',
		'phone.min' => '手机号必须为11位',
		'phone.max' => '手机号必须为11位',
		'code.require' => '验证码不能为空',
		'code.min' => '验证码必须为6位',
		'code.max' => '验证码必须为6位',
	];

	public function __construct()
	{	
		parent::__construct($this->rule, $this->msg);
	}
}