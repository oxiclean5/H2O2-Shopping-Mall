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
<h2 align="center">상품 등록</h2>
<form:form action="../product/entry.html" method="post"
	modelAttribute="item">
	<fieldset>
		<legend>상세 정보 입력</legend>
		상품코드 : <form:input path="code" size="5"/>
		<font color="red"><form:errors path="code"/></font><br/>
		상품이름 : <form:input path="name" size="20"/>
		<font color="red"><form:errors path="name"/></font><br/>
		상품가격 : <form:input path="price" size="10"/>
		<font color="red"><form:errors path="price"/></font><br/>
		원산지 : <form:select path="origin">
			<form:option value="한국"/><form:option value="일본"/>
			<form:option value="중국"/><form:option value="기타"/>
		</form:select><br/>
		상품설명(아래) : <br/>
		<form:textarea rows="5" cols="80" path="info"></form:textarea>
		<br/>
	</fieldset>	
	<div align="center"><input type="submit" value="등록"/>
						<input type="reset" value="취소"/></div>
</form:form>
</body>
</html>










