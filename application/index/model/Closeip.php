<?php
namespace app\index\model;
use think\Model;
class Closeip extends Model
{
	public function getIpAttr($value)
	{
		return long2ip($value);
	}
}