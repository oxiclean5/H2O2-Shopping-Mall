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
<h2 align="center">��ǰ ���</h2>
<form:form action="../product/entry.html" method="post"
	modelAttribute="item">
	<fieldset>
		<legend>�� ���� �Է�</legend>
		��ǰ�ڵ� : <form:input path="code" size="5"/>
		<font color="red"><form:errors path="code"/></font><br/>
		��ǰ�̸� : <form:input path="name" size="20"/>
		<font color="red"><form:errors path="name"/></font><br/>
		��ǰ���� : <form:input path="price" size="10"/>
		<font color="red"><form:errors path="price"/></font><br/>
		������ : <form:select path="origin">
			<form:option value="�ѱ�"/><form:option value="�Ϻ�"/>
			<form:option value="�߱�"/><form:option value="��Ÿ"/>
		</form:select><br/>
		��ǰ����(�Ʒ�) : <br/>
		<form:textarea rows="5" cols="80" path="info"></form:textarea>
		<br/>
	</fieldset>	
	<div align="center"><input type="submit" value="���"/>
						<input type="reset" value="���"/></div>
</form:form>
</body>
</html>










