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
    <!-- Preloader -->
<section class="loading-overlay">
        <div class="Loading-Page">
            <h2 class="loader">位置</h2>
        </div>
    </section>  

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
                                <li>公司概括</li>
                            </ul>
                        </div><!-- breadcrumb -->
                        <div class="page-content ">
                            <span>公司概括</span>
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
                                    <li class="active"><a href="about.html">公司概括</a></li>
                                    <li><a href="company_history.html">公司历史</a></li>
                                    <li><a href="company_ourteam.html">公司连锁</a></li>
                                    <li><a href="company_address.html">公司地址</a></li>
                                    <li><a href="company_careers.html">公司成就</a></li>
                                    <li><a href="company_partners.html">服务流程</a></li>
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
                                <p>一张网页，要经历怎样的过程，才能抵达用户面前？一位新人，要经历怎样的成，才能站在技术之巅？探寻这里的秘密；体验这里的挑战；成为这里的主人；加入{$Think.const.WEB_NAME}，加入{$Think.const.WEB_NAME}美容，你，可以拥有一切。</p>
                                <button class="flat-btn btn-control">1025535469@qq.com</button>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-9 col-sm-8">
                        <div class="post-wrap">
                            <article class="post clearfix">
                                <div class="featured-post">
                                    <img src="/index/images/new/portfolio/services1.jpg" alt="image">
                                </div><!-- /.feature-post -->
                                <div class="content-post">
                                    <h2 class="title-post"><a>基本介绍</a></h2>                          
                                    <div class="entry-excerpt"> 
                                        <div class="entry-content-text">                            
                                            {$Think.const.WEB_NAME}成立于2017年，是北京千锋互联网络科技有限公司旗下的一家医美互联网平台，最早提出整形门户化网站的概念，率先开辟整形医院、整形项目、整形百科、赴韩整容、整形论坛等栏目，目前吸引中韩3000余家医院、20000余名专家入驻，求美者可通过整形科普文章以及详实的医院数据库，打破地域局限，足不出户即可在线预约项目和医生，直接与医院取得联系。
                                        </div>
                                        <div class="entry-content-text">
                                            控股于{$Think.const.WEB_NAME}的北京千锋互联网络科技有限公司，注册资本1000万，现有在职员工400多人。公司CEO王亚泽先生医学专业背景，一直专注于医美行业的研究和实践，从事医美咨询行业15年，常年深入一线的工作经历，让高总能快速、准确的了解求美者的需求和关注点，不断完善现有的术前术后服务体系，以更加及时、专业、周到、细致的服务赢得求美者青睐，从而间接提升医美行业的服务质量标准。
                                        </div> 
                                    </div>
                                    <div class="entry-excerpt company-text">
                                        <h6 class="title"><a>{$Think.const.WEB_NAME}文化</a></h6>
                                        <p><b>目标：</b>打造整形美容门户型网站，提供最新、最全面的整形美容资讯；提供最好、最完整的整形项目介绍。为千万网民的爱美生活而服务，为创建一个全方面的整形美容门户型网站而努力奋斗。 </p><br />
                                        <p><b>核心价值：</b>以真诚、智慧和决心成就每一个爱美之人，全心全意为网民提供便捷的资讯、咨询服务。</p>
                                    </div>
                                    <div class="entry-excerpt company-text final">
                                        <h6 class="title"><a>服务理念</a></h6>
                                        <p>
                                            <b>严谨=严格+谨慎</b><br />我们对每一个环节都用极度严谨的态度去对待。作为整形行业领导品牌，河南整形美容医院要求每一位员工严于律己，在每一个环节，做到谨慎入微，不出一点差错，让每一位求美者放心！<br>
                                            <b>责任=尽责+用心</b><br />我们会对每一位求美者负责到底。在平时的沟通中，伊人坊的每一位员工以服务顾客为己任，用最真诚温暖的话语与求美者进行交流，解决求美者的美丽困扰，尽心竭力。<br />
                                            <b>自信=阳光+时尚</b><br />
                                            我们虽然有时特别严肃，但时刻充满了自信。作为行业龙头，我们有十足的自信和阳光的心情用好的技术、时尚的美学元素服务于求美者，通过帮助爱美者实现美丽梦想，传递快乐而富有正能量的精神！
                                        </p>
                                    </div>
                                    <div class="video-about">
                                        <div class="video-haft video bond-row">
                                        </div>
                                        <div class="two-haft wrap-box">
                                            <h6>绿色美容</h6>
                                            <div class="flat-accordion">
                                                <div class="flat-toggle">
                                                    <div class="toggle-title active">全方位禁烟，保证空气质量</div>
                                                    <div class="toggle-content">
                                                        <p>办公区域和院区全面禁烟，既减少二氧化碳排放量美化环境，也提高了整个院区的空气质量。</p>
                                                    </div>
                                                </div><!-- /toggle -->
                                                <div class="flat-toggle">
                                                    <div class="toggle-title">提示小标语，细心提醒</div>
                                                    <div class="toggle-content">
                                                        <p>在医院的办公区域和病区，都贴有“离开前请关闭电源”、“爱惜地球资源”、“冷暖气开放中，请关好门窗”这样的提示标语。这些都已经深入到每一位员工的思想中，让所有人都能在工作中规范自己的行为，身体力行做到真正的节能低碳环保。</p>
                                                    </div>
                                                </div><!-- /toggle -->
                                                <div class="flat-toggle">
                                                    <div class="toggle-title">电子化管理，高效高科技</div>
                                                    <div class="toggle-content">
                                                        <p>秉承“节约资源、提高效率”的环保理念，医院通过引进“多嘴猫”、“电子门铃”等一整套先进的电子化管理系统，让医患之间随时随地畅通无阻的进行沟通。病房卫生间的设计也以病人实际需求为出发点，安装了化的坐便器，保温冲水自动一体化。在符合现代医学模式功能空间需要的同时，较大限度的提高效率，努力为医患人员提供健康、舒适、便捷的工作和就医环境。</p>
                                                    </div>
                                                </div><!-- /toggle -->
                                                <div class="flat-toggle">
                                                    <div class="toggle-title">无纸化办公，保护树木</div>
                                                    <div class="toggle-content">
                                                        <p>目前大型企业办公单位每天消耗大量的纸张，在日益吞噬着我们的森林。因此，医院倡导无纸化办公，尽量少用和不用纸张。即使在必须使用纸张时，医院规定必须两面打印，不得浪费。这一举措是使得我们在办公用品上的开支减少，达到开源节流的作用，同时也是在间接的保护环境。</p>
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

