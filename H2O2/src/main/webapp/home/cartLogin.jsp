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
<div align="center">
<c:choose>
	<c:when test="${RESULT == 'nocartlogin' }">
	<h3 align="center">상품을 담으려면 로그인을 해야합니다.</h3>
	</c:when>
</c:choose>
<form:form action="../cart/login.html" 
	modelAttribute="guest" method="post">
아이디 : <form:input path="id" size="12" placeholder="계정"/>
<font color="red"><form:errors path="id"/></font><br/>
암 호 : <form:password path="password" size="12"/>
<font color="red"><form:errors path="password"/></font><br/>
<input type="submit" value="로그인"/><input type="reset" value="취소"/>
</form:form>
</div>
</body>
</html>












