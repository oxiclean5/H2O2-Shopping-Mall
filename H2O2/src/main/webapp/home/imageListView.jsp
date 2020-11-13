<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<c:if test="${empty LIST }">
��ϵ� �Խñ��� �������� �ʽ��ϴ�.
</c:if>
<c:if test="${ ! empty LIST }">
<table width="100%">
	<tr><td align="right"><b>${startRow }~${endRow }/${count }</b></td></tr>
</table>
<table width="100%" border="1">
	<tr><td>�̹���</td><td>������</td><td>�ۼ���</td><td>�ۼ���</td></tr>
	<c:forEach var="writing" items="${LIST }">
	<tr><td><img alt="" src="${pageContext.request.contextPath }/upload/${writing.image_name }" width="50"
				height="50"/></td>
		<td><a href="javascript:goView(${writing.writing_id })">${writing.title }</a></td>
		<td>${writing.writer_name }</td><td>${writing.register_date }</td></tr>
	</c:forEach>
</table>
<c:set var="startPage"
value="${currentPage-(currentPage%10 == 0 ? 10:(currentPage%10)) +1 }"/>
<c:set var="endPage" value="${startPage + 9 }"/>
<c:if test="${endPage > pageCount }">
	<c:set var="endPage" value="${pageCount }"/>
</c:if>
<c:if test="${startPage > 10 }">
	<a href="javascript:goPage(${startPage -1 })">[����]</a>
</c:if>
<c:forEach var="pageNo" begin="${startPage }" end="${endPage }">
	<c:if test="${currentPage == pageNo }"><font size="5"></c:if>
	<a href="javascript:goPage(${pageNo })">${pageNo }</a>
	<c:if test="${currentPage == pageNo }"></font></c:if>
</c:forEach>
<c:if test="${endPage < pageCount }">
	<a href="javascript:goPage(${endPage + 1 })">[����]</a>
</c:if>
</c:if>
<script type="text/javascript">
function goPage(page){
	document.move.action = "../write/writeList.html";
	document.move.PAGE_NUM.value = page;
	document.move.submit();
}
function goView(no){
	document.move.id.value = no;
	document.move.action = "../read/readImage.html";
	document.move.submit();
}
</script>
<form name="move" method="post">
	<input type="hidden" name="id"/>
	<input type="hidden" name="PAGE_NUM" value="${currentPage }"/>
</form>
</body>
</html>












