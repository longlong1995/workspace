<?php
namespace app\admin\model;
use think\Model;
class User extends Model
{
	protected $auto = ['ip'];
	protected $autoWriteTimestamp = true;
	public function setIpAttr()
	{
		return ip2long(request()->ip());
	}

	public function getIpAttr($value)
	{
		return long2ip($value);
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

	public function getUsertypeAttr($value)
	{
		$status = [0 => '普通用户', 1 => '管理员'];
		return $status[$value];
	}
}