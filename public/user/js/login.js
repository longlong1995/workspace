$(document).ready(function(){

    $(".register_items input").keyup(function(e){
        if(e.keyCode >= 188){
            $(this).val(replaceQuote($(this).val()));
        }
    });

	behaviorWarpper(0,login_authCodeGen);
	loginValidate();//登录验证

	// 意义不明
	//通过检测链接中是否包含'?'来判断链接是否但参数，若有参数则弹出注册页面
  	// registerFromIndex
	if(typeof(pageType) !='undefined' && pageType=='register'){
		$(this).addClass("login_active");
		$(this).siblings(".p_login").removeClass("login_active");
		$(this).find(".img_register").css("background-position","0px -27px");
		$(".login_items").slideUp();
		$(".register_items").slideDown();
		$(".p_register").unbind('hover');
		behaviorWarpper(1, register_authCodeGen);
	}

	//登录注册切换
	var $register = $('.p_register'),
		$login = $('.p_login'),
		$copeLogin = $('.coopeLogin_title');

	// 注册的小图标的笑脸事件
	function handleRegisterIconEnter() {
		$(this).addClass("login_active").find(".img_register").stop().animate({"background-position-y":"-27px"},200);
	}
	function handleRegisterIconOut() {
		$(this).removeClass("login_active").find(".img_register").stop().animate({"background-position-y":"0px"},200);
	}

	// 登录标签点击的时候
	function handleClickLoginTab() {
		var $this = $(this),
			$loginBlk = $(".login_items");

			if(!$loginBlk.is(':visible')){
				behaviorWarpper(0,login_authCodeGen,true);
			}

			$(".login_error").hide();

			$this.addClass('login_active').siblings(".p_register").removeClass("login_active").find(".img_register").css("background-position","0px 0px");
			$(".register_items").slideUp();
			$(".coopeLogin_mainFiild").slideUp();
			$loginBlk.slideDown();



			$copeLogin.attr('type','OPEN').text('使用其他账号登录');
			$register.unbind('hover').hover(handleRegisterIconEnter, handleRegisterIconOut);
	}

	// 注册标签点击的时候
	function handleClickRegisterTab() {
		var $this = $(this),
			$registerBlk = $(".register_items");

			$(".login_error").hide();


			if(!$registerBlk.is(':visible')){
				behaviorWarpper(1,register_authCodeGen,true);
			}

			$this.addClass('login_active').siblings(".p_login").removeClass("login_active");
			$this.find(".img_register").css("background-position","0px -27px");
			$register.unbind('hover');

			$(".login_items").slideUp();
			$(".coopeLogin_mainFiild").slideUp();
			$registerBlk.slideDown();

			$copeLogin.attr('type','OPEN').text('使用其他账号登录');
	}

	// 合作登录被点击的时候
	function handleClickCoopeLoginTab() {
		var $this = $(this),
			tabType = $this.attr('type');

		if(tabType === 'OPEN'){
			$(".login_items").slideUp();
			$(".register_items").slideUp();
			$(".coopeLogin_mainFiild").slideDown(400,function(){
				$register.find(".img_register").stop().animate({"background-position-y":"0px"},200);
				$login.addClass('login_active').siblings(".p_register").removeClass("login_active");
			});
			$this.attr("type","CLOSED").text("直接登录");

		} else if(tabType === 'CLOSED'){
			$(".register_items").slideUp();
			$(".coopeLogin_mainFiild").slideUp();
			$(".login_items").slideDown();
			$this.attr("type","OPEN").text("使用其他账号登录");
		}
	}

	// 事件的绑定
	$register.hover(handleRegisterIconEnter, handleRegisterIconOut);
	$register.click(handleClickRegisterTab);
	$login.click(handleClickLoginTab);
	$copeLogin.click(handleClickCoopeLoginTab);


	//二级域名登陆，调整显示的公司字体大小
	var corpName = $(".p_login_Corp");
	if (corpName.length > 0) {
		var fontSize = parseInt(corpName.css("font-size").replace("px", ""));
		while ( getTextWidth(corpName.text(), fontSize, "MYH") > 318 ) {
			fontSize = fontSize-2;
			corpName.css("font-size", fontSize);
		}
	}

	function handleForgetPasswordConfirm() {
		// bind email confirm event when btn shown.
			var $email = $(this).siblings('.input'),
				emailVal = $.trim($email.val());

	}

	// 回车提交邮箱
	function handleForgotPasswdInputKeyup(evt){
		var $this = $(this);
		if(evt.which === 13){
			//handleForgetPasswordConfirm.call($this.siblings('.popwin_forgetPassword_confirm')[0]);
		}
	}

	function handleForgotPasswdBoxOpen(){
		var emailVal = $.trim($('#login_email').val()),
			$box = $('#forgetPasswordPopWin');

		if(emailVal){
			$box.find('.popwin_newForm_input').val(emailVal);
		}

		$box.find('.popwin_newForm_input').trigger('focus');

		$box.off('click.confirm').on('click.confirm','.popwin_forgetPassword_confirm',handleForgetPasswordConfirm);
		$box.off('keyup.emailEnterConfirm').on('keyup.emailEnterConfirm','.popwin_newForm_input',handleForgotPasswdInputKeyup);
	}

	//弹窗--忘记密码
	$("#forgetPassword").click(function(){
		TINY.box.show({
			html:$(".popwin_forgetPassword").html(),
			width:414,
			height:222,
			fixed:false,
			maskid:'blackmask',
			maskopacity:40,
			boxid: 'forgetPasswordPopWin',
			openjs: handleForgotPasswdBoxOpen
		});
	});

	//弹窗--服务协议
	$("#treaty").click(function(){
		TINY.box.show({
			html:$("#popwin_treaty").html(),
			width:414,
			height:470,
			fixed:false,
			maskid:'blackmask',
			maskopacity:40
		});
	});

	//登录状态下，点回车提交表单
	$('#login_main').on('keyup','#login_password,#login_authcode,#register_authcode',function(e){
		var keyCode = e.keyCode ? e.keyCode : e.which ? e.which : e.charCode;
		if (keyCode == 13){
			$(this).closest("form").find('.login_btn').trigger('click');
		}
	});

	$('#login_main').on('click','.img_authCode',function(e){
		if ($(this).closest('form').hasClass('login_items')) {
			behaviorWarpper(0,login_authCodeGen);
		}else{
			behaviorWarpper(1,register_authCodeGen);
		}
	});

	// 验证组件中的事件绑定
	inviteEvent();
	
	// wiki过来默认触发忘记密码
	var wiki = getParam('wiki');
	
	if(wiki && wiki.length > 0 && wiki === 'forget') {
		$('#forgetPassword').trigger('click');	
	}
	
	function getParam(name) {
		name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
		var regexS = "[\\?&]" + name + "=([^&#]*)";
		var regex = new RegExp(regexS);
		var results = regex.exec(window.location.search);
		if (results == null) {
			return "";
		} else {
			return decodeURIComponent(results[1].replace(/\+/g, " "));
		}
	}
});

