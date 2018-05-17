<!DOCTYPE html>
<!--[if IE 8 ]><html class="ie" xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-US" lang="en-US"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-US" lang="en-US"><!--<![endif]-->
<head>
    <!-- Basic Page Needs -->
    <meta charset="utf-8">
    <!--[if IE]><meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'><![endif]-->
    <title>{$Think.const.WEB_NAME}预约</title>

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
                            <div class="breadcrumbs mgl2 pd-space2">
                                <ul>
                                    <li><a href="#">Shop</a></li>
                                    <li>Contact</li>
                                </ul>
                            </div><!-- breadcrumb -->
                            <div class="page-content">
                                <span>Contact</span>
                            </div>
                        </div><!-- page-title -->
                    </div>
                </div>
                    
            </div><!-- container -->
        </div><!-- wrap-slider -->

        <section class="flat-row pdtop section-contact">
            <div class="container">
                <!--<div class="row">
                    <div class="col-md-12">
                        <div class="flat-maps">
                            <div id="maps" style="width: 100%; height: 520px; "></div> 
                        </div>
                    </div>
                </div>--->

                <div class="wrap-address">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="flat-address font-poppins">
                                <h6 class="countries">France</h6>
                                <p>John Doe, 123 Main St Chicago, IL 60626</p>
                                <p>Email: <a href="#">info@greenorganic.com</a></p>
                                <p>Phone: <a href="#">258-556-189</a></p>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="flat-address">
                                <h6 class="countries">United States</h6>
                                <p>John Doe, 123 Main St Chicago, IL 60626</p>
                                <p>Email: <a href="#">info@greenorganic.com</a></p>
                                <p>Phone: <a href="#">258-556-189</a></p>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="flat-address">
                                <h6 class="countries">Viet Nam</h6>
                                <p>John Doe, 123 Main St Chicago, IL 60626</p>
                                <p>Email: <a href="#">info@greenorganic.com</a></p>
                                <p>Phone: <a href="#">258-556-189</a></p>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="row">
                    <div class="col-md-12">
                        <div class="title-section style1">
                            <h1 class="title">Contact With Us !</h1>
                            <div class="sub-title">
                                Fill out the form below to recieve a free and confidential intial consultation.
                            </div>
                        </div>
                        <div class="flat-contact">
                            <form novalidate="" class="contact-form" id="contactform" method="post" action="#">
                                <p class="col-contact contact-notes">                                      
                                    <input type="text" placeholder="Name" aria-required="true" size="30" value="" name="author" id="author">
                                </p>
                                <p class="col-contact contact-form-email">          
                                    <input type="email" placeholder="Email" size="30" value="" name="email" id="email">
                                </p>  
                                <p class="col-contact contact-form-url">          
                                    <select class=" dropdown_sort">
                                        <option value="">US</option>
                                        <option value="2d">England</option>
                                        <option value="3d">USA</option>
                                        <option value="3d">Viet Nam</option>
                                    </select>
                                </p>                                  
                                <p class="contact-form-contact">
                                    <textarea class="contact-messages" tabindex="4" placeholder="Messages" name="contact" required></textarea>
                                </p>                        
                                <p class="form-submit">                 
                                    <button class="flat-btn contact-submit">send messages</button>
                                </p>
                            </form>
                        </div>

                    </div>
                </div>
            </div>
        </section>                                  

        <section class="flat-row row-small bg-theme section-icon-info">
            <div class="container">
                <div class="row">
                    <div class="col-md-3">
                        <div class="iconbox left style2 pdl-first">
                            <div class="box-header">
                                <i class="fa fa-truck"></i>
                            </div>
                            <div class="box-content">
                                <div class="box-title">FREE SHIPPING</div>    
                                <p>Suffered Alteration in Some Form.</p> 
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="iconbox left style2 pdl-second">
                            <div class="box-header">
                                <i class="fa fa-money"></i>
                            </div>
                            <div class="box-content">
                                <div class="box-title">CASH ON DELIVERY</div>    
                                <p>The internet Tend To Repeat</p> 
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="iconbox left style2 pdl-three">
                            <div class="box-header icon-rotate">
                                <i class="fa fa-repeat"></i>
                            </div>
                            <div class="box-content">
                                <div class="box-title">45 DAYS RETURN</div>    
                                <p>Making it Look Like Readable</p> 
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="iconbox left style2 pdl-four">
                            <div class="box-header">
                                <i class="fa fa-clock-o"></i>
                            </div>
                            <div class="box-content">
                                <div class="box-title"> OPENING ALL WEEK</div>    
                                <p>8AM - 09PM</p> 
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>-->

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
    

    <!---<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDAYAhMXM0WNKB9Dans4nHFbABj2mgRAbw&region=GB"></script>
    <script type="text/javascript" src="/index/js/gmap3.min.js"></script>--->

    <script type="text/javascript" src="/index/js/main.js"></script>

</body>
</html>

