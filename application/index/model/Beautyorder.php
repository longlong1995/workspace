<?php
namespace app\index\model;
use think\Model;
class Beautyorder extends Model
{
	public function getStatusAttr($value)
	{
		$status = [0 => '未付定金', 1 => '待审核', 2 => '未付全款(预约成功)', 3 => '已消费(已付全款)', 4 => '预约驳回'];
		return $status[$value];
	}
}