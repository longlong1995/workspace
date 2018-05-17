<?php
namespace app\admin\model;
use think\Model;
class Beautyorder extends Model
{
	public function getStatusAttr($value)
	{
		$status = [0 => '未付定金', 1 => '未审核', 2 => '预约成功', 3 => '已消费(已付全款)', 4 => '预约驳回'];
		return $status[$value];
	}
}