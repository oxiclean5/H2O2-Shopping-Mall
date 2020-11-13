<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
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
<div align="center">
<h3 align="center">�̹��� �Խñ� �ۼ�</h3>
<form:form modelAttribute="writing" action="../write/write.html" 
	enctype="multipart/form-data" method="post">
<form:hidden path="order_no" value="${writing.order_no + 1 }"/>
<c:if test="${ ! empty writing.group_id }">
<form:hidden path="group_id" value="${writing.group_id }"/>
</c:if>	
<c:if test="${ ! empty writing.parent_id }">
<form:hidden path="parent_id" value="${writing.parent_id }"/>
</c:if>
<table border="1" width="80%">
	<tr><th width="30%">������</th>
		<td><form:input path="title" size="40"  value="${title }"/>
		<form:errors path="title"/></td></tr>
	<tr><th width="30%">�г���</th>
		<td><form:input path="writer_name" size="20"/>
		<form:errors path="writer_name"/></td></tr>
	<tr><th width="30%">�̸���</th>
		<td><form:input path="email" size="20"/>
		<form:errors path="email"/></td></tr>
	<tr><th width="30%">�� ȣ</th>
		<td><form:password path="password" size="20"/>
		<form:errors path="password"/></td></tr>
	<tr><th width="30%">�̹���</th>
		<td><input type="file" name="image" size="20"/></td></tr>
	<tr><th width="30%">�۳���</th>
		<td><form:textarea rows="8" cols="80" 
			path="content"></form:textarea>
		<form:errors path="content"/></td></tr>
	<tr><td colspan="2"><input type="submit" value="�� ��"/></td></tr>
</table>
</form:form>
</div>
</body>
</html>