//登录验证/事件绑定
function loginValidate(){
	$('#login_items .login_btn').click(function(){
		var email = $('[name="username"]').val();
		var password = $('[name="password"]').val();
		if (!email && !password) {
			$(".login_error").text("请输入用户名和密码").css("display","block");
			return false;
		}else if (!email) {
			$(".login_error").text("请输入用户名").css("display","block");
			return false;
		}else if (!password) {
			$(".login_error").text("请输入密码").css("display","block");
			return false;
		}else if( ($('#login_authcode').length !== 0)&&(!$('[name="AUTHCODE"]').val()) ){
			$(".login_error").text("请输入验证码").css("display","block");
			return false;
		}else{
			//login();
		}
		
	});

}



//注册验证
function registValidate(){
	$("#register_items").validate({
		rules: {
			phone: {

				required: true,
				phone: true,
				maxlength: 11,
				minlength: 11,
			},
			password: {
				required: true,
				minlength: 6
			},
			username: {
				required: true,
				minlength: 6,
				maxlength: 30,
			},
			code: {
				required: true,
				minlength: 6,
				maxlength: 6
			}
		},
		onkeyup: false,
		onclick: false,
		focusInvalid: false,
		success: function(label){
			$(label).parent().addClass("checkRight");
			$(label).remove();
		},
		errorPlacement: function(error,element){
			element.parent().removeClass("checkRight");
			error.appendTo(element.parent()).after("<div class='error_img'></div>");
		},
		// submitHandler: function(){
		// 	register();
		// }
	});
}
var behaviorWarpper;
(function(){
	var statusRemember = {},
		lazyGetStatus = false,
		uncertain = {};

	// 获取当前状态
	behaviorWarpper = function(type,gener_cb,in_trigger,_cb){	// _cb 表示在调用完成之后的处理
		// 在注册、登录之前必须做的事情 ==== 验证是否太频繁
		type = type?'1':'0';

		if(lazyGetStatus){
			window.clearTimeout(lazyGetStatus);
		}
		lazyGetStatus = false;

	};

	behaviorWarpper.getState = function(_type){
		return uncertain[_type];
	};

})();

