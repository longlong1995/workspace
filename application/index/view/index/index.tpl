<!DOCTYPE html>
<!--[if IE 8 ]><html class="ie" xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-US" lang="en-US"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!-->
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-US" lang="en-US"><!--<![endif]-->
<head>
    <!-- Basic Page Needs -->
    <meta charset="utf-8">
    <!--[if IE]><meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'><![endif]-->
    <title>{$Think.const.WEB_NAME}</title>

    <meta name="author" content="">

    <!-- Mobile Specific Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <!-- Bootstrap  -->
    <link rel="stylesheet" type="text/css" href="/index/css/bootstrap.css" >

    <!-- Theme Style -->
    <link rel="stylesheet" type="text/css" href="/index/css/style.css">

    <!-- Colors -->
    <link rel="stylesheet" type="text/css" href="/index/css/colors/color1.css" id="colors">

    <!-- REVOLUTION LAYERS STYLES -->
    <link rel="stylesheet" type="text/css" href="/index/revolution/css/layers.css">
    <link rel="stylesheet" type="text/css" href="/index/revolution/css/settings.css">

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
                                <a href="/index/index/setting.html">
                                    <img src="{$user.picture}" style="height: 30px;width: 30px; border-radius: 30px;">
                                </a>
                            </li>
                            <li><a>{$user.username}</a></li>
                            {if ($user.usertype == 1)}
                            <li><a href="/admin/index/login.html">管理中心</a></li>
                            {/if}
                            <li><a href="/index/index/layout.html">退出</a></li>
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

       <div id="rev_slider_1078_1_wrapper" class="rev_slider_wrapper fullwidthbanner-container slide-overlay" data-alias="classic4export" data-source="gallery" style="margin:0px auto;background-color:transparent;padding:0px;margin-top:0px;margin-bottom:0px;">
            
            <!-- START REVOLUTION SLIDER 5.3.0.2 auto mode -->
            <div id="rev_slider_1078_1" class="rev_slider fullwidthabanner" style="display:none;" data-version="5.3.0.2">
                <div class="slotholder"></div>
                    <ul><!-- SLIDE  -->
                
                        <!-- SLIDE 1 -->
                        <li data-index="rs-3049" data-transition="slideremovedown" data-slotamount="7" data-hideafterloop="0" data-hideslideonmobile="off"  data-easein="Power4.easeInOut" data-easeout="Power4.easeInOut" data-masterspeed="2000"    data-rotate="0"  data-saveperformance="off"  data-title="Ken Burns" data-param1="" data-param2="" data-param3="" data-param4="" data-param5="" data-param6="" data-param7="" data-param8="" data-param9="" data-param10="" data-description="">                        
                            <!-- <div class="overlay">
                            </div> -->
                            <!-- MAIN IMAGE -->
                            <img src="{$Think.const.CAROUSEL_PICTURE1}"  alt=""  data-bgposition="center center" data-kenburns="off" data-duration="30000" data-ease="Linear.easeNone" data-scalestart="100" data-scaleend="120" data-rotatestart="0" data-rotateend="0" data-offsetstart="0 0" data-offsetend="0 0" data-bgparallax="10" class="rev-slidebg" data-no-retina>
                            <!-- LAYERS -->

                            <!-- LAYER NR. 12 -->
                            <div class="tp-caption title-slide" 
                                id="slide-3049-layer-1" 
                                data-x="['center','center','center','center']" data-hoffset="['2','2','2','2']" 
                                data-y="['middle','middle','middle','middle']" data-voffset="['-85','-85','-85','-85']" 
                                data-fontsize="['60','60','45','33']"
                                data-lineheight="['65','65','45','35']"
                                data-fontweight="['700','700','700','700']"
                                data-width="none"
                                data-height="none"
                                data-whitespace="nowrap"
                     
                                data-type="text" 
                                data-responsive_offset="on"                             

                                data-frames='[{"delay":1000,"speed":2000,"frame":"0","from":"y:-50px;opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"auto:auto;","ease":"Power3.easeInOut"}]'

                                data-textAlign="['center','center','center','center']"
                                data-paddingtop="[10,10,10,10]"
                                data-paddingright="[0,0,0,0]"
                                data-paddingbottom="[0,0,0,0"
                                data-paddingleft="[0,0,0,0]"

                                style="z-index: 16; white-space: nowrap;">{$Think.const.CAROUSEL_TITLE1}
                            </div>

                            <!-- LAYER NR. 13 -->
                            <div class="tp-caption sub-title" 
                                id="slide-3049-layer-4" 
                                data-x="['center','center','center','center']" data-hoffset="['2','2','2','2']" 
                                data-y="['middle','middle','middle','middle']" data-voffset="['-6','-6','-6','-6']"
                                data-fontsize="['16',16','16','14']" 
                                data-lineheight="['28','28','22','16']"
                                data-fontweight="['200','200','200','200']"
                                data-width="['800',800','800','450']"
                                data-height="none"
                                data-whitespace="['nowrap',normal','normal','normal']" 
                     
                                data-type="text" 
                                data-responsive_offset="on" 

                                data-frames='[{"from":"y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;","mask":"x:0px;y:[100%];s:inherit;e:inherit;","speed":2000,"to":"o:1;","delay":1500,"ease":"Power4.easeInOut"},{"delay":"wait","speed":1000,"to":"y:[100%];","mask":"x:inherit;y:inherit;s:inherit;e:inherit;","ease":"Power2.easeInOut"}]'
                                data-textAlign="['center','center','center','center']"
                                data-paddingtop="[0,0,0,0]"
                                data-paddingright="[0,0,0,0]"
                                data-paddingbottom="[0,0,0,0]"
                                data-paddingleft="[0,0,0,0]"

                                style="z-index: 17; white-space: nowrap;">{$Think.const.CAROUSEL_CONTENT1}
                            </div>

                            <a href="/index/index/center.html" target="_self" class="tp-caption flat-button-slider bg-blue"         

                            data-frames='[{"from":"y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;","mask":"x:0px;y:[100%];s:inherit;e:inherit;","speed":2000,"to":"o:1;","delay":2000,"ease":"Power4.easeInOut"},{"delay":"wait","speed":1000,"to":"y:[100%];","mask":"x:inherit;y:inherit;s:inherit;e:inherit;","ease":"Power2.easeInOut"}]'
                         
                            data-x="['center','center','center','center']" data-hoffset="['-71','-71','-78','-78']" 
                            data-y="['middle','middle','middle','middle']" data-voffset="['87','87','87','87']" 
                            data-width="['auto']"
                            data-height="['auto']"
                            style="z-index: 3;">动动手指
                            </a><!-- END LAYER LINK -->
                            <a href="/index/index/center.html" target="_self" class="tp-caption flat-button-slider bg-white"         

                            data-frames='[{"from":"y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;","mask":"x:0px;y:[100%];s:inherit;e:inherit;","speed":2000,"to":"o:1;","delay":2000,"ease":"Power4.easeInOut"},{"delay":"wait","speed":1000,"to":"y:[100%];","mask":"x:inherit;y:inherit;s:inherit;e:inherit;","ease":"Power2.easeInOut"}]'
                         
                            data-x="['center','center','center','center']" data-hoffset="['73','73','78','78']" 
                            data-y="['middle','middle','middle','middle']" data-voffset="['87','87','87','87']"  
                            data-width="['auto']"
                            data-height="['auto']"
                            style="z-index: 3;">一键预约
                            </a><!-- END LAYER LINK -->
                        </li>

                        <!-- SLIDE 2 -->
                        <li data-index="rs-3048" data-transition="slideremoveright" data-slotamount="default" data-hideafterloop="0" data-hideslideonmobile="off"  data-easein="Power4.easeInOut" data-easeout="Power4.easeInOut" data-masterspeed="2000"    data-rotate="0"  data-saveperformance="off"  data-title="HTML5 Video" data-param1="" data-param2="" data-param3="" data-param4="" data-param5="" data-param6="" data-param7="" data-param8="" data-param9="" data-param10="" data-description="">

                            <!-- <div class="overlay">
                            </div> -->
                            <!-- MAIN IMAGE -->
                            <img src="{$Think.const.CAROUSEL_PICTURE2}"  alt=""  data-bgposition="center center" data-bgfit="cover" data-bgparallax="10" class="rev-slidebg" data-no-retina>
                            
                            


                            <!-- LAYER NR. 12 -->
                            <div class="tp-caption title-slide" 
                                id="slide-3048-layer-1" 
                                data-x="['center','center','center','center']" data-hoffset="['2','2','2','2']" 
                                data-y="['middle','middle','middle','middle']" data-voffset="['-85','-85','-85','-85']" 
                                data-fontsize="['60','60','45','33']"
                                data-lineheight="['60','60','45','35']"
                                data-fontweight="['700','700','700','700']"
                                data-width="none"
                                data-height="none"
                                data-whitespace="nowrap"
                     
                                data-type="text" 
                                data-responsive_offset="on"                             

                                data-frames='[{"delay":1000,"speed":2000,"frame":"0","from":"y:-50px;opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"auto:auto;","ease":"Power3.easeInOut"}]'

                                data-textAlign="['center','center','center','center']"
                                data-paddingtop="[10,10,10,10]"
                                data-paddingright="[0,0,0,0]"
                                data-paddingbottom="[0,0,0,0"
                                data-paddingleft="[0,0,0,0]"

                                style="z-index: 16; white-space: nowrap;">{$Think.const.CAROUSEL_TITLE2}
                            </div>

                            <!-- LAYER NR. 13 -->
                            <div class="tp-caption sub-title" 
                                id="slide-3048-layer-4" 
                                data-x="['center','center','center','center']" data-hoffset="['2','2','2','2']" 
                                data-y="['middle','middle','middle','middle']" data-voffset="['-6','-6','-6','-6']"
                                data-fontsize="['16',16','16','12']" 
                                data-lineheight="['28','28','20','16']"
                                data-fontweight="['300','300','300','300']"
                                data-width="['800',800','800','450']"
                                data-height="none"
                                data-whitespace="['nowrap',normal','normal','normal']" 
                     
                                data-type="text" 
                                data-responsive_offset="on" 

                                data-frames='[{"from":"y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;","mask":"x:0px;y:[100%];s:inherit;e:inherit;","speed":2000,"to":"o:1;","delay":1500,"ease":"Power4.easeInOut"},{"delay":"wait","speed":1000,"to":"y:[100%];","mask":"x:inherit;y:inherit;s:inherit;e:inherit;","ease":"Power2.easeInOut"}]'
                                data-textAlign="['center','center','center','center']"
                                data-paddingtop="[0,0,0,0]"
                                data-paddingright="[0,0,0,0]"
                                data-paddingbottom="[0,0,0,0]"
                                data-paddingleft="[0,0,0,0]"

                                style="z-index: 17; white-space: nowrap;text-transform:left;">{$Think.const.CAROUSEL_CONTENT2}
                            </div>

                            <a href="/index/index/shop.html" target="_self" class="tp-caption flat-button-slider bg-blue"         

                            data-frames='[{"from":"y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;","mask":"x:0px;y:[100%];s:inherit;e:inherit;","speed":2000,"to":"o:1;","delay":2000,"ease":"Power4.easeInOut"},{"delay":"wait","speed":1000,"to":"y:[100%];","mask":"x:inherit;y:inherit;s:inherit;e:inherit;","ease":"Power2.easeInOut"}]'
                         
                            data-x="['center','center','center','center']" data-hoffset="['-71','-71','-71','-78']" 
                            data-y="['middle','middle','middle','middle']" data-voffset="['87','87','87','87']" 
                            data-width="['auto']"
                            data-height="['auto']"
                            style="z-index: 3;">动动手指
                            </a><!-- END LAYER LINK -->
                            <a href="/index/index/shop.html" target="_self" class="tp-caption flat-button-slider bg-white"         

                            data-frames='[{"from":"y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;","mask":"x:0px;y:[100%];s:inherit;e:inherit;","speed":2000,"to":"o:1;","delay":2000,"ease":"Power4.easeInOut"},{"delay":"wait","speed":1000,"to":"y:[100%];","mask":"x:inherit;y:inherit;s:inherit;e:inherit;","ease":"Power2.easeInOut"}]'
                         
                            data-x="['center','center','center','center']" data-hoffset="['73','73','73','78']" 
                            data-y="['middle','middle','middle','middle']" data-voffset="['87','87','87','87']"  
                            data-width="['auto']"
                            data-height="['auto']"
                            style="z-index: 3;">一键预约
                            </a><!-- END LAYER LINK -->
                        </li>     
                        <!-- SLIDE 3 -->
                        <li data-index="rs-3047" data-transition="slideremoveleft" data-slotamount="7" data-hideafterloop="0" data-hideslideonmobile="off"  data-easein="Power4.easeInOut" data-easeout="Power4.easeInOut" data-masterspeed="2000"    data-rotate="0"  data-saveperformance="off"  data-title="Ken Burns" data-param1="" data-param2="" data-param3="" data-param4="" data-param5="" data-param6="" data-param7="" data-param8="" data-param9="" data-param10="" data-description="">                        
                            <!-- <div class="overlay">
                            </div> -->
                            <!-- MAIN IMAGE -->
                            <img src="{$Think.const.CAROUSEL_PICTURE3}"  alt=""  data-bgposition="center center" data-kenburns="off" data-duration="30000" data-ease="Linear.easeNone" data-scalestart="100" data-scaleend="120" data-rotatestart="0" data-rotateend="0" data-offsetstart="0 0" data-offsetend="0 0" data-bgparallax="10" class="rev-slidebg" data-no-retina>
                            <!-- LAYERS -->

                            <!-- LAYER NR. 12 -->
                            <div class="tp-caption title-slide" 
                                id="slide-3049-layer-1" 
                                data-x="['center','center','center','center']" data-hoffset="['2','2','2','2']" 
                                data-y="['middle','middle','middle','middle']" data-voffset="['-85','-85','-85','-85']" 
                                data-fontsize="['60','60','45','33']"
                                data-lineheight="['65','65','45','35']"
                                data-fontweight="['700','700','700','700']"
                                data-width="none"
                                data-height="none"
                                data-whitespace="nowrap"
                     
                                data-type="text" 
                                data-responsive_offset="on"                             

                                data-frames='[{"delay":1000,"speed":2000,"frame":"0","from":"y:-50px;opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"auto:auto;","ease":"Power3.easeInOut"}]'

                                data-textAlign="['center','center','center','center']"
                                data-paddingtop="[10,10,10,10]"
                                data-paddingright="[0,0,0,0]"
                                data-paddingbottom="[0,0,0,0"
                                data-paddingleft="[0,0,0,0]"

                                style="z-index: 16; white-space: nowrap;">{$Think.const.CAROUSEL_TITLE3}
                            </div>

                            <!-- LAYER NR. 13 -->
                            <div class="tp-caption sub-title" 
                                id="slide-3049-layer-4" 
                                data-x="['center','center','center','center']" data-hoffset="['2','2','2','2']" 
                                data-y="['middle','middle','middle','middle']" data-voffset="['-6','-6','-6','-6']"
                                data-fontsize="['16',16','16','14']" 
                                data-lineheight="['28','28','22','16']"
                                data-fontweight="['200','200','200','200']"
                                data-width="['800',800','800','450']"
                                data-height="none"
                                data-whitespace="['nowrap',normal','normal','normal']" 
                     
                                data-type="text" 
                                data-responsive_offset="on" 

                                data-frames='[{"from":"y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;","mask":"x:0px;y:[100%];s:inherit;e:inherit;","speed":2000,"to":"o:1;","delay":1500,"ease":"Power4.easeInOut"},{"delay":"wait","speed":1000,"to":"y:[100%];","mask":"x:inherit;y:inherit;s:inherit;e:inherit;","ease":"Power2.easeInOut"}]'
                                data-textAlign="['center','center','center','center']"
                                data-paddingtop="[0,0,0,0]"
                                data-paddingright="[0,0,0,0]"
                                data-paddingbottom="[0,0,0,0]"
                                data-paddingleft="[0,0,0,0]"

                                style="z-index: 17; white-space: nowrap;">{$Think.const.CAROUSEL_CONTENT3}
                            </div>

                            <a href="/index/index/doctor.html" target="_self" class="tp-caption flat-button-slider bg-blue"         

                            data-frames='[{"from":"y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;","mask":"x:0px;y:[100%];s:inherit;e:inherit;","speed":2000,"to":"o:1;","delay":2000,"ease":"Power4.easeInOut"},{"delay":"wait","speed":1000,"to":"y:[100%];","mask":"x:inherit;y:inherit;s:inherit;e:inherit;","ease":"Power2.easeInOut"}]'
                         
                            data-x="['center','center','center','center']" data-hoffset="['-71','-71','-78','-78']" 
                            data-y="['middle','middle','middle','middle']" data-voffset="['87','87','87','87']" 
                            data-width="['auto']"
                            data-height="['auto']"
                            style="z-index: 3;">动动手指
                            </a><!-- END LAYER LINK -->
                            <a href="/index/index/doctor.html" target="_self" class="tp-caption flat-button-slider bg-white"         

                            data-frames='[{"from":"y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;","mask":"x:0px;y:[100%];s:inherit;e:inherit;","speed":2000,"to":"o:1;","delay":2000,"ease":"Power4.easeInOut"},{"delay":"wait","speed":1000,"to":"y:[100%];","mask":"x:inherit;y:inherit;s:inherit;e:inherit;","ease":"Power2.easeInOut"}]'
                         
                            data-x="['center','center','center','center']" data-hoffset="['73','73','78','78']" 
                            data-y="['middle','middle','middle','middle']" data-voffset="['87','87','87','87']"  
                            data-width="['auto']"
                            data-height="['auto']"
                            style="z-index: 3;">一键预约
                            </a><!-- END LAYER LINK -->
                        </li>                    
                    </ul>
            </div>
        </div><!-- END REVOLUTION SLIDER --> 

        <section class="flat-row v8">
            <div class="container">
                <div class="row">
                    {if (!empty($beauty_info))}
                    {foreach ($beauty_info as $value)}
                    <div class="col-md-4 col-sm-6">
                        <article class="post style2 column clearfix">
                            <div class="featured-post">
                                <img src="{$value.images}" alt="image" style="height: 250px;width:100%;">
                            </div><!-- /.feature-post -->
                            <div class="content-post">
                                <h2 class="title-post">
                                    <a href="/index/index/center_details.html?bid={$value.bid}">{$value.bname}</a>
                                </h2>
                                <p style="overflow: hidden;text-overflow: ellipsis;white-space: nowrap;">{$value.description}</p>
                                <a href="/index/index/center_details.html?bid={$value.bid}">查看详情</a>
                            </div><!-- /.contetn-post -->
                        </article>
                    </div>
                    {/foreach}
                    {/if}
                </div>
            </div>
        </section>

        <div class="flat-row v4 parallax parallax5 wrap-counter">
            <div class="overlay"></div>
            <div class="container">
                <div class="row">                
                    <div class="col-md-3 col-sm-6">
                        <div class="flat-counter">                            
                            <div class="content-counter">
                                <div class="icon-count">
                                    <i class="icon_zoom-in_alt"></i>
                                </div>
                                <div class="numb-count">{$hits_count}</div>
                                <div class="name-count">网站点击量</div>
                            </div>
                        </div><!-- /.flat-counter -->
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="flat-counter">                            
                            <div class="content-counter">
                                <div class="icon-count">
                                    <i class="icon_shield_alt"></i>
                                </div>
                                <div class="numb-count">{$doctor_count}</div>
                                <div class="name-count">入驻专家</div>
                            </div>
                        </div><!-- /.flat-counter -->
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="flat-counter">
                            <div class="content-counter">
                                <div class="icon-count">
                                    <i class="icon_check_alt2"></i>
                                </div>
                                <div class="numb-count">{$order_count}</div>
                                <div class="name-count">已完成订单</div>
                            </div>
                        </div><!-- /.flat-counter -->
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="flat-counter">
                            <div class="content-counter">
                                <div class="icon-count margin-big">
                                    <i class="icon_key_alt"></i>
                                </div>
                                <div class="numb-count">{$user_count}</div>
                                <div class="name-count">用户数量</div>
                            </div>
                        </div><!-- /.flat-counter -->
                    </div>
                </div><!-- /.row -->
            </div><!-- /.container -->
        </div><!-- /.flat-row --> 

        <section class="business-financial">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <p>脚踏实地，做好自己，每一点进步，将为您带来更大的惊喜！</p>
                        <div class="btn-click">
                            <a href="/index/index/center.html" class="btn-black">完美自己</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="flat-row v9">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="title-section v2 style1">
                            <h1 class="title">品牌动态</h1>
                            <div class="sub-title">
                                最近活动
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4 col-sm-6">
                        <div class="iconbox center style4">
                            <div class="box-header">
                                <div class="box-icon">
                                    <i class="icon_mobile"></i>    
                                </div>
                            </div>
                            <div class="box-content">
                                <div class="box-title">媒体报道</div>    
                                <p>新闻报道</p> 
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-6">
                        <div class="iconbox center style4">
                            <div class="box-header">
                                <div class="box-icon">
                                    <i class="icon_tags_alt"></i>   
                                </div>
                            </div>
                            <div class="box-content">
                                <div class="box-title">医疗设备</div>    
                                <p>引进新设备</p> 
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-6">
                        <div class="iconbox center padding0 style4">
                            <div class="box-header">
                                <div class="box-icon">
                                    <i class="icon_lock-open_alt"></i>   
                                </div>
                            </div>
                            <div class="box-content">
                                <div class="box-title">医院环境</div>    
                                <p>周边地形</p> 
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4 col-sm-6">
                        <div class="iconbox center style4">
                            <div class="box-header">
                                <div class="box-icon style-lh1">
                                    <i class="icon_toolbox_alt"></i>    
                                </div>
                            </div>
                            <div class="box-content">
                                <div class="box-title">来院路线</div>    
                                <p>路程状况</p> 
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-6">
                        <div class="iconbox center style4">
                            <div class="box-header">
                                <div class="box-icon">
                                    <i class="icon_building"></i>    
                                </div>
                            </div>
                            <div class="box-content">
                                <div class="box-title">美容中心</div>    
                                <p>预约</p> 
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-6">
                        <div class="iconbox center padding0 style4">
                            <div class="box-header">
                                <div class="box-icon style-lh2">
                                    <i class="icon_camera_alt"></i>    
                                </div>
                            </div>
                            <div class="box-content">
                                <div class="box-title">美丽热线</div>    
                                <p>欢迎预约</p> 
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="flat-row bg-theme">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="title-section style1">
                            <h1 class="title">美容专家</h1>
                            <div class="sub-title">
                                美丽的大门为你敞开
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="flat-testimonials1 owl-carousel" data-item="3" data-nav="false" data-dots="true" data-auto="false">
                            {if (!empty($doctor_info))}
                            {foreach ($doctor_info as $value)}
                            <div class="testimonials style1"> 
                                <div class="avatar"> 
                                    <div class="testimonial-author-thumbnail">    
                                        <img src="{$value.picture}" alt="image">
                                    </div>
                                    <div class="name">
                                        <span>{$value.name}</span>
                                    </div>
                                    <div class="position">{$value.expert}</div>
                                    <div class="">学位:{$value.education}</div>
                                    <div>微信:{$value.wechat}</div>
                                </div>                     
                            </div>
                            {/foreach}
                            {/if}
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="flat-row v1 parallax parallax2 wrap-contact">
            <div class="container">
            <div class="overlay"></div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="title-section style1 colorwhite">
                            <h1 class="title">欢迎咨询</h1>
                            <div class="sub-title">
                               美丽无可替代青春永远都在
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <form id="contactform" class="flat-contact-form bg-transparent" method="post" action="index.html">
                            <div class="field clearfix"> 
                                <p class="wrap-select">
                                    <select class="select-field" name="sort_id">
                                        {if (!empty($beautySort_info))}
                                        {foreach ($beautySort_info as $value)}
                                        <option value="{$value.sid}">{$value.sname}</option>
                                        {/foreach}
                                        {/if}
                                    </select>
                                </p>
                                <p class="wrap-input-name">
                                    <input type="text" value="" tabindex="1" placeholder="Your Name" name="name" id="name" required>
                                </p>
                                <p class="wrap-input-email">
                                    <input type="email" value="" tabindex="2" placeholder="Your Email" name="email" id="subscribeemail" required>
                                </p>
                                <p class="wrap-btn">
                                    <button class="flat-btn subscribe-submit">咨询</button>
                                </p>
                            </div>
                        </form><!-- /.comment-form --> 
                    </div><!-- /.col-md-12-->                 
                </div><!-- /.row -->           
            </div><!-- /.container -->  
        </section>

        <section class="flat-row v10">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="title-section v3 style1">
                            <h1 class="title">成功案例</h1>
                        </div>
                    </div>
                </div>
                <div class="row">
                    {if (!empty($beautyorder_info))}
                    {foreach ($beautyorder_info as $value)}
                    <div class="col-md-4 col-sm-6">
                        <article class="post style2 clearfix">
                            <div class="featured-post">
                                <img src="{$value.images}" alt="image" style="width:100%;height:300px;">
                            </div><!-- /.feature-post -->
                            <div class="content-post">
                                <h5 class="title-post">
                                    <a>{:substr($value.username, 0, 1)}**选择了{$value.bname}项目</a>
                                </h5>
                                <ul class="meta-post clearfix">
                                    <li class="day-time">
                                        <span>{$value.addtime|date='Y-m-d H:i', ###}</span>
                                    </li>
                                </ul>
                            </div><!-- /.contetn-post -->
                        </article>
                    </div>
                    {/foreach}
                    {/if}
                </div>
            </div>
        </section>
       <!-- 滑动图 -->
        <section class="flat-row v3 bg-theme">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="title-section v3 style1">
                            <h1 class="title">合作伙伴</h1>
                        </div>
                    </div>
                </div>
                <div class="row">       
                    <div class="col-md-12">
                        <div class="flat-client" data-item="5" data-nav="false" data-dots="false" data-auto="true">
                            
                            {foreach ($link as $key=>$value)}
                            <div class="item c{$i++}"><a href="{$value.url}"><img src="{$value.logo}" alt="image"></a></div>
                            {/foreach} 
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
    
    <script type="text/javascript" src="/index/js/jquery-countTo.js"></script>
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

    <!-- Revolution Slider -->
    <script type="text/javascript" src="/index/revolution/js/jquery.themepunch.tools.min.js"></script>
    <script type="text/javascript" src="/index/revolution/js/jquery.themepunch.revolution.min.js"></script>
    <script type="text/javascript" src="/index/revolution/js/slider.js"></script>

    <!-- SLIDER REVOLUTION 5.0 EXTENSIONS  (Load Extensions only on Local File Systems !  The following part can be removed on Server for On Demand Loading) -->    
    <script type="text/javascript" src="/index/revolution/js/extensions/revolution.extension.actions.min.js"></script>
    <script type="text/javascript" src="/index/revolution/js/extensions/revolution.extension.carousel.min.js"></script>
    <script type="text/javascript" src="/index/revolution/js/extensions/revolution.extension.kenburn.min.js"></script>
    <script type="text/javascript" src="/index/revolution/js/extensions/revolution.extension.layeranimation.min.js"></script>
    <script type="text/javascript" src="/index/revolution/js/extensions/revolution.extension.migration.min.js"></script>
    <script type="text/javascript" src="/index/revolution/js/extensions/revolution.extension.navigation.min.js"></script>
    <script type="text/javascript" src="/index/revolution/js/extensions/revolution.extension.parallax.min.js"></script>
    <script type="text/javascript" src="/index/revolution/js/extensions/revolution.extension.slideanims.min.js"></script>
    

</body>
</html>

