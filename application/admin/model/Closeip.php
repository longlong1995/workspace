<?php
namespace app\admin\model;
use think\Model;
class Closeip extends Model
{
	public function getIpAttr($value)
	{
		return long2ip($value);
	}

	public function getAddtimeAttr($value)
	{
		return date('Y-m-d H:i:s', $value);
	}

	public function getOvertimeAttr($value)
	{
		return date('Y-m-d H:i:s', $value);
	}
}