//普通登录
function login() {
	var formid = $("#login_items");
	var dataLogin = tojson(formid);

	function __login(){
		$.ajax({
			type: "post",
			url: "",
			dataType: 'JSON',
			data: {
				DATA: dataLogin
			},
			success: function (data) {
				if (data.flag){
					$(".login_error").css("display","none");

					if( destPage !== null ){
						location.href = destPage;
					}else{
						location.href = "";
					}
				}else{
					if(data.errorCode+'' === '999'){
						// $(".login_error").text("系统异常，请重试").hide().fadeIn();
						window.location.reload();
					} else if(data.errorCode+'' === '111') {
						$(".login_error").text("验证码错误，请重新填写").hide().fadeIn();
					}  else if(data.errorCode+'' === '222') {
                        $(".login_error").text("该用户已被封禁,请联系客服").hide().fadeIn();
                    } else {
						$(".login_error").text("用户名或密码错误").hide().fadeIn();
					}
					behaviorWarpper(0,login_authCodeGen);
				}
			},
			error: function(){
				$(".login_error").text("系统异常，请稍候").hide().fadeIn();
			}
		});
	}

	if(behaviorWarpper.getState('0')){
		behaviorWarpper(0,login_authCodeGen,false,function(){
			__login();
		});
	} else {
		__login();
	}

}

function login_authCodeGen (_img){
	if($('#login_authcode').length === 0){
		$('<label class="input_val"><input class="input" name="AUTHCODE" id="login_authcode" autocomplete="off"><span style="display: none;">验证码</span><img class="img_authCode" src="data:image/png;base64,'+_img+'" style="top: -5px;height: 24px;" title="点击换一张"></label>').insertBefore('.login_msg').trigger('focus').find('input').blur();
	} else {
		$('#login_authcode').val('').trigger('focus').siblings('img').attr('src','data:image/png;base64,'+_img).css({
			top: '-5px',
			height: '24px'
		});
	}
}

// 注册
function register() {
	var formid = $("#register_items");
	var dataRegister = tojson(formid);
	var $register_authcode = $('#register_authcode');
	$register_authcode.closest('.input_val').removeClass('checkRight');
	function __register(){
		if(formid.data('reg')){
			return false;
		}
		formid.data('reg',true);
		$.ajax({
			type: "post",
			url: "/index/user/userinfo",
			mode:"sync",
			dataType: 'JSON',
			data: {
				DATA: dataRegister
			},
			error: function () {
				formid.data('reg',false);
				return false;
			},
			beforeSend: function(data) {
				// $(".login_btn").html("注&nbsp;&nbsp;册&nbsp;&nbsp;中").removeClass('submit');
			},
			success: function (data) {
				alert(data);
				if(data){
					if (data.flag){
						$(".login_btn").html("注&nbsp;&nbsp;册&nbsp;&nbsp;成&nbsp;&nbsp;功");
					}else{
						if (data.errorCode == 111) {
							$(".register_error").text("验证码错误，请重新填写").css("display","block");
						}
						behaviorWarpper(1,register_authCodeGen);
					}

				} else {

					$(".register_error").text("服务器繁忙，请重试").css("display","block");
					behaviorWarpper(1,register_authCodeGen);
				}
				

				formid.data('reg',false);

			}
		});
	}

	
}
function register_authCodeGen (_img){
	if($('#register_authcode').length === 0){
		$('<label class="input_val"><input class="input" type="text" name="AUTHCODE" id="register_authcode" autocomplete="off"><span style="display: none;">验证码</span><img class="img_authCode" src="data:image/png;base64,'+_img+'" style="top: -5px;height: 24px;" title="点击换一张"></label>').insertBefore($('#register_items').find('.remeber')).trigger('focus').find('input').blur();
	} else {
		$('#register_authcode').val('').trigger('focus').siblings('img').attr('src','data:image/png;base64,'+_img).css({
			top: '-5px',
			height: '24px'
		});
	}
}

function inviteEvent(){
	var $loginElem = $(document);
	$loginElem.on('click','.invite-resend',function(){
		//resendInvite($.trim($("#register_items").find("[name='phone']").val()));
	});

	$loginElem.on('click','.create-new',function(){
		deleteInvite($.trim($("#register_items").find("[name='phone']").val()));
	});
}


