<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags"
	prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form"
	prefix="form" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div align="right">
<a href="../home/userentry.html">�����ϱ�</a></div>
<form:form action="../login/template.html" method="post" 
	modelAttribute="guest">
���̵�:<form:input path="id" size="12" 
	placeholder="������ �Է��ϼ���."/>
<font color="red"><form:errors path="id"/></font><br/>
�� ȣ:<form:password path="password" size="12"
	placeholder="��ȣ�� �Է��ϼ���."/>
<font color="red"><form:errors path="password"/></font><br/>
<input type="submit" value="�α���"/><input type="reset" value="���"/>
</form:form>
</body>
</html>








