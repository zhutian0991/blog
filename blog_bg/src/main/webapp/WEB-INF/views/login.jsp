<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="UTF-8">
  <head>
	<%@include file="/WEB-INF/views/common/head.jsp" %>
	<link rel="stylesheet" href="${APP_PATH}/css/login.css">
	<style>

	</style>
  </head>
  <body>
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <div><img src="${APP_PATH}/img/logo.png" width="50" style="float:left;margin-top:5px;"><a class="navbar-brand" style="font-size:32px;" href="${APP_PATH}/user/login.htm">博客后台管理系统</a></div>
        </div>
      </div>
    </nav>

    <div class="container">

      <form class="form-signin" role="form">
        <h2 class="form-signin-heading" align="center"><i class="glyphicon glyphicon-user"></i> 用户登录</h2>
		  <div class="form-group has-success has-feedback">
			<input type="text" class="form-control" id="floginacct" name="loginacct" placeholder="请输入登录账号" autofocus>
			<span class="glyphicon glyphicon-ok form-control-feedback"></span>
		  </div>
		  <div class="form-group has-success has-feedback">
			<input type="password" class="form-control" id="fpassword" name="password" placeholder="请输入登录密码" style="margin-top:10px;">
			<span class="glyphicon glyphicon-lock form-control-feedback"></span>
		  </div>
		  <div class="form-group has-success has-feedback">
			<input type="text" class="form-control" id="fverCode" name="verCode" placeholder="请输入验证码" style="margin-top:10px;">
			<span class="glyphicon glyphicon-question-sign form-control-feedback"></span>
		  </div>
          <div class="checkbox" style="display: inline;">
	          <label>
	            <input type="checkbox" id="frememberme" value="1">三天内免登录&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	          </label>
	      </div>
		  <div style="display: inline;width: 200px;">
			  <a href="javascript:;" onclick="javascript:changeImg()">
			  	<img id="img" src="${APP_PATH}/user/authImage.do" />
			  </a>
		  </div>	      
        <a style="margin-top: 10px;" class="btn btn-lg btn-success btn-block" id="loginBtn" ><i class="glyphicon glyphicon-log-in"></i> 登录</a>
      </form>
    </div>
    <%@include file="/WEB-INF/views/common/script.jsp" %>
    <script type="text/javascript">
    	$(function(){
    		$("#loginBtn").click(function(){
    			//判断用户账号是否为空
    			var loginacct =$("#floginacct").val();
        		loginacct = $.trim(loginacct);
        		if(loginacct==""){
        			layer.msg("请输入登录账号", {time:2000, icon:5, shift:6});
        			$("#floginacct").focus();
        			return;
        		}
        		
        		//判断用户密码是否为空
        		var password =$("#fpassword").val();
        		password = $.trim(password);
        		if(password==""){
        			layer.msg("请输入登录密码", {time:2000, icon:5, shift:6});
        			$("#fpassword").focus();
        			return;
        		}
        		
        		//获取记住我是否选择
        		var flag = $("#frememberme")[0].checked;
        		
        		//判断验证码是否为空
        		var verCode = $("#fverCode").val();
        		verCode = $.trim(verCode);
        		if(verCode==""){
        			layer.msg("请输入验证码", {time:2000, icon:5, shift:6});
        			$("#fverCode").focus();
        			return;
        		}
        		
        		//异步提交数据
        		$.ajax({
        			url:"${APP_PATH}/user/dologin.do",
        			type:"post",
        			data:{
        				"loginacct":loginacct,
        				"password":password,
        				"rememberme":flag?"1":"0",
        				"verCode":verCode
        			},
        			beforeSend:function(){
        				return true;
        			},
        			success:function(result){
        				if(result.success){
        					window.location.href="${APP_PATH}/main.htm";
        				}else{
        					if(result.verCode){
        						layer.msg("用户名或密码错误", {time:2000, icon:5, shift:6});
        					}else{
        						layer.msg("验证码错误", {time:2000, icon:5, shift:6});
        					}
        				}
        			}
        		});
    		})
    	});
    	
    	function changeImg(){
            var img = document.getElementById("img"); 
            img.src = "${pageContext.request.contextPath}/user/authImage.do?date=" + new Date();
        } 
    </script>
  </body>
</html>