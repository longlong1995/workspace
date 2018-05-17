<!DOCTYPE html>
<!--[if IE 8 ]><html class="ie" xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-US" lang="en-US"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-US" lang="en-US"><!--<![endif]-->
<head>
    <!-- Basic Page Needs -->
    <meta charset="utf-8">
    <!--[if IE]><meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'><![endif]-->
    <title>{$Think.const.WEB_NAME}商城</title>

    <meta name="author" content="">

    <!-- Mobile Specific Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <!-- Bootstrap  -->
    <link rel="stylesheet" type="text/css" href="/index/css/bootstrap.css" >

    <!-- Theme Style -->
    <link rel="stylesheet" type="text/css" href="/index/css/style.css">

    <!-- Colors -->
    <link rel="stylesheet" type="text/css" href="/index/css/colors/color1.css" id="colors">

    <!-- Responsive -->
    <link rel="stylesheet" type="text/css" href="/index/css/responsive.css">
    
    <!-- Animation Style -->
    <link rel="stylesheet" type="text/css" href="/index/css/animate.css">

    <!--[if lt IE 9]>
        <script src="/index/js/html5shiv.js"></script>
        <script src="/index/js/respond.min.js"></script>
    <![endif]-->
</head>                                 
<body class="header-sticky" ng-app>   
    <!-- Boxed -->
    <div class="boxed">

        <div class="top">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">                      
                        <ul class="flat-information mgl2">
                            <li class="phone"><a>188-6476-2513</a></li>
                            <li class="address"><a>{$Think.const.CITY}</a></li>
                        </ul> 
                    </div>
                    <!-- /.col-md-6 -->
                    <div class="col-md-6">
                        <ul class="social-links mgr2">
                            {if (empty($user))} 
                            <li><a href="/index/user/login.html">登录</a></li>
                            <li><a href="/index/user/login.html">注册</a></li>
                            {else}
                            <li>
                                <a href="setting.html">
                                    <img src="{$user.picture}" style="height: 30px;width: 30px; border-radius: 30px;">
                                </a>
                            </li>
                            <li><a>{$user.username}</a></li>
                            {if ($user.usertype == 1)}
                            <li><a href="/admin/index/login.html">管理中心</a></li>
                            {/if}
                            <li><a href="layout.html">退出</a></li>
                            {/if}
                        </ul>
                    </div>        
                </div><!-- /.row -->
            </div><!-- /.container -->
        </div><!-- /.top -->

        <!-- Header -->            
        <header id="header" class="header header-classic clearfix">
            <div class="container">
                <div class="row">                 
                    <div class="header-wrap clearfix">
                        <div class="col-md-4">
                            <div id="logo" class="logo mgl2">
                                <a href="index.html" rel="home">
                                    <img src="{$Think.const.WEB_LOGO}" alt="image" style="height:50px;">
                                </a>
                            </div><!-- /.logo -->
                        </div>
                        <div class="col-md-8">
                            <div class="nav-wrap">                            
                                <nav id="mainnav" class="mainnav">
                                   <ul class="menu"> 
                                        <li><a href="/index/index/index.html">主页</a></li>     
                                        <li><a href="/index/index/center.html">美容中心</a></li>
                                        <li><a href="/index/index/doctor.html">专家团队</a></li>
                                        <li><a href="/index/index/shop.html">商城</a></li>
                                        <li><a href="/index/index/about.html">关于我们</a></li>
                                        {if (!empty($user))}
                                        <li><a href="/index/index/shop_cart.html">购物车</a></li>
                                        {/if}
                                    </ul><!-- /.menu -->
                                </nav><!-- /.mainnav --> 

                                <div class="top-search">                        
                                    <form action="/index/index/search" id="searchform-all" method="post">
                                        <div>
                                            <input type="text" id="s" name="search" value="" class="sss" placeholder="搜索">
                                            <input type="submit" value="" id="searchsubmit">
                                        </div>
                                    </form>
                                </div><!-- /top-search --> 

                                <ul class="menu menu-extra">
                                    <li class="show-search">
                                        <a href="#"><i class="icon_search"></i></a>
                                    </li>
                                </ul>  
                            </div><!-- /.nav-wrap -->
                        </div>                      
                    </div><!-- /.header-inner -->                 
                </div><!-- /.row -->
            </div>
        </header><!-- /.header -->

        <div class="wrap-slider">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="page-title">
                            <h4>收货地址</h4>
                            <div>
                                <h6>当前收货地址:{$user.place}</h6>
                            </div>
                            <form action="/index/user/updatePlace.html" method="post" class="form-inline">
                                <div class="row">
                                    <select id="seachprov" name="seachprov" onChange="changeComplexProvince(this.value, sub_array, 'seachcity', 'seachdistrict');" style="width: 20%;"></select>&nbsp;&nbsp;
                                    <select id="seachcity" name="homecity" onChange="changeCity(this.value,'seachdistrict','seachdistrict');" style="width: 20%;"></select>&nbsp;&nbsp;
                                    <span id="seachdistrict_div">
                                        <select id="seachdistrict" name="seachdistrict" style="width: 20%;"></select>
                                    </span>
                                </div>
                                <textarea rows="3" name="placeinfo" placeholder="详细地址" style="width: 50%;"></textarea>
                                <div>
                                    <input type="submit" name="dosubmit" value="修改收货地址" />
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="page-title">
                            <form action="/alipay/pagepay/pagepay.php" method="post">
                                <div class="breadcrumbs mgl2 pd-space4">
                                    <ul>
                                        <li><a>购物车</a></li>
                                        <li>订单详情</li>
                                    </ul>
                                </div>
                                <div style="margin-left:auto; margin-right:auto; width:600px; padding-top:30px">
                                    <input  type="text" name="" value=""  ng-model="abc" placeholder="输入关键字快速查找">
                                </div>
                                
                                <div ng-controller="cartController" class="container">
                                    <table class="table" ng-show="cart.length">
                                        <thead>
                                            <tr>
                                                <th>产品编号</th>
                                                <th>产品名字</th>
                                                <th>购买数量</th>
                                                <th>产品单价</th>
                                                <th>产品总价</th>
                                                <th>操作</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr ng-repeat="item in cart| filter:abc">
                                                <td ng-bind="item.id"></td>
                                                <td ng-bind="item.name"></td>
                                                <td>
                                                    <button type="button" ng-click="reduce(item.id)" class="btn btn-primary btn-sm">-</button>
                                                    <input type="text" ng-model="item.quantity" style="text-align: center; width: 100px;" readonly>
                                                    <button type="button" ng-click="add(item.id)" class="btn btn-primary btn-sm">+</button>
                                                </td>
                                                <td ng-bind="item.price"></td>
                                                <td ng-bind="item.price*item.quantity"></td>
                                                <td><button type="button" ng-click="remove(item.id)" class="btn btn-danger btn-sm">移除</button></td>
                                            </tr>
                                            <tr>
                                                <td>总购物价</td>
                                                <td ng-bind="totalPrice()"></td>
                                                <td>总购买数量</td>
                                                <td ng-bind="totalQuantity()"></td>
                                                <!-- 付款金额 -->
                                                <input name="WIDtotal_amount" id="money" value="0.01" type='hidden' class="ipt">
                                                <!-- 订单名称 -->
                                                <input type="hidden" name="WIDsubject" value="{$Think.const.WEB_NAME}支付">
                                                <!-- 商户订单号 -->
                                                <input type="hidden" id="WIDout_trade_no" name="WIDout_trade_no" value="{$time}" />
                                                <!-- 商品描述： -->
                                                <input type="hidden" id="WIDbody" name="WIDbody" value="1" />
                                                <td colspan="2">
                                                    <button type="button"  ng-click="cart = {}" class="btn btn-danger btn-sm">清空购物车</button>
                                                </td>
                                            </tr>
                                        </tbody>                
                                    </table>
                                    <p ng-show="!cart.length">您的购物车已空</p>
                                </div>
                                
                               
                               <!-- breadcrumb -->
                                <div class="row">
                                    <button id="book">立即支付</button>
                                </div>
                            </form>
                        </div><!-- page-title -->

                    </div>
                </div>
                    
            </div><!-- container -->
        </div>
      



        <section class="flat-row row-small bg-theme section-icon-info">
            <div class="container">
                <div class="row">
                    <div class="col-md-3 col-sm-6">
                        <div class="iconbox left style2 pdl-first">
                            <div class="box-header">
                                <i class="fa fa-truck"></i>
                            </div>
                            <div class="box-content">
                                <div class="box-title">专属快递服务</div>    
                                <p>快速送货上门保证效率</p> 
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="iconbox left style2 pdl-second">
                            <div class="box-header">
                                <i class="fa fa-money"></i>
                            </div>
                            <div class="box-content">
                                <div class="box-title">价格实惠</div>    
                                <p>买的舒心,用的放心</p> 
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="iconbox left style2 pdl-three">
                            <div class="box-header icon-rotate">
                                <i class="fa fa-repeat"></i>
                            </div>
                            <div class="box-content">
                                <div class="box-title">30天内退换货</div>    
                                <p>无条件满足客户需求</p> 
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="iconbox left style2 pdl-four">
                            <div class="box-header">
                                <i class="fa fa-clock-o"></i>
                            </div>
                            <div class="box-content">
                                <div class="box-title">服务时间</div>    
                                <p>8:00-21:00</p> 
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
  <!-- 尾部 -->
        <footer class="footer">
            <div class="container">
                <div class="row"> 
                    <div class="col-md-3 col-sm-6">  
                        <div class="widget widget-infomation">
                            <h3 class="logo-footer"><a href="/index/index/company_careers">公司概况</a></h3>
                            <p><a href="/index/index/about">公司简介</a></p> 
                            <ul class="flat-information">
                                <li class="phone"><a>188-6476-2513</a></li>
                                <li class="email"><a>666666666@163.com</a></li>
                                <li class="address"><a href="/index/index/company_ourteam">公司地址</a></li>             
                                <li class="skype"><a href="/index/index/company_history">公司历史</a></li>
                            </ul>           
                        </div>         
                    </div><!-- /.col-md-3 --> 

                    <div class="col-md-3 col-sm-6">
                        <div class="widget widget-out-link">
                            <h4 class="widget-title">相关信息</h4>
                            <ul class="one-half">
                                <li><a href="/index/index/index">品牌动态</a></li>
                                <li><a href="/index/index/about">相关新闻</a></li>
                                <li><a href="/index/index/shop">新品上架</a></li>
                                <li><a href="/index/index/center">专家团队</a></li>
                                <li><a href="/index/index/company_ourteam">关于我们</a></li>
                            </ul>

                        </div>
                    </div><!-- /.col-md-3 -->

                    <div class="col-md-3 col-sm-6">
                        <div class="widget widget-out-link">
                            <h4 class="widget-title">友情链接</h4>
                             <ul class="one-half">
                                {foreach $link as $key => $value}
                                <li><a href="{$value.url}">{$value.name}</a></li>
                                {/foreach}
                       
                            </ul>
                        </div>
                    </div><!-- /.col-md-3 -->

                    <div class="col-md-3 col-sm-6">
                        <div class="widget widget-letter">
                            <h4 class="widget-title">关注{$Think.const.WEB_NAME}官方微信</h4>
                            <p class="info-text">女为悦己者容</p>
                            <form novalidate="" class="subscribe-form" id="subscribeform" method="post" action="#">
                              <img src="/index/images/ewm.jpg" style="width: 200px;height: 200px;">
                            </form>
                        </div>
                    </div><!-- /.col-md-3 -->
                </div><!-- /.row -->    
            </div><!-- /.container -->
        </footer>
        <!-- Bottom -->
        <div class="bottom">
            <div class="container">
                <div class="copyright"> 
                    <p>Copyright &copy; 2017.Company name All rights reserved.
                        <a target="_blank" href="http://www.miitbeian.gov.cn/">备案号:{$Think.const.WEB_ICP}</a>
                    </p>
                </div>                  
            </div><!-- /.container -->
        </div><!-- bottom -->

         <!-- Go Top -->
        <a id="ibangkf" href="http://www.ibangkf.com">伊人坊在线客服</a>
        <script type="text/javascript" src="http://c.ibangkf.com/i/c-longlong.js"></script>
        <a class="go-top">
            <i class="fa fa-angle-up"></i>
        </a>  

    </div><!-- Boxed -->
    
    <!-- Javascript -->
     
    <script type="text/javascript" src="/index/js/jquery.min.js"></script>
    <script type="text/javascript" src="/index/js/bootstrap.min.js"></script> 
    <script type="text/javascript" src="/index/js/jquery.easing.js"></script> 
    <script type="text/javascript" src="/index/js/imagesloaded.min.js"></script> 
    <script type="text/javascript" src="/index/js/jquery.isotope.min.js"></script>
    <script type="text/javascript" src="/index/js/jquery-waypoints.js"></script> 
    <script type="text/javascript" src="/index/js/jquery.magnific-popup.min.js"></script>   
    <script type="text/javascript" src="/index/js/jquery.cookie.js"></script>
    <script type="text/javascript" src="/index/js/jquery.fitvids.js"></script> 
    <script type="text/javascript" src="/index/js/parallax.js"></script>
    <script type="text/javascript" src="/index/js/smoothscroll.js"></script>   
    <script type="text/javascript" src="/index/js/jquery.flexslider-min.js"></script>
    <script type="text/javascript" src="/index/js/owl.carousel.js"></script>
    <script type="text/javascript" src="/index/js/jquery-validate.js"></script>
    <script type="text/javascript" src="/index/js/jquery.mb.YTPlayer.js"></script>
    <script type="text/javascript" src="/index/js/jquery-ui.js"></script>
    <script src="/index/js/area.js" type="text/javascript"></script>
    <script src="/index/js/areaData_min.js" type="text/javascript"></script>
    <script src="/index/js/index.js" type="text/javascript"></script>
    
    
    <script type="text/javascript" src="/index/js/main.js"></script>
    <script src="/index/js/angular.min.js" type="text/javascript"></script>
    <script src="/index/js/index1.js" type="text/javascript"></script>
    <script>
        var oBook = document.getElementById('book');
        oBook.onclick = function ()
        {
            var xhr = new XMLHttpRequest();
            xhr.open('post', '/index/index/cart_buy', false);
            xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
            xhr.send();
        }
    </script>
</body>
</html>

