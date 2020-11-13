<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://www.springframework.org/tags" 
	prefix="spring" %>    
<%@ taglib uri="http://www.springframework.org/tags/form"
	prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"
	prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<c:choose>
	<c:when test="${NOCART == 'yes' }">
		<h3 align="center">장바구니 목록을 보려면 로그인 해야 합니다.</h3>
	</c:when>
	<c:when test="${NOITEM == 'yes' }">
		<h3 align="center">상품을 등록하려면 로그인 해야 합니다.</h3>
	</c:when>
	<c:when test="${NOLOGIN == 'yes' }">
		<h3 align="center">글을 올리려면 로그인 해야 합니다.</h3>
	</c:when>
</c:choose>
<form:form modelAttribute="guest" method="post"
	action="../login/template.html">
계 정 : <form:input path="id" size="12"/>
<font color="red"><form:errors path="id"/></font><br/>
암 호 : <form:password path="password" size="12"/>
<font color="red"><form:errors path="password"/></font><br/>
<input type="submit" value="로그인"/>
<input type="reset" value="취 소"/>
</form:form>
<div align="right"><a href="../home/userentry.html">가입하기</a></div>
</body>
</html>












