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
	<h3 align="center">��ǰ�� �������� �α����� �ؾ��մϴ�.</h3>
	</c:when>
</c:choose>
<form:form action="../cart/login.html" 
	modelAttribute="guest" method="post">
���̵� : <form:input path="id" size="12" placeholder="����"/>
<font color="red"><form:errors path="id"/></font><br/>
�� ȣ : <form:password path="password" size="12"/>
<font color="red"><form:errors path="password"/></font><br/>
<input type="submit" value="�α���"/><input type="reset" value="���"/>
</form:form>
</div>
</body>
</html>












