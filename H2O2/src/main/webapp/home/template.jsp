<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
body{height:100%;}
table.main{width:90%; height:80%; border:1px solid blue;
	border-collapse:collapse; margin-left:20px; margin-right:20px;}
td.main{border:1px solid blue;}
#login {width:80%; border:1px dashed grey; padding:10px;
		margin-top:10px; margin-left:10px;}
#menus {margin-top:10px; margin-left:20px;}
#content {background-color:orange;}
a:hover{background-color:yellow;}
td.main{background-color:lime;}
.btn {border:none; color:blue; padding:15px 32px; text-align:center;
		text-decoration:none; display:inline-block; font-size:16px;
		margin:4px 2px; cursor:pointer; background-color:orange;}
.sub {background-color:lightblue;}
</style>
</head>
<body>
<script type="text/javascript">
function menu3(){
	location.href="getBaseballTeam";
}
function menu1(){
	location.href="getBaseballHometown";
}
</script>
<h2 align="center"><img alt="" src="../imgs/logo.gif"></h2>
<table class="main sub">
<tr><td><div align="center">
<button class="btn" onClick="menu1()">야구구단 등록</button>
<button class="btn" onClick="menu2()">야구구단 목록</button>
<button class="btn" onClick="menu3()">야구선수 등록</button>
</div></td></tr>
</table>
<table class="main" width="100%">
<tr><td class="main" width="20%" height="300" valign="top">
		<div id="login">
			<c:choose>
				<c:when test="${sessionScope.loginUser == null }">
					<jsp:include page="../login/login.html"/>
				</c:when>
				<c:otherwise>
					<jsp:include page="logout.jsp"/>		
				</c:otherwise>
			</c:choose>
		</div><br/>
		<div id="menus">
			<a href="../home/intro.html?BODY=intro.jsp">소개</a><br/>
			<a href="../home/bbsForm.html">게시글 쓰기</a><br/>
			<a href="../read/read.html">게시글 목록</a><br/>
			<a href="">페널티 게임</a><br/>
			<a href="../product/open.html">상품 등록</a><br/>
			<a href="../read/product.html">상품 목록</a><br/>
			<a href="../cart/show.html">장바구니 보기</a><br/>
			<a href="../write/writeForm.html">답글 및 이미지 게시판</a><br/>
			<a href="../write/writeList.html">이미지 게시판 목록</a><br/><br/>
		</div>
	</td>
	<td id="content">
		<c:choose>
			<c:when test="${BODY != null }">
				<jsp:include page="${BODY }"/>
			</c:when>
			<c:otherwise>
				BODY가 없슴.	
			</c:otherwise>
		</c:choose>
	</td>
</tr>
</table>
<h3 align="center">CopyLeft 2020. FromAtoZucchini</h3>
</body>
</html>






