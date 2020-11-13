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
<h2 align="center">장바구니 목록</h2>
<c:if test="${CART_LIST == null }">
	<h3 align="center">장바구니가 비었습니다.</h3>
</c:if>
<c:if test="${CART_LIST != null }">
<table border="1" align="center">
	<tr><th width="50">상품번호</th><th width="100">상품이름</th>
		<th width="80">상품가격</th><th width="50">상품갯수</th>
		<th width="100">합 계</th><th width="100">수정/삭제</th></tr>
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
		<td><input type="submit" value="수정" name="BTN"/>
			<input type="submit" value="삭제" name="BTN"/></td></tr>
	</form>
	</c:forEach>
</table><br/>
<form action="" method="post">
총 합 : <fmt:formatNumber groupingUsed="true">${totalAmount }</fmt:formatNumber>
<input type="hidden" name="TOTAL"/><input type="submit" value="결제하기"/>
</form>
</c:if>
</body>
</html>













