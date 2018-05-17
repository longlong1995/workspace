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
<body class="header-sticky">   

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
                            <div class="breadcrumbs mgl2">
                                <ul>
                                    <li><a>商城</a></li>
                                    <li>商品列表</li>
                                </ul>
                            </div><!-- breadcrumb -->
                            <div class="page-content ">
                                <span>
                                    {if (empty(input('get.shopid')))}全部{else}
                                        {foreach ($goodssort_info as $value)}
                                        {if ($value.id == input('get.shopid'))}
                                        {$value.name}
                                        {/if}
                                        {/foreach}
                                    {/if}商品
                                </span>
                            </div>
                        </div><!-- page-title -->
                    </div>
                </div>
            </div><!-- container -->
        </div><!-- wrap-slider -->

        <section class="flat-row pdbottom home-shop">
            <div class="container">
                <div class="row">
                    <div class="col-md-3 col-sm-4">
                        <div class="sidebar">
                            <!-- 产品分类 -->
                            <!-- class="active" JS效果选项卡 -->
                            <div class="widget widget-categories style2">
                                <h4 class="widget-title">商品分类</h4>
                                <ul class="cotegories">
                                    {foreach ($goodssort_info as $value)}
                                    <li>
                                        <a href="shop.html?shopid={$value.id}">{$value.name}</a>
                                        <span>
											<?php $i = 0; ?>
                                            {foreach ($goods_info as $v)}
                                                {if ($v.sort_id == $value.id)}
                                                <?php $i++; ?>
                                                {/if}
                                            {/foreach}
                                            {$i}
										</span>
                                    </li>
                                    {/foreach}
                                </ul>
                            </div>
                            <!-- 销量排行榜 -->
                            <div class="widget widget-product">
                                <h4 class="widget-title">热销排行榜</h4>
                                <ul class="latest">
                                    {if (!empty($goods_hot))}
                                    {foreach ($goods_hot as $value)}
                                    <li>
                                        <div class="product-image">
                                            <a href="shop_details.html?gid={$value.gid}" class="pro-img">
                                                <img src="{$value.images}" alt="image" width="80">
                                            </a>
                                        </div>
                                        <div class="product-shop">
                                            <h6 class="product-name">
                                                <a href="shop_details.html?gid={$value.gid}" style="font-size:12px;">{$value.gname}</a>
                                            </h6>
                                            <div class="price-box"> 
                                                <ins>
                                                    <span class="amount">${$value.current_price}</span>
                                                </ins>
                                                <del>
                                                    <span class="amount">${$value.original_price}</span>
                                                </del>
                                            </div>
                                        </div>
                                    </li>
                                    {/foreach}
                                    {/if}
                                </ul>         
                            </div>      
                        </div>
                    </div>
                    <!-- 商品列表 -->
                    <div class="col-md-9 col-sm-8">
                        <div class="wrap-product">
                            <div class="flat-product">
                                <div class="row">
                                    {if (!empty($goods))}
                                    {foreach ($goods as $key => $value)}
                                    <div class="col-md-4">
                                        <div class="detail-product">
                                            <div class="item-img">
                                                <img src="{$value.images}" alt="image" style="width:100%;height: 300px;">
                                                <a href="/index/index/shop_details?gid={$value.gid}">
                                                    <div class="overlay">
                                                        <i class="fa fa-search-plus"></i>
                                                    </div>
                                                </a>
                                            </div>
                                            <div class="wrap-content">
                                                <div class="item-content">
                                                    <h6 class="name">
                                                        <a>{$value.gname}</a>
                                                    </h6>
                                                    <div class="racing-pri">
                                                        <div class="price-box"> 
                                                            <ins>
                                                                <span class="amount">{$value.current_price}</span>
                                                            </ins>
                                                            <del>
                                                                <span class="amount">{$value.original_price}</span>
                                                            </del>
                                                        </div>
                                                        <div class="start-pri">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star-o"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="wrap-button">
                                                    <form {if (empty($user))} action="/index/user/login.html" {else} action="cart.html" {/if} method="post">
                                                        <input type="hidden" name="gid" value="{$value.gid}">
                                                        <input type="hidden" name="sum" value="1">
                                                        <button class="flat-btn add-cart">加入购物车</button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    {/foreach}
                                    {/if}
                                </div>
                            </div>
                        </div>
                        <div class="blog-pagination">
                            {$page}
                        </div><!-- /.blog-pagination -->       
                    </div>
                </div>
            </div>
        </section>

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
    
    

    <script type="text/javascript" src="/index/js/main.js"></script>

</body>
</html>

