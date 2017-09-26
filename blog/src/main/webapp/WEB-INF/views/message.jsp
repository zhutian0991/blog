<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>留言板</title>
<meta name="keywords" content="孤独客空间" />
<meta name="description" content="孤独客空间" />
<link href="${pageContext.request.contextPath}/css/base.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/main1.css" rel="stylesheet">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.ico" type="image/x-icon" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.1.min.js"></script>
</head>
<body>
<div id="wrapper">
  <header>
    <div class="headtop"></div>
    <div class="contenttop">
    <div class="logo f_l" style="display: inline-block;">孤独客空间</div>
	
    <div class="search f_r" style="display: inline-block;">
      <p>${suser.motto}</p>
    </div>
	  <div class="blank"></div>
      <nav>
        <div class="navigation">
          <ul class="menu">
            <li><a href="${pageContext.request.contextPath}/home.htm">网站首页</a></li>
            <li><a href="javascript:;">我的文章</a>
            	<ul>
	            <c:forEach items="${categories}" var="category">
	            	<li><a href="${pageContext.request.contextPath}/list.htm?id=${category.id}">${category.name}</a>
	            </c:forEach>            	
            	</ul>
            </li>
 			<li><a href="${pageContext.request.contextPath}/shuo.htm">碎言碎语</a> </li>
            <li><a href="javascript:;">关于我</a>
              <ul>
                <li><a href="${pageContext.request.contextPath}/about.htm">个人简介</a></li>
              </ul>
            </li>
            <li><a href="${pageContext.request.contextPath}/message.htm">留言板</a></li>
          </ul>
        </div>
      </nav>
      <SCRIPT type=text/javascript>
	// Navigation Menu
	$(function() {
		$(".menu ul").css({display: "none"}); // Opera Fix
		$(".menu li").hover(function(){
			$(this).find('ul:first').css({visibility: "visible",display: "none"}).slideDown("normal");
		},function(){
			$(this).find('ul:first').css({visibility: "hidden"});
		});
	});
</SCRIPT> 
    </div>
  </header>
  <div class="container">
    <div class="con_content">
      <div class="about_box">
        <h2 class="nh1" style=""><span>您现在的位置是：<a href="${pageContext.request.contextPath}/home.htm">网站首页</a>>><a href="#">信息浏览</a></span><b>留言板</b></h2>
        <ul class="about_content">
          <div id="uyan_frame"></div>
		  <script type="text/javascript" src="http://v2.uyan.cc/code/uyan.js?uid=2142725"></script>
        </ul>
      </div>
    </div>
    <div class="blank"></div>
  </div>
  <!-- container代码 结束 -->
  
  <footer>
    <div class="footer">
      <div class="f_l">
        <p>All Rights Reserved 版权所有：<a href="http://www.guduke.cn/">孤独客空间</a></p>
      </div>
      <div class="f_r textr">
        <p>Design by Guduke</p>
      </div>
    </div>
  </footer>
</div>
</body>
</html>
