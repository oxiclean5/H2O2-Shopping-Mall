<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
<h2 align="center">�Խ��� �۾���</h2>
<form:form modelAttribute="bbs" method="post"
	action="../home/write.html">
�� �� : <form:input path="title" placeholder="�ݵ�� �ۼ��ؾ��մϴ�."/><br/>
<font color="red"><form:errors path="title"/></font><br/>
<form:textarea rows="5" cols="80" path="content"
	placeholder="�� ������ �Է��ϼ���."></form:textarea><br/>
<font color="red"><form:errors path="content"/></font>
<div align="center">
<input type="submit" value="�� �ø���"/>
<input type="reset" value="�� ��"/>
</div>
</form:form>
</body>
</html>




