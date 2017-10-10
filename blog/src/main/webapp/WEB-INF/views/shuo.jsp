<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>碎言碎语</title>
<meta name="keywords" content="微光空间" />
<meta name="description" content="微光空间" />
<link href="${pageContext.request.contextPath}/css/base.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/main1.css" rel="stylesheet">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/pagination.css">
<!--[if lt IE 9]>
<script src="js/modernizr.js"></script>
<![endif]-->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.1.min.js"></script>
</head>

<body>
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
      <h2 class="nh1"><span>您现在的位置是：<a href="${pageContext.request.contextPath}/home.htm">网站首页</a>>><a href="#">碎言碎语</a></span><b>碎言碎语</b></h2>
      <div class="weizi">

      </div>
      <div class="pagelist" style="padding-top: 30px;">
      	<div id="Pagination" class="pagination"></div>
      </div>
    </div>
  </div>
  <div class="blank"></div>
    <!--header end-->
    <!--content start-->
    <!--content end-->
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
<script src="${pageContext.request.contextPath}/js/jquery.pagination.js"></script>
<script type="text/javascript">
	$(function(){
		queryWord(0);
	});
	function queryWord(pageindex){
    	var dataObj = {"pageNo":(pageindex+1),"pageSize":8};
	    var loadingindex = -1;
	    var content = "";
	    $.ajax({
	    	url:"${pageContext.request.contextPath}/wordList.do",
	    	type:"post",
	    	data:dataObj,
	    	success:function(result){
	    		if(result.success){
					var words = result.page.data;
					var totalSize = result.page.totalSize;
					$.each(words,function(index,word){
						var time = (new Date(word.createtime)).toLocaleDateString();
						content+='<ul class="say_box">';
						content+='	<div class="sy">';
						content+='		<p>'+word.content+'</p>';
						content+='	</div>';
						content+='	<span class="dateview">'+time+'</span>';
					    content+='</ul>';
					});
					$(".weizi").html(content);
            		$("#Pagination").pagination(totalSize, {
            			num_edge_entries: 1, //边缘页数
            			num_display_entries: 4, //主体页数
            			current_page:pageindex,
            			prev_text:"上一页",
            			next_text:"下一页",
            			callback: queryWord,
            			items_per_page:8 //每页显示1项
            		});							
	    		}
	    	}
	    });
    }	
</script>
</body>
</html>