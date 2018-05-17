<!DOCTYPE html>
<!--[if IE 8 ]><html class="ie" xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-US" lang="en-US"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-US" lang="en-US"><!--<![endif]-->
<head>
    <!-- Basic Page Needs -->
    <meta charset="utf-8">
    <!--[if IE]><meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'><![endif]-->
    <title>{$Think.const.WEB_NAME}美容项目详情</title>

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
                                    <li><a href="center.html">美容中心</a></li>
                                    <li>项目详情</li>
                                </ul>
                            </div><!-- breadcrumb -->
                            <div class="page-content ">
                                <span>{$sort.sname}项目</span>
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
                            <div class="widget widget-product">
                                <h4 class="widget-title">热销排行榜</h4>
                                <ul class="latest">
                                    {if (!empty($beauty_hot))}
                                    {foreach ($beauty_hot as $value)}
                                    <li>
                                        <div class="product-image">
                                            <a href="center_details.html?bid={$value.bid}" class="pro-img">
                                                <img src="{$value.images}" alt="image" width="80">
                                            </a>
                                        </div>
                                        <div class="product-shop">
                                            <h6 class="product-name">
                                                <a href="center_details.html?bid={$value.bid}">{$value.bname}</a>
                                            </h6>
                                            <div class="price-box"> 
                                                <ins>
                                                    <span class="amount">${$value.deposit}</span>
                                                </ins>
                                                <del>
                                                    <span class="amount">${$value.payment}</span>
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
                    <div class="col-md-9 col-sm-8">
                        <div class="wrap-product"> 
                            <div class="product-detail">
                                <div class="detail-product">
                                    <div class="item-img"> 
                                        <img src="{$beauty.images}"  style="border:5px solid #CCC;margin:1px;padding:5px; width:100%; height: 500px;">
                                    </div>
                                </div>
                                <div class="product-info">
                                    <h6 class="product-name">{$beauty.bname}</h6>
                                    <div class="start-pri">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star-o"></i>
                                    </div>
                                    <div class="price-box"> 
                                        <ins><span class="amount">现价:{$beauty.deposit}</span></ins>
                                        <del><span class="amount">原价:{$beauty.payment}</span></del>
                                    </div>
                                    <p>{$beauty.description}</p>
                                    <ul class="list-info">
                                        <li>产品参数</li>
                                        <li>适合人群</li>
                                        <li>14天包退换</li>
                                    </ul>
                                    <div class="flat-quantity">
                                        <form class="cart clearfix" {if (!empty($user))} action="book.html" {else} action="/index/user/login.html" {/if} method="post">
                                            <input type="hidden" name="bid" value="{$beauty.bid}">
                                            <button class="flat-btn add-cart" name="cart">立即预约</button>
                                        </form>
                                    </div>
                                    <div class="product_meta">
                                        <ul>
                                            <li>商品编号:<span>{$beauty.product_id}</span></li>
                                            <li>所属类别: <a class="style-font">{$sort.sname}</a></li>
                                        </ul>
                                    </div>
                                    <ul class="social-links">
                                        <li class="title-link">分享:</li>
                                        <div class="bdsharebuttonbox">
                                            <a href="#" class="bds_more" data-cmd="more"></a>
                                            <a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a>
                                            <a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a>
                                            <a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a>
                                            <a href="#" class="bds_tieba" data-cmd="tieba" title="分享到百度贴吧"></a>
                                            <a href="#" class="bds_douban" data-cmd="douban" title="分享到豆瓣网"></a>
                                        </div>
                                    </ul>
                                </div>  
                            </div>
                            <div class="flat-tabs" data-effect ="fadeIn">
                                <ul class="menu-tab">
                                    <li class="active"><a href="#">专家信息</a></li>
                                    <li><a href="#">项目详情</a></li>
                                </ul><!-- /.menu-tab -->
                                <div class="content-tab">
                                    
                                    <div class="content-inner">
                                        <div class="tab-comment">
                                            <ol class="comment-list">
                                                {if (!empty($doctor))}
                                                {foreach ($doctor as $value)}
                                                <li class="comment">
                                                    <article class="comment-body">        
                                                        <div class="comment-author">
                                                            <img src="{$value.picture}" style="width: 100%;height: 134px; border-radius: 67px;"> 
                                                        </div><!-- .comment-author -->
                                                        <div class="comment-text">
                                                            <div class="comment-metadata">
                                                                <div class="comment-info">
                                                                    <span class="date">入驻时间:{$value.addtime|date='Y-m-d H:i', ###}</span>
                                                                    <h5><a href="doctor_details.html?did={$value.did}">{$value.name}</a></h5> 
                                                                </div>          
                                                            </div><!-- .comment-metadata -->
                                                            <div class="comment-content">
                                                                <p>{$value.experience}</p>
                                                            </div><!-- .comment-content -->
                                                        </div><!-- /.comment-text -->                       
                                                    </article><!-- .comment-body -->
                                                </li>
                                                {/foreach}
                                                {/if}                    
                                            </ol><!-- .comment-list -->
                                        </div>
                                    </div>
                                    <div class="content-inner">
                                        <div class="tab-text1">
                                            <p>{$beauty.detail}</p>
                                        </div>                                        
                                    </div>
                                </div><!-- /.content-tab -->
                            </div><!-- /.roll-tabs -->
                        </div>     
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
                                <div class="box-title">专车接送服务</div>    
                                <p>无论是机场、火车站，只要有需求，我们将派车全程接送。</p> 
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="iconbox left style2 pdl-second">
                            <div class="box-header">
                                <i class="fa fa-money"></i>
                            </div>
                            <div class="box-content">
                                <div class="box-title">美丽导医</div>    
                                <p>作为你的美丽天使，全程跟踪服务</p> 
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="iconbox left style2 pdl-three">
                            <div class="box-header icon-rotate">
                                <i class="fa fa-repeat"></i>
                            </div>
                            <div class="box-content">
                                <div class="box-title">终身负责</div>    
                                <p>由权威专家亲自负责</p> 
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
    <script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"2","bdSize":"24"},"share":{}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
</body>
</html>

