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
    <link rel="stylesheet" type="text/css" href="/index/css/style1.css"/>
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
                                <li>公司历史</li>
                            </ul>
                        </div><!-- breadcrumb -->
                        <div class="page-content ">
                            <span>公司历史</span>
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
                                    <li class="active"><a href="company_history.html">公司历史</a></li>
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
                                <div class="content-post">
                                    <div class="content">
                                      <div class="wrapper">
                                        <div class="light"><i></i></div>
                                        <hr class="line-left">
                                        <hr class="line-right">
                                        <div class="main">
                                          <div class="year">
                                            <h2><a href="#">2014年<i></i></a></h2>
                                            <div class="list">
                                              <ul>
                                                <li class="cls highlight">
                                                  <p class="date">3月26日</p>
                                                  <p class="intro">微俱聚硬件微美图正式推出</p>
                                                  <p class="version">&nbsp;</p>
                                                  <div class="more">
                                                    <p>首创微信集商务、娱乐一体化多媒体智能终端机微美图打印机</p>
                                                    <p>营销推广活动支持导入SN码</p>
                                                    <p>微商城模板，支持分类列表</p>
                                                    <p>微商城完整支持微信支付</p>
                                                    <p>微商城数据统计显示顺序更正</p>
                                                    <p>微商城支持商品预览</p>
                                                    <p>微商城订单成功后，网页将收到新订单通知</p>
                                                    <p>幸运机活动时间延长至三个月等6个改进及Bug</p>
                                                  </div>
                                                </li>
                                                <li class="cls">
                                                  <p class="date">3月19日</p>
                                                  <p class="intro">全新会员卡3.0、微官网3.0、微商城2.0上线，渠道统计模块上线！</p>
                                                  <p class="version">&nbsp;</p>
                                                  <div class="more">
                                                    <p>会员卡手机端会员卡页面全部改版，给用户更时尚大方的体验</p>
                                                    <p>会员卡完全自定义会员用户信息</p>
                                                    <p>会员卡支持领卡手机短信验证</p>
                                                    <p>会员卡支持快捷充值，余额支付</p>
                                                    <p>会员卡支持领取优惠券，代金券，礼品券</p>
                                                    <p>会员卡支持开卡即送功能，包括开卡送优惠券，送积分，送代金券等等</p>
                                                    <p>会员卡积分支持兑换礼品券</p>
                                                    <p>会员卡支持给用户发送通知</p>
                                                    <p>微商城中添加搜索框，增加商品的模糊匹配</p>
                                                    <p>微商城中不同的商品详情，支持不同的配置</p>
                                                    <p>微商城订单文档说明文字更详尽，并同时同步到订单说明里面</p>
                                                    <p>微商城商品自动审核优化, 防止过滤过严</p>
                                                    <p>微商城列表展现页的图片支持自适应大小</p>
                                                    <p>微商城将图文与商品整合，提供统一的商品配置</p>
                                                    <p>微官网提供多套底部导航菜单</p>
                                                    <p>微官网的分类支持高级分类，高级分类同时也可以设置模板</p>
                                                    <p>微官网支持背景动画</p>
                                                    <p>微官网支持背景音乐</p>
                                                    <p>渠道统计功能上线，用户可以通过生成二维码统计各渠道新增的粉丝</p>
                                                    <p>美化门店的手机UI界面，并提供外链访问</p>
                                                    <p>修复微活动的活动封面无法更换等5个Bug</p>
                                                  </div>
                                                </li>
                                                <li class="cls">
                                                  <p class="date">3月12日</p>
                                                  <p class="intro">首家支持微信支付，多客服系统上线！</p>
                                                  <p class="version">&nbsp;</p>
                                                  <div class="more">
                                                    <p>为公众账号的微信支付提供技术接入，通过简单配置即可使用微信支付</p>
                                                    <p>微信公众平台高级接口支持，通过认证的服务号可以使用多客服系统回复粉丝</p>
                                                    <p>微商城首页添加多套模板，详情页支持模板自定义，商城购买商品支持微信支付；商城首页图片自适应等等十多个细节改进</p>
                                                  </div>
                                                </li>
                                                <li class="cls">
                                                  <p class="date">3月5日</p>
                                                  <p class="intro">360全景隆重上线！</p>
                                                  <p class="version">&nbsp;</p>
                                                  <div class="more">
                                                    <p>全新360全景模块上线，3D看房、3D看车、3D看实景，一网打尽</p>
                                                    <p>微官网新增24套一级模板</p>
                                                    <p>微官网提供全局颜色调色器</p>
                                                  </div>
                                                </li>
                                                <li class="cls">
                                                  <p class="date">2月26日</p>
                                                  <p class="intro">微婚庆行业应用上线</p>
                                                  <p class="version">&nbsp;</p>
                                                  <div class="more">
                                                    <p>提供更加友好的套餐价格</p>
                                                    <p>提供经典案例，并可以二维码扫描</p>
                                                    <p>提供更新日志，让您每周有惊喜</p>
                                                  </div>
                                                </li>
                                                <li class="cls">
                                                  <p class="date">2月19日</p>
                                                  <p class="intro">微信墙(微信大屏幕)上线</p>
                                                  <p class="version">&nbsp;</p>
                                                  <div class="more">
                                                    <p>支持上墙、抽奖、投票等等功能的微信墙上线</p>
                                                    <p>修正一战到底等多个模块的13个Bug, 并提供7个新改进</p>
                                                  </div>
                                                </li>
                                                <li class="cls">
                                                  <p class="date">2月12日</p>
                                                  <p class="intro">微贺卡上线</p>
                                                  <p class="version"></p>
                                                </li>
                                                <li class="cls highlight">
                                                  <p class="date">1月</p>
                                                  <p class="intro">微俱聚V6.0上线</p>
                                                  <p class="version">&nbsp;</p>
                                                  <div class="more">
                                                    <p>确立每周迭代、周三发布，用户参与推动模块开发的小米模式</p>
                                                  </div>
                                                </li>
                                              </ul>
                                            </div>
                                          </div>
                                          <div class="year">
                                            <h2><a href="#">2013年<i></i></a></h2>
                                            <div class="list">
                                              <ul>
                                                <li class="cls">
                                                  <p class="date">12月</p>
                                                  <p class="intro">微俱聚V5.4上线</p>
                                                  <p class="version">&nbsp;</p>
                                                  <div class="more">
                                                    <p>形成完整的基础服务+互动推广+业务管理+行业应用+应用商店的服务架构</p>
                                                    <p>注册用户突破10万，荣获“创业之星”大赛八强</p>
                                                  </div>
                                                </li>
                                                <li class="cls">
                                                  <p class="date">11月</p>
                                                  <p class="intro">微俱聚v5.3上线</p>
                                                  <p class="version">&nbsp;</p>
                                                  <div class="more">
                                                    <p>全新渠道代理管理后台上线，更便捷更强大</p>
                                                    <p>荣获2013年微应用最佳服务商</p>
                                                  </div>
                                                </li>
                                                <li class="cls">
                                                  <p class="date">10月</p>
                                                  <p class="intro">微俱聚V5.2上线</p>
                                                  <p class="version">&nbsp;</p>
                                                  <div class="more">
                                                    <p>与众多行业建立合作，推出多个行业解决方案</p>
                                                  </div>
                                                </li>
                                                <li class="cls">
                                                  <p class="date">9月</p>
                                                  <p class="intro">微俱聚V5.1上线</p>
                                                  <p class="version">&nbsp;</p>
                                                  <div class="more">
                                                    <p>发力行业O2O应用，为商家提供量身定制的行业方案</p>
                                                  </div>
                                                </li>
                                                <li class="cls highlight">
                                                  <p class="date">8月</p>
                                                  <p class="intro">全新微俱聚平台V5.0上线</p>
                                                  <p class="version">&nbsp;</p>
                                                  <div class="more">
                                                    <p>推出微信应用商店，为商家提供更丰富的应用选择</p>
                                                    <p>整合众多优秀微信应用，打造微应用分发平台</p>
                                                  </div>
                                                </li>
                                                <li class="cls highlight">
                                                  <p class="date">7月</p>
                                                  <p class="intro">微信加更名为微俱聚</p>
                                                  <p class="version">&nbsp;</p>
                                                  <div class="more">
                                                    <p>出于品牌和商标保护的考虑，微信加平台更名</p>
                                                  </div>
                                                </li>
                                                <li class="cls">
                                                  <p class="date">6月</p>
                                                  <p class="intro">微信加V4.0上线</p>
                                                  <p class="version">&nbsp;</p>
                                                  <div class="more">
                                                    <p>微信在线预约、更多微信互动模块和微官网模板，商家业务展现日渐丰富</p>
                                                    <p>签约《中国好声音》，成为其微信独家战略合作伙伴</p>
                                                  </div>
                                                </li>
                                                <li class="cls">
                                                  <p class="date">5月</p>
                                                  <p class="intro">微信加V3.0上线</p>
                                                  <p class="version">&nbsp;</p>
                                                  <div class="more">
                                                    <p>推出微信会员卡、微信团购等业务模块，打通更多商家业务</p>
                                                  </div>
                                                </li>
                                                <li class="cls">
                                                  <p class="date">4月</p>
                                                  <p class="intro">微信加V2.0上线</p>
                                                  <p class="version">&nbsp;</p>
                                                  <div class="more">
                                                    <p>推出微官网等微信业务模块，实现微信与商家业务对接</p>
                                                  </div>
                                                </li>
                                                <li class="cls">
                                                  <p class="date">3月</p>
                                                  <p class="intro">微信加V1.0上线</p>
                                                  <p class="version">&nbsp;</p>
                                                  <div class="more">
                                                    <p>微信基础服务模块+微信互动推广模块上线</p>
                                                    <p>创造微信公众号一周涨5万粉的奇迹</p>
                                                  </div>
                                                </li>
                                                <li class="cls">
                                                  <p class="date">1月</p>
                                                  <p class="intro">全网第一个微信刮刮卡、大转盘上线</p>
                                                  <p class="version">&nbsp;</p>
                                                  <div class="more">
                                                    <p>微信互动推广模块上线，用实际行动证明微信鸡汤有毒</p>
                                                  </div>
                                                </li>
                                              </ul>
                                            </div>
                                          </div>
                                          <div class="year">
                                            <h2><a href="#">2012年<i></i></a></h2>
                                            <div class="list">
                                              <ul>
                                                <li class="cls">
                                                  <p class="date">8月</p>
                                                  <p class="intro">顿悟</p>
                                                  <p class="version">&nbsp;</p>
                                                  <div class="more">
                                                    <p>顿悟，微信公众平台是企业移动互联网化的入口</p>
                                                  </div>
                                                </li>
                                                <li class="cls">
                                                  <p class="date">8月以前</p>
                                                  <p class="intro">实现一个NB的社会化APP</p>
                                                  <p class="version">&nbsp;</p>
                                                </li>
                                              </ul>
                                            </div>
                                          </div>
                                          <div class="year">
                                            <h2><a href="#">2012年以前<i></i></a></h2>
                                            <div class="list">
                                              <ul>
                                                <li class="cls">
                                                  <p class="date">&nbsp;</p>
                                                  <p class="intro">在企业管理市场和SAP、Oracle厮杀</p>
                                                  <p class="version">&nbsp;</p>
                                                  <div class="more">
                                                    <p>我不会告诉你，我们是参与全球J2EE标准制定组织成员</p>
                                                  </div>
                                                </li>
                                              </ul>
                                            </div>
                                          </div>
                                        </div>
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
    <script>
        $(".main .year .list").each(function (e, target) {
            var $target=  $(target),
                $ul = $target.find("ul");
            $target.height($ul.outerHeight()), $ul.css("position", "absolute");
        }); 
        $(".main .year>h2>a").click(function (e) {
            e.preventDefault();
            $(this).parents(".year").toggleClass("close");
        });
    </script>
</body>
</html>

