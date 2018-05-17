<!DOCTYPE html>
<!--[if IE 8 ]><html class="ie" xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-US" lang="en-US"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-US" lang="en-US"><!--<![endif]-->
<head>
    <!-- Basic Page Needs -->
    <meta charset="utf-8">
    <!--[if IE]><meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'><![endif]-->
    <title>{$Think.const.WEB_NAME}关于我们</title>

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
                        <div class="breadcrumbs mgl2 pd-space">
                            <ul>
                                <li><a>关于我们</a></li>
                                <li>服务流程</li>
                            </ul>
                        </div><!-- breadcrumb -->
                        <div class="page-content ">
                            <span>服务流程</span>
                        </div>
                    </div><!-- page-title -->
                    </div>
                </div>
                    
            </div><!-- container -->
        </div><!-- wrap-slider -->

        <section class="flat-row pdbottomv2 services-detail company">
            <div class="container">
                <div class="row">
                    <div class="col-md-3 col-sm-4">
                        <div class="sidebar">
                            <div class="widget widget-nav-menu style2">
                                <ul class="widget-menu">
                                    <li><a href="about.html">公司概括</a></li>
                                    <li><a href="company_history.html">公司历史</a></li>
                                    <li><a href="company_ourteam.html">公司连锁</a></li>
                                    <li><a href="company_address.html">公司地址</a></li>
                                    <li><a href="company_careers.html">公司成就</a></li>
                                    <li class="active"><a href="company_partners.html">服务流程</a></li>
                                </ul>
                            </div>

                            <div class="widget widget-testimonials">
                                <div class="flat-testimonials3 owl-carousel" data-item="1" data-nav="false" data-dots="true" data-auto="false">
                                    <div class="testimonials style6"> 
                                        <div class="message">                                
                                            <blockquote class="whisper">
                                               " 只做有品质的医疗美容"
                                             </blockquote>
                                        </div>
                                        <div class="avatar"> 
                                            <span class="name">程龙龙</span>
                                            <span class="position">董事长</span>
                                        </div>                      
                                    </div>
                                    <div class="testimonials style6"> 
                                        <div class="message">                                
                                            <blockquote class="whisper">
                                               " 美丽，就是我们的信仰。"
                                             </blockquote>
                                        </div>
                                        <div class="avatar"> 
                                            <span class="name">王亚泽</span>
                                            <span class="position">CEO</span>
                                        </div>                      
                                    </div>
                                </div>
                            </div> 

                            <div class="widget widget-help">
                                <h6>你想要加入我们吗?</h6>
                                <p>一张网页，要经历怎样的过程，才能抵达用户面前？一位新人，要经历怎样的成，才能站在技术之巅？探寻这里的秘密；体验这里的挑战；成为这里的主人；加入艾美惠，加入艾美惠美容，你，可以拥有一切。</p>
                                <button class="flat-btn btn-control">1025535469@qq.com</button>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-9 col-sm-8">
                        <div class="post-wrap">
                            <article class="post clearfix">
                                
                                <div class="content-post">
                                    <h2 class="title-post"><a>亲情服务 传奇体验</a></h2>          
                                    <div class="entry-excerpt"> 
                                        <div class="entry-content-text">                            
                                            {$Think.const.WEB_NAME}严格执行JCI标准。JCI标准有两大核心：确保患者的医疗安全和保障患者家属的权利。JCI追寻的医疗体制是始终遵循在每一个环节与患者相互交流。在这种体制下，医院就能将患者安全和护理置于首位。
                                        </div>
                                        <div class="entry-content-text">
                                            JCI体系所追求的目标是将各种错误控制在可接受的限度内。这个限度被患者和全世界的保险公司所接受，这样也使得JCI认证在世界上得到广泛的认可。现在，全世界的医院都在追求国际认证，因为它能确保患者在安全的环境中得到较佳的医疗服务。
                                        </div>
                                        <div class="entry-content-text">
                                            {$Think.const.WEB_NAME}是国内通过JCI认证的整形美容机构，并严格执行JCI标准，力争让顾客的权益较大化。医院成功引进国际知名整形美容专家团队，进行整形美容教学与微整形技术临床研究，同时引进国际医疗护理团队，以国际整形美容较先进的护理作为配套服务。
                                        </div> 
                                    </div>
                                    <div class="video-about">
                                        <div class="video-haft video bond-row">
                                        </div>
                                        <div class="two-haft wrap-box">
                                            <div class="flat-accordion">
                                                <div class="flat-toggle">
                                                    <div class="toggle-title active">美丽导医 全程跟踪</div>
                                                    <div class="toggle-content">
                                                        <p>自从你走进医院的那一刻起，我们的美丽导医就开始伴你左右，作为你的美丽天使，全程跟踪服务。</p>
                                                    </div>
                                                </div><!-- /toggle -->
                                                <div class="flat-toggle">
                                                    <div class="toggle-title">严格体系 术前检查</div>
                                                    <div class="toggle-content">
                                                        <p>术前均严格按照医疗程序，进行严格的身体检查，专业医护人员为求美者做细致的医学影像记录，将安全隐患消除在手术前。</p>
                                                    </div>
                                                </div><!-- /toggle -->
                                                <div class="flat-toggle">
                                                    <div class="toggle-title">充分沟通 较佳效果</div>
                                                    <div class="toggle-content">
                                                        <p>术前顾客与专家进行深度交流，详细了解整个手术过程中可能出现的情况，出于对不同顾客 的情况作出较适合的手术方案，同事也保证手术的较大安全。</p>
                                                    </div>
                                                </div><!-- /toggle -->
                                                <div class="flat-toggle">
                                                    <div class="toggle-title">权威专家 终身负责</div>
                                                    <div class="toggle-content">
                                                        <p>由医院权威专家亲诊，术前咨询设计、术中手术操作、术后一天两次的复查，均有权威专家亲自负责，全力维护求美者以较佳的身体状态进行恢复。</p>
                                                    </div>
                                                </div><!-- /toggle -->
                                                <div class="flat-toggle">
                                                    <div class="toggle-title">术后服务 细致入微</div>
                                                    <div class="toggle-content">
                                                        <p>原装引进的医疗护理团队，以JCI国际管理标准较高医疗认证的1300项考核指标的严格要求，为客户提供较细致入微的纯正医疗美容服务。</p>
                                                    </div>
                                                </div><!-- /toggle -->
                                                <div class="flat-toggle">
                                                    <div class="toggle-title">专车接送 细致服务</div>
                                                    <div class="toggle-content">
                                                        <p>不管你是坐飞机、火车、高铁，医院将全程负责你将安全到达医院，无论是机场、火车站，只要有需求，我们将派车全程接送。</p>
                                                    </div>
                                                </div><!-- /toggle -->
                                            </div><!-- /.accordion -->
                                        </div>
                                    </div>
                                </div><!-- /.content-post -->
                            </article>                 
                        </div><!-- /.post-wrap -->
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
    

    <script type="text/javascript" src="/index/js/main.js"></script>

</body>
</html>

