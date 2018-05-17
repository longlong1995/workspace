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
    <script type="text/javascript" src="/index/js/jquery-1.7.2.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/index/css/style2.css">
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
                                <li>公司地址</li>
                            </ul>
                        </div><!-- breadcrumb -->
                        <div class="page-content ">
                            <span>公司连锁</span>
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
                                    <li class="active"><a href="company_ourteam.html">公司连锁</a></li>
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
                                    <div class="m_map">
                                        <div class="tait">目前覆盖全国<span>30+</span>个城市</div>
                                        <div class="mp mp1">
                                            <div class="feng">
                                                <div class="tree">
                                                    <div class="sang"></div>
                                                    <div class="boou"><img src="/index/images/boou.png" alt=""/></div>
                                                    <div class="du_size">
                                                        <P>地址：乌鲁木齐央区未央宫街道未央路2号老三届首座大厦11208 </P>
                                                        <P>电话：029-68829598</P>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mito find_mi1">乌鲁木齐</div>
                                        </div>
                                        <div class="mp mp3">
                                            <div class="feng">
                                                <div class="tree">
                                                    <div class="sang"></div>
                                                    <div class="boou"><img src="/index/images/boou.png" alt=""/></div>
                                                    <div class="du_size">
                                                        <P>地址：成都未央区未央宫街道未央路2号老三届首座大厦11208 </P>
                                                        <P>电话：029-68829598</P>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mito">成都</div>
                                        </div>
                                        <div class="mp mp4">
                                            <div class="feng">
                                                <div class="tree">
                                                    <div class="sang"></div>
                                                    <div class="boou"><img src="/index/images/boou.png" alt=""/></div>
                                                    <div class="du_size">
                                                        <P>地址：重庆未央区未央宫街道未央路2号老三届首座大厦11208 </P>
                                                        <P>电话：029-68829598</P>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mito">重庆</div>
                                        </div>
                                        <div class="mp mp5">
                                            <div class="feng">
                                                <div class="tree">
                                                    <div class="sang"></div>
                                                    <div class="boou"><img src="/index/images/boou.png" alt=""/></div>
                                                    <div class="du_size">
                                                        <P>地址：贵阳未央区未央宫街道未央路2号老三届首座大厦11208 </P>
                                                        <P>电话：029-68829598</P>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mito">贵阳</div>
                                        </div>
                                        <div class="mp mp6">
                                            <div class="feng">
                                                <div class="tree">
                                                    <div class="sang"></div>
                                                    <div class="boou"><img src="/index/images/boou.png" alt=""/></div>
                                                    <div class="du_size">
                                                        <P>地址：南宁未央区未央宫街道未央路2号老三届首座大厦11208 </P>
                                                        <P>电话：029-68829598</P>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mito">南宁</div>
                                        </div>
                                        <div class="mp mp7">
                                            <div class="feng">
                                                <div class="tree">
                                                    <div class="sang"></div>
                                                    <div class="boou"><img src="/index/images/boou.png" alt=""/></div>
                                                    <div class="du_size">
                                                        <P>地址：昆明未央区未央宫街道未央路2号老三届首座大厦11208 </P>
                                                        <P>电话：029-68829598</P>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mito">昆明</div>
                                        </div>
                                        <div class="mp mp8">
                                            <div class="feng">
                                                <div class="tree">
                                                    <div class="sang"></div>
                                                    <div class="boou"><img src="/index/images/boou.png" alt=""/></div>
                                                    <div class="du_size">
                                                        <P>地址：西安未央区未央宫街道未央路2号老三届首座大厦11208 </P>
                                                        <P>电话：029-68829598</P>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mito">西安</div>
                                        </div>
                                        <div class="mp mp9">
                                            <div class="feng" style="display: block;">
                                                <div class="tree">
                                                    <div class="sang"></div>
                                                    <div class="boou"><img src="/index/images/boou.png" alt=""/></div>
                                                    <div class="du_size">
                                                        <P>地址：郑州金水区经八路街道河南教育学院经纬楼七楼</P>
                                                        <P>电话：029-68829598</P>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mito">郑州</div>
                                        </div>
                                        <div class="mp mp10">
                                            <div class="feng">
                                                <div class="tree">
                                                    <div class="sang"></div>
                                                    <div class="boou"><img src="/index/images/boou.png" alt=""/></div>
                                                    <div class="du_size">
                                                        <P>地址：太原未央区未央宫街道未央路2号老三届首座大厦11208 </P>
                                                        <P>电话：029-68829598</P>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mito">太原</div>
                                        </div>
                                        <div class="mp mp11">
                                            <div class="feng">
                                                <div class="tree">
                                                    <div class="sang"></div>
                                                    <div class="boou"><img src="/index/images/boou.png" alt=""/></div>
                                                    <div class="du_size">
                                                        <P>地址：武汉未央区未央宫街道未央路2号老三届首座大厦11208 </P>
                                                        <P>电话：029-68829598</P>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mito">武汉</div>
                                        </div>
                                        <div class="mp mp12">
                                            <div class="feng">
                                                <div class="tree">
                                                    <div class="sang"></div>
                                                    <div class="boou"><img src="/index/images/boou.png" alt=""/></div>
                                                    <div class="du_size">
                                                        <P>地址：长沙未央区未央宫街道未央路2号老三届首座大厦11208 </P>
                                                        <P>电话：029-68829598</P>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mito">长沙</div>
                                        </div>
                                        <div class="mp mp13">
                                            <div class="feng">
                                                <div class="tree">
                                                    <div class="sang"></div>
                                                    <div class="boou"><img src="/index/images/boou.png" alt=""/></div>
                                                    <div class="du_size">
                                                        <P>地址：南昌未央区未央宫街道未央路2号老三届首座大厦11208 </P>
                                                        <P>电话：029-68829598</P>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mito">南昌</div>
                                        </div>
                                        <div class="mp mp14">
                                            <div class="feng">
                                                <div class="tree">
                                                    <div class="sang"></div>
                                                    <div class="boou"><img src="/index/images/boou.png" alt=""/></div>
                                                    <div class="du_size">
                                                        <P>地址：杭州未央区未央宫街道未央路2号老三届首座大厦11208 </P>
                                                        <P>电话：029-68829598</P>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mito">杭州</div>
                                        </div>
                                        <div class="mp mp15">
                                            <div class="feng">
                                                <div class="tree">
                                                    <div class="sang"></div>
                                                    <div class="boou"><img src="/index/images/boou.png" alt=""/></div>
                                                    <div class="du_size">
                                                        <P>地址：厦门未央区未央宫街道未央路2号老三届首座大厦11208 </P>
                                                        <P>电话：029-68829598</P>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mito">厦门</div>
                                        </div>
                                        <div class="mp mp16">
                                            <div class="feng">
                                                <div class="tree">
                                                    <div class="sang"></div>
                                                    <div class="boou"><img src="/index/images/boou.png" alt=""/></div>
                                                    <div class="du_size">
                                                        <P>地址：广州未央区未央宫街道未央路2号老三届首座大厦11208 </P>
                                                        <P>电话：029-68829598</P>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mito">广州</div>
                                        </div>
                                        <div class="mp mp17">
                                            <div class="feng">
                                                <div class="tree">
                                                    <div class="sang"></div>
                                                    <div class="boou"><img src="/index/images/boou.png" alt=""/></div>
                                                    <div class="du_size">
                                                        <P>地址：深圳未央区未央宫街道未央路2号老三届首座大厦11208 </P>
                                                        <P>电话：029-68829598</P>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mito">深圳</div>
                                        </div>
                                        <div class="mp mp18">
                                            <div class="feng">
                                                <div class="tree">
                                                    <div class="sang"></div>
                                                    <div class="boou"><img src="/index/images/boou.png" alt=""/></div>
                                                    <div class="du_size">
                                                        <P>地址：合肥未央区未央宫街道未央路2号老三届首座大厦11208 </P>
                                                        <P>电话：029-68829598</P>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mito">合肥</div>
                                        </div>
                                        <div class="mp mp19">
                                            <div class="feng">
                                                <div class="tree">
                                                    <div class="sang"></div>
                                                    <div class="boou"><img src="/index/images/boou.png" alt=""/></div>
                                                    <div class="du_size">
                                                        <P>地址：南京未央区未央宫街道未央路2号老三届首座大厦11208 </P>
                                                        <P>电话：029-68829598</P>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mito">南京</div>
                                        </div>
                                        <div class="mp mp20">
                                            <div class="feng">
                                                <div class="tree">
                                                    <div class="sang"></div>
                                                    <div class="boou"><img src="/index/images/boou.png" alt=""/></div>
                                                    <div class="du_size">
                                                        <P>地址：上海未央区未央宫街道未央路2号老三届首座大厦11208 </P>
                                                        <P>电话：029-68829598</P>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mito">上海</div>
                                        </div>
                                        <div class="mp mp21">
                                            <div class="feng">
                                                <div class="tree">
                                                    <div class="sang"></div>
                                                    <div class="boou"><img src="/index/images/boou.png" alt=""/></div>
                                                    <div class="du_size">
                                                        <P>地址：济南未央区未央宫街道未央路2号老三届首座大厦11208 </P>
                                                        <P>电话：029-68829598</P>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mito">济南</div>
                                        </div>
                                        <div class="mp mp22">
                                            <div class="feng">
                                                <div class="tree">
                                                    <div class="sang"></div>
                                                    <div class="boou"><img src="/index/images/boou.png" alt=""/></div>
                                                    <div class="du_size">
                                                        <P>地址：青岛未央区未央宫街道未央路2号老三届首座大厦11208 </P>
                                                        <P>电话：029-68829598</P>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mito">青岛</div>
                                        </div>
                                        <div class="mp mp23">
                                            <div class="feng">
                                                <div class="tree">
                                                    <div class="sang"></div>
                                                    <div class="boou"><img src="/index/images/boou.png" alt=""/></div>
                                                    <div class="du_size">
                                                        <P>地址：北京未央区未央宫街道未央路2号老三届首座大厦11208 </P>
                                                        <P>电话：029-68829598</P>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mito">北京</div>
                                        </div>
                                        <div class="mp mp24">
                                            <div class="feng">
                                                <div class="tree">
                                                    <div class="sang"></div>
                                                    <div class="boou"><img src="/index/images/boou.png" alt=""/></div>
                                                    <div class="du_size">
                                                        <P>地址：天津未央区未央宫街道未央路2号老三届首座大厦11208 </P>
                                                        <P>电话：029-68829598</P>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mito">天津</div>
                                        </div>
                                        <div class="mp mp25">
                                            <div class="feng">
                                                <div class="tree">
                                                    <div class="sang"></div>
                                                    <div class="boou"><img src="/index/images/boou.png" alt=""/></div>
                                                    <div class="du_size">
                                                        <P>地址：沈阳未央区未央宫街道未央路2号老三届首座大厦11208 </P>
                                                        <P>电话：029-68829598</P>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mito">沈阳</div>
                                        </div>
                                        <div class="mp mp26">
                                            <div class="feng">
                                                <div class="tree">
                                                    <div class="sang"></div>
                                                    <div class="boou"><img src="/index/images/boou.png" alt=""/></div>
                                                    <div class="du_size">
                                                        <P>地址：长春未央区未央宫街道未央路2号老三届首座大厦11208 </P>
                                                        <P>电话：029-68829598</P>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mito">长春</div>
                                        </div>
                                        <div class="mp mp27">
                                            <div class="feng">
                                                <div class="tree">
                                                    <div class="sang"></div>
                                                    <div class="boou"><img src="/index/images/boou.png" alt=""/></div>
                                                    <div class="du_size">
                                                        <P>地址：哈尔滨未央区未央宫街道未央路2号老三届首座大厦11208 </P>
                                                        <P>电话：029-68829598</P>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mito find_mi2">哈尔滨</div>
                                        </div>
                                        <div class="mp mp30">
                                            <div class="feng">
                                                <div class="tree">
                                                    <div class="sang"></div>
                                                    <div class="boou"><img src="/index/images/boou.png" alt=""/></div>
                                                    <div class="du_size">
                                                        <P>地址：东莞未央区未央宫街道未央路2号老三届首座大厦11208 </P>
                                                        <P>电话：029-68829598</P>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mito">东莞</div>
                                        </div>
                                        <div class="mp mp36">
                                            <div class="feng">
                                                <div class="tree">
                                                    <div class="sang"></div>
                                                    <div class="boou"><img src="/index/images/boou.png" alt=""/></div>
                                                    <div class="du_size">
                                                        <P>地址：洛阳岛未央区未央宫街道未央路2号老三届首座大厦11208 </P>
                                                        <P>电话：029-68829598</P>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mito">洛阳</div>
                                        </div>
                                        <div class="mp mp39">
                                            <div class="feng">
                                                <div class="tree">
                                                    <div class="sang"></div>
                                                    <div class="boou"><img src="/index/images/boou.png" alt=""/></div>
                                                    <div class="du_size">
                                                        <P>地址：湘潭岛未央区未央宫街道未央路2号老三届首座大厦11208 </P>
                                                        <P>电话：029-68829598</P>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mito">湘潭</div>
                                        </div>
                                        <div class="mp mp40">
                                            <div class="feng">
                                                <div class="tree">
                                                    <div class="sang"></div>
                                                    <div class="boou"><img src="/index/images/boou.png" alt=""/></div>
                                                    <div class="du_size">
                                                        <P>地址：石家庄岛未央区未央宫街道未央路2号老三届首座大厦11208 </P>
                                                        <P>电话：029-68829598</P>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mito find_mi2">石家庄</div>
                                        </div>
                                        <div class="mp mp50">
                                            <div class="feng">
                                                <div class="tree">
                                                    <div class="sang"></div>
                                                    <div class="boou"><img src="/index/images/boou.png" alt=""/></div>
                                                    <div class="du_size">
                                                        <P>地址：金华未央区未央宫街道未央路2号老三届首座大厦11208 </P>
                                                        <P>电话：029-68829598</P>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mito">金华</div>
                                        </div>
                                        
                                    </div>
                                    
                                </div><!-- /.feature-post -->
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


    <script type="text/javascript">
    jQuery(document).ready(function($) {
       $(".mp").mouseover(function(){
            $(this).find(".feng").show();   
        }).mouseout(function(){
            $(this).find(".feng").hide();

        }); 
    });
    </script>
</body>
</html>

