<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h2 align="center">��ٱ��� ���</h2>
<c:if test="${CART_LIST == null }">
	<h3 align="center">��ٱ��ϰ� ������ϴ�.</h3>
</c:if>
<c:if test="${CART_LIST != null }">
<table border="1" align="center">
	<tr><th width="50">��ǰ��ȣ</th><th width="100">��ǰ�̸�</th>
		<th width="80">��ǰ����</th><th width="50">��ǰ����</th>
		<th width="100">�� ��</th><th width="100">����/����</th></tr>
	<c:forEach var="goods" items="${CART_LIST }">
	<form action="../cart/modify.html" method="post">
	<input type="hidden" value="${goods.code }" name="CODE"/>
	<tr><td>${goods.code }</td><td>${goods.name }</td>
		<td>
		<fmt:formatNumber groupingUsed="true">${goods.price }
			</fmt:formatNumber>
			</td>
		<td><input type="text" value="${goods.num }" name="NUM" size="3"/></td>
		<td>
		<fmt:formatNumber groupingUsed="true">${goods.price * goods.num }
			</fmt:formatNumber>
			</td>
		<td><input type="submit" value="����" name="BTN"/>
			<input type="submit" value="����" name="BTN"/></td></tr>
	</form>
	</c:forEach>
</table><br/>
<form action="" method="post">
�� �� : <fmt:formatNumber groupingUsed="true">${totalAmount }</fmt:formatNumber>
<input type="hidden" name="TOTAL"/><input type="submit" value="�����ϱ�"/>
</form>
</c:if>
</body>
</html>













