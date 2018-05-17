<?php
namespace app\index\model;
use think\Model;
use traits\model\SoftDelete;
class User extends Model
{
	// use SoftDelete;
	// protected static $deleteTime = 'delete_time';
	protected $auto = ['ip', 'password'];
	protected $autoWriteTimestamp = true;
	public function setIpAttr()
	{
		return ip2long(request()->ip());
	}
	public function setPasswordAttr($value)
	{
		return md5($value);
	}
	public function getSexAttr($value)
	{
		$status = [0 => '男', 1 => '女', 2 => '保密'];
		return $status[$value];
	}

	public function setUsernameAttr($value)
	{
		return strtolower($value);
	}
}