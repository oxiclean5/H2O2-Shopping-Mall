<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<c:choose>
	<c:when test="${sessionScope.loginUser != null}">
	<h3 align="center">로그인 되었습니다.</h3>
	<h2 align="center">환영합니다~ ${sessionScope.loginUser}님~</h2>
	</c:when>
	<c:otherwise>
		<h3 align="center">로그인 되지 않았습니다.</h3>
		<h3 align="center">암호를 확인하세요.</h3>
		<c:if test="${cartLogin == 'fail' }">
			<a href="../cart/login.html">■다시 로그인하기</a>
		</c:if>
	</c:otherwise>
</c:choose>
<c:choose>
	<c:when test="${cartLogin == 'success' }">
		<script type="text/javascript">
		self.close();opener.window.location.reload();
		</script>
	</c:when>
</c:choose>
</body>
</html>









