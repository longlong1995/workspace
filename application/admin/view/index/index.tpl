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
                            <li class="active">NICE</li>
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
                            <li class="active">
                                <a href="index.html">
                                    <span class="icon fa fa-tachometer"></span>
                                    <span class="title">首页</span>
                                </a>
                            </li>
                            <li class="panel panel-default dropdown">
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
                            <li class="panel panel-default dropdown">
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
                <div class="side-body padding-top">
                    <div class="row">
                        <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                            <a href="beauticianOrder.html">
                                <div class="card red summary-inline">
                                    <div class="card-body">
                                        <i class="icon fa fa-inbox fa-4x"></i>
                                        <div class="content">
                                            <div class="title">{$order_sum}</div>
                                            <div class="sub-title">已交易订单</div>
                                        </div>
                                        <div class="clear-both"></div>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                            <a href="messageManager.html">
                                <div class="card yellow summary-inline">
                                    <div class="card-body">
                                        <i class="icon fa fa-comments fa-4x"></i>
                                        <div class="content">
                                            <div class="title">{$message_sum}</div>
                                            <div class="sub-title">留言板</div>
                                        </div>
                                        <div class="clear-both"></div>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                            <a href="userManager.html">
                                <div class="card green summary-inline">
                                    <div class="card-body">
                                        <i class="icon fa fa-tags fa-4x"></i>
                                        <div class="content">
                                            <div class="title">{$user_sum}</div>
                                            <div class="sub-title">用户量</div>
                                        </div>
                                        <div class="clear-both"></div>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                            <a href="beauticianManager.html">
                                <div class="card blue summary-inline">
                                    <div class="card-body">
                                        <i class="icon fa fa-share-alt fa-4x"></i>
                                        <div class="content">
                                            <div class="title">{$doctor_sum}</div>
                                            <div class="sub-title">美容师</div>
                                        </div>
                                        <div class="clear-both"></div>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="row  no-margin-bottom">
                        <div class="col-sm-6 col-xs-12">
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="card primary">
                                        <div class="card-jumbotron no-padding">
                                            <canvas id="jumbotron-line-chart" class="chart no-padding"></canvas>
                                        </div>
                                        <div class="card-body half-padding">
                                            <h4 class="float-left no-margin font-weight-300">2017年月收入</h4>
                                            <h2 class="float-right no-margin font-weight-300">$3200</h2>
                                            <div class="clear-both"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 col-sm-12">
                                    <div class="thumbnail no-margin-bottom">
                                        <img src="{$beauty_info.images}" class="img-responsive">
                                        <div class="caption">
                                            <h3 id="thumbnail-label">{$beauty_info.bname}
                                                <a class="anchorjs-link" href="#thumbnail-label">
                                                    <span class="anchorjs-icon"></span>
                                                </a>
                                            </h3>
                                            <p>{$beauty_info.description}</p>
                                            <p>
                                                <input type="button" class="btn btn-primary" role="button" value="美容中心">
                                                <input type="button" class="btn btn-default" role="button" value="{$beauty_info.username}">
                                                <input type="button" class="btn btn-default" role="button"
                                                value="${$beauty_info.rate}">
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-12">
                                    <div class="thumbnail no-margin-bottom">
                                        <img src="{$goods_info.images}" class="img-responsive">
                                        <div class="caption">
                                            <h3 id="thumbnail-label">{$goods_info.gname}
                                                <a class="anchorjs-link" href="#thumbnail-label">
                                                    <span class="anchorjs-icon"></span>
                                                </a>
                                            </h3>
                                            <p>{$goods_info.description}</p>
                                            <p>
                                                <input type="button" class="btn btn-primary" role="button" value="商城中心">
                                                <input type="button" class="btn btn-default" role="button" value="{$goods_info.username}">
                                                <input type="button" class="btn btn-default" role="button"
                                                value="${$goods_info.rate}">
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-xs-12">
                            <div class="row">
                                <div class="col-md-6 col-sm-12">
                                    <div class="card primary">
                                        <div class="card-jumbotron no-padding">
                                            <canvas id="jumbotron-bar-chart" class="chart no-padding"></canvas>
                                        </div>
                                        <div class="card-body half-padding">
                                            <h4 class="float-left no-margin font-weight-300">月订单销量柱状图</h4>
                                            <div class="clear-both"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-12">
                                    <div class="card primary">
                                        <div class="card-jumbotron no-padding">
                                            <canvas id="jumbotron-line-2-chart" class="chart no-padding"></canvas>
                                        </div>
                                        <div class="card-body half-padding">
                                            <h4 class="float-left no-margin font-weight-300">月订单波动图</h4>
                                            <div class="clear-both"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card card-success">
                                <div class="card-header">
                                    <div class="card-title">
                                        <div class="title"><i class="fa fa-comments-o"></i> 最新留言</div>
                                    </div>
                                    <div class="clear-both"></div>
                                </div>
                                <div class="card-body no-padding">
                                    <ul class="message-list">
                                        <a href="messageManager.html">
                                            {if (!empty($message_info))}
                                            {foreach ($message_info as $value)}
                                            <li>
                                                <img src="/admin/img/head.jpg" class="profile-img pull-left">
                                                <div class="message-block">
                                                    <div>
                                                        <span class="username">{$value.name}</span> 
                                                        <span class="message-datetime">{$value.addtime|date='Y-m-d H:i:s', ###}</span>
                                                    </div>
                                                    <div class="message">{$value.email}</div>
                                                </div>
                                            </li>
                                            {/foreach}
                                            {/if}
                                        </a>
                                    </ul>
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
            <script type="text/javascript" src="/admin/js/index.js"></script>
</body>

</html>
