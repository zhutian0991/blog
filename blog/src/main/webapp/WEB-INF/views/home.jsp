<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>微光空间</title>
<meta name="keywords" content="微光空间" />
<meta name="description" content="微光空间" />
<meta name="uyan_auth" content="071851c9a5" />
<link href="${pageContext.request.contextPath}/css/base.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/index.css" rel="stylesheet">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.ico" type="image/x-icon" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.1.min.js"></script>
</head>
<body>
<embed src="${pageContext.request.contextPath}/music/wait-one-minute.mp3" autostart="true" hidden="true" loop="1">
<div id="wrapper">
  <header>
    <div class="headtop"></div>
    <div class="contenttop">
    <div class="logo f_l" style="display: inline-block;">微光空间</div>
	
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
	            	<li><a href="${pageContext.request.contextPath}/list.htm?id=${category.id}" target="_blank">${category.name}</a>
	            </c:forEach>            	
            	</ul>
            </li>
 			<li><a href="${pageContext.request.contextPath}/shuo.htm" target="_blank">碎言碎语</a> </li>
            <li><a href="javascript:;">关于我</a>
              <ul>
                <li><a href="${pageContext.request.contextPath}/about.htm" target="_blank">个人简介</a></li>
              </ul>
            </li>
            <li><a href="${pageContext.request.contextPath}/message.htm" target="_blank">留言板</a></li>
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
  <div class="jztop"></div>
  <div class="container">
    <div class="bloglist f_l">
      <c:forEach items="${articles}" var="article" varStatus="status">
      <h3><a href="${pageContext.request.contextPath}/showArticle.htm?id=${article.id}" target="_blank">${article.title}</a></h3>
      <figure><img src="${pageContext.request.contextPath}/images/img_${status.count}.jpg"></figure>
      <ul>
        <p>${article.digest}</p>
        <a href="${pageContext.request.contextPath}/showArticle.htm?id=${article.id}" target="_blank" class="readmore">阅读全文&gt;&gt;</a>
      </ul>
      <p class="dateview">
	      <span><fmt:formatDate value="${article.createtime}" pattern="yyyy-MM-dd"/></span>
	      <span>作者：微光</span>
	      <span>个人空间：[<a href="${pageContext.request.contextPath}/list.htm?id=${article.categoryid}">${article.category.name}</a>]</span>
      </p>     
      </c:forEach>
    </div>
    <div class="r_box f_r">
      <div class="tit01">
        <h3 class="tit">关注我</h3>
        <div class="gzwm">
          <ul>
            <li><a class="email" >我的电话</a></li>
            <li><a class="qq" href="#" title="${suser.email}">我的邮箱</a></li>
            <li><a class="tel" href="#" title="${suser.qq}">我的QQ</a></li>
            <li><a class="prize" href="#">个人奖项</a></li>
          </ul>
        </div>
      </div>
      <!--tit01 end-->
      <c:if test="${not empty weather}">
      <div class="ph">
      	<h3 class="tit">天气信息</h3>
      	<table>
			<tr>
				<td rowspan="2" style="padding-right: 30px;padding-left: 20px;"><font size="5">${weather.city}</font></td>
				<c:if test="${weather.pic1 == weather.pic2}">
					<td>
						<img alt="" src="weather/b_${weather.pic1}">
					</td>
				</c:if>
				<c:if test="${weather.pic1 != weather.pic2}">
					<td>
						<img alt="" src="weather/${weather.pic1}">
						<img alt="" src="weather/${weather.pic2}">
					</td>
				</c:if>
				<td style="padding-left: 10px;font-size: 160%;">${weather.tq}<br>${weather.emperature}</td>
			</tr>
		</table>
      </div>
      </c:if>
      <div class="ph">
        <h3 class="tit">最新文章</h3>
        <ul class="rank">
          <c:forEach items="${rankArticles}" var="rankArticle">
          	<li><a href="${pageContext.request.contextPath}/showArticle.htm?id=${rankArticle.id}" target="_blank">${rankArticle.title}</a></li>
          </c:forEach>
        </ul>
      </div>
      <div class="ad"> <img src="${pageContext.request.contextPath}/images/03.jpg"> </div>
    </div>
  </div>
  <!-- container代码 结束 -->
  <div class="jzend"></div>
  <footer>
    <div class="footer">
      <div class="f_l">
        <p>All Rights Reserved 版权所有：<a href="http://www.guduke.cn/">微光空间</a>  备案号：湘ICP备17018824</p>
      </div>
      <div class="f_r textr">
        <p>Design by Guduke</p>
      </div>
    </div>
  </footer>
</div>
</body>
</html>