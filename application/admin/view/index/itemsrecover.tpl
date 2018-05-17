<!DOCTYPE html>
<html>

<head>
    <title>{$Think.const.WEB_NAME}后台管理中心</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSS Libs -->
    <link rel="stylesheet" type="text/css" href="/admin/lib/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/admin/lib/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="/admin/lib/css/animate.min.css">
    <link rel="stylesheet" type="text/css" href="/admin/lib/css/bootstrap-switch.min.css">
    <link rel="stylesheet" type="text/css" href="/admin/lib/css/checkbox3.min.css">
    <link rel="stylesheet" type="text/css" href="/admin/lib/css/jquery.dataTables.min.css">
    <link rel="stylesheet" type="text/css" href="/admin/lib/css/dataTables.bootstrap.css">
    <link rel="stylesheet" type="text/css" href="/admin/lib/css/select2.min.css">
    <!-- CSS App -->
    <link rel="stylesheet" type="text/css" href="/admin/css/style.css">
    <link rel="stylesheet" type="text/css" href="/admin/css/themes/flat-blue.css">
</head>

<body class="flat-blue">
    <div class="app-container">
        <div class="row content-container">
            <nav class="navbar navbar-default navbar-fixed-top navbar-top">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-expand-toggle">
                            <i class="fa fa-bars icon"></i>
                        </button>
                        <ol class="breadcrumb navbar-breadcrumb">
                            <li>美容中心</li>
                            <li class="active">项目回收站</li>
                        </ol>
                        <button type="button" class="navbar-right-expand-toggle pull-right visible-xs">
                            <i class="fa fa-th icon"></i>
                        </button>
                    </div>
                    <ul class="nav navbar-nav navbar-right">
                        <button type="button" class="navbar-right-expand-toggle pull-right visible-xs">
                            <i class="fa fa-times icon"></i>
                        </button>
                        <li class="dropdown">
                            <a href="/index/index/index.html" target="_blank" class="dropdown-toggle" role="button" aria-expanded="false">首页</a>
                        </li>
                       
                        <li class="dropdown profile">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">{$user.username} <span class="caret"></span></a>
                            <ul class="dropdown-menu animated fadeInDown">
                                <li class="profile-img">
                                    <img src="{$user.picture}">
                                </li>
                                <li>
                                    <div class="profile-info">
                                        <h4 class="username">{$user.real_name}</h4>
                                        <p>tell:{$user.phone}</p>
                                        <div class="btn-group margin-bottom-2x" role="group">
                                            <a href="userInfo.html?uid={$user.uid}">
                                                <button type="button" class="btn btn-default"><i class="fa fa-user"></i> 详情</button>
                                            </a>
                                            <a href="layout.html">
                                                <button type="button" class="btn btn-default"><i class="fa fa-sign-out"></i> 退出</button>
                                            </a>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>
            <div class="side-menu sidebar-inverse">
                <nav class="navbar navbar-default" role="navigation">
                    <div class="side-menu-container">
                        <div class="navbar-header">
                            <a class="navbar-brand" href="#">
                                <div class="icon fa fa-paper-plane"></div>
                                <div class="title">后台管理 v1.0</div>
                            </a>
                            <button type="button" class="navbar-expand-toggle pull-right visible-xs">
                                <i class="fa fa-times icon"></i>
                            </button>
                        </div>
                        <ul class="nav navbar-nav">
                            <li>
                                <a href="index.html">
                                    <span class="icon fa fa-tachometer"></span><span class="title">首页</span>
                                </a>
                            </li>
                            <li class="panel panel-default dropdown ">
                                <a data-toggle="collapse" href="#dropdown-element">
                                    <span class="icon fa fa-desktop"></span>
                                    <span class="title">站点中心</span>
                                </a>
                                <!-- Dropdown level 1 -->
                                <div id="dropdown-element" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ul class="nav navbar-nav">
                                            <li>
                                                <a href="web.html">
                                                    站点信息
                                                </a>
                                            </li>
                                            <li>
                                                <a href="logo.html">
                                                    网站LOGO
                                                </a>
                                            </li>
                                            <li>
                                                <a href="carousel.html">
                                                    轮播修改
                                                </a>
                                            </li>
                                            <li>
                                                <a href="link.html">
                                                    友情链接
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </li>
                            <li class="panel panel-default dropdown">
                                <a data-toggle="collapse" href="#dropdown-table">
                                    <span class="icon fa fa-table"></span>
                                    <span class="title">用户中心</span>
                                </a>
                                <!-- Dropdown level 1 -->
                                <div id="dropdown-table" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ul class="nav navbar-nav">
                                            <li>
                                                <a href="userManager.html">
                                                    用户管理
                                                </a>
                                            </li>
                                            <li>
                                                <a href="userRecover.html">
                                                    用户恢复
                                                </a>
                                            </li>
                                            <li>
                                                <a href="closeIp.html">
                                                    禁止IP
                                                </a>
                                            </li>
                                            <li>
                                                <a href="beauticianManager.html">
                                                    美容师管理
                                                </a>
                                            </li>
                                            <li>
                                                <a href="beauticianRecover.html">
                                                    美容师回收站
                                                </a>
                                            </li>
                                            <li>
                                                <a href="beauticianAdd.html">
                                                    美容师添加
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </li>
                            <li class="panel panel-default dropdown">
                                <a data-toggle="collapse" href="#dropdown-form">
                                    <span class="icon fa fa-file-text-o"></span>
                                    <span class="title">支付中心</span>
                                </a>
                                <!-- Dropdown level 1 -->
                                <div id="dropdown-form" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ul class="nav navbar-nav">
                                            <li>
                                                <a href="beauticianOrder.html">
                                                    美容订单
                                                </a>
                                            </li>
                                            <li>
                                                <a href="order.html">
                                                    已支付订单(商城)
                                                </a>
                                            </li>
                                            <li>
                                                <a href="unorder.html">
                                                    未支付订单(商城)
                                                </a>
                                            </li>
                                            <li>
                                                <a href="orderRecover.html">
                                                    订单回收站(商城)
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </li>
                            
                            <!-- Dropdown-->
                            <li class="panel panel-default dropdown active">
                                <a data-toggle="collapse" href="#component-example">
                                    <span class="icon fa fa-cubes"></span>
                                    <span class="title">美容中心</span>
                                </a>
                                <!-- Dropdown level 1 -->
                                <div id="component-example" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ul class="nav navbar-nav">
                                            <li>
                                                <a href="sort.html">
                                                    分类管理
                                                </a>
                                            </li>
                                            <li>
                                                <a href="sortAdd.html">
                                                    分类添加
                                                </a>
                                            </li>
                                            <li>
                                                <a href="itemsManager.html">
                                                    项目管理
                                                </a>
                                            </li>
                                            <li>
                                                <a href="itemsRecover.html">
                                                    项目回收站
                                                </a>
                                            </li>
                                            <li>
                                                <a href="itemsAdd.html">
                                                    项目添加
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </li>
                            <!-- Dropdown-->
                            <li class="panel panel-default dropdown">
                                <a data-toggle="collapse" href="#dropdown-example">
                                    <span class="icon fa fa-slack"></span>
                                    <span class="title">商品中心</span>
                                </a>
                                <!-- Dropdown level 1 -->
                                <div id="dropdown-example" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ul class="nav navbar-nav">
                                            <li>
                                                <a href="goodsSort.html">
                                                    分类管理
                                                </a>
                                            </li>
                                            <li>
                                                <a href="goodsSortAdd.html">
                                                    分类添加
                                                </a>
                                            </li>
                                            <li>
                                                <a href="goodsManager.html">
                                                    商品管理
                                                </a>
                                            </li>
                                            <li>
                                                <a href="goodsRecover.html">
                                                    商品回收站
                                                </a>
                                            </li>
                                            <li>
                                                <a href="goodsAdd.html">
                                                    商品添加
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </li>
                            <!-- Dropdown-->
                            <li class="panel panel-default dropdown">
                                <a data-toggle="collapse" href="#dropdown-icon">
                                    <span class="icon fa fa-archive"></span>
                                    <span class="title">留言中心</span>
                                </a>
                                <!-- Dropdown level 1 -->
                                <div id="dropdown-icon" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ul class="nav navbar-nav">
                                            <li>
                                                <a href="messageManager.html">
                                                    留言管理
                                                </a>
                                            </li>
                                            <li>
                                                <a href="messageRecover.html"> 
                                                    留言回收站
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <!-- /.navbar-collapse -->
                </nav>
            </div>
            <!-- Main Content -->
            <div class="container-fluid">
                <div class="side-body">
                    <div class="page-title">
                        <span class="title">项目回收站</span>
                        <div class="description">可以删除或恢复</div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="card">
                                <div class="card-header">
                                    <div class="card-title">
                                        <div class="title">删除或恢复</div>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <form action="/admin/index/itemsRecover.html" method="post">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th>#</th>
                                                    <th>项目编号</th>
                                                    <th>项目名</th>
                                                    <th>项目描述</th>
                                                    <th>定金</th>
                                                    <th>全额</th>
                                                    <th>类别</th>
                                                    <th>添加时间</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                {if (!empty($beauty_info))}
                                                {foreach ($beauty_info as $value)}
                                                <tr>
                                                    <th scope="row">
                                                        <input type="checkbox" name="bid[]" value="{$value.bid}">
                                                    </th>
                                                    <td>
                                                        {$value.product_id}
                                                    </td>
                                                    <td>
                                                        {$value.bname}
                                                    </td>
                                                    <td>
                                                        {$value.description}
                                                    </td>
                                                    <td>
                                                        {$value.deposit}
                                                    </td>
                                                    <td>
                                                        {$value.payment}
                                                    </td>
                                                    <td>
                                                        {foreach ($sort_data as $v)}
                                                        {if ($v.sid == $value.sort_id)}
                                                        {$v.sname}
                                                        {/if}
                                                        {/foreach}
                                                    </td>
                                                    <td>
                                                        {$value.addtime|date='Y-m-d H:i:s', ###}
                                                    </td>
                                                </tr>
                                                {/foreach}
                                                {/if}
                                                <tr>
                                                    <td>
                                                        <input type="submit" class="btn btn-default" name="delete" value="删除">
                                                    </td>
                                                    <td>
                                                        <input type="submit" class="btn btn-default" name="recover" value="上架">
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <div class="row">
                                            {$page}
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <footer class="app-footer">
            <div class="wrapper">
                <span>© 2017 Copyright - </span>
                <a href="http://www.miitbeian.gov.cn/" target="_blank">
                    备案号:{$Think.const.WEB_ICP}
                </a>
                <span> - MyWeb </span>
                <a href="http://www.cllscc.com/" target="_blank">
                    www.cllscc.com
                </a>
            </div>
        </footer>
    <div>
    <!-- Javascript Libs -->
    <script type="text/javascript" src="/admin/lib/js/jquery.min.js"></script>
    <script type="text/javascript" src="/admin/lib/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/admin/lib/js/Chart.min.js"></script>
    <script type="text/javascript" src="/admin/lib/js/bootstrap-switch.min.js"></script>

    <script type="text/javascript" src="/admin/lib/js/jquery.matchHeight-min.js"></script>
    <script type="text/javascript" src="/admin/lib/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="/admin/lib/js/dataTables.bootstrap.min.js"></script>
    <script type="text/javascript" src="/admin/lib/js/select2.full.min.js"></script>
    <script type="text/javascript" src="/admin/lib/js/ace/ace.js"></script>
    <script type="text/javascript" src="/admin/lib/js/ace/mode-html.js"></script>
    <script type="text/javascript" src="/admin/lib/js/ace/theme-github.js"></script>
    <!-- Javascript -->
    <script type="text/javascript" src="/admin/js/app.js"></script>
</body>

</html>
