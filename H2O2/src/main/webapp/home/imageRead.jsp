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
<c:if test="${ empty writing }">
존재하지 않는 글입니다.
</c:if>
<c:if test="${ ! empty writing }">
<table border="1" width="100%" align="center">
	<tr><td>글제목</td><td>${writing.title }</td></tr>
	<tr><td>작성자</td><td>${writing.writer_name }</td></tr>
	<tr><td colspan="2"><img alt="" 
		src="${pageContext.request.contextPath}/upload/${writing.image_name }"
			width="350" height="350"></td></tr>
	<tr><td>글내용</td><td>${writing.content }</td></tr>
	<tr><td colspan="2">
		<a href="javascript:goReply()">[답글]</a>
		<a href="javascript:goModify()">[수정]</a>
		<a href="javascript:goDelete()">[삭제]</a>
		<a href="../write/writeList.html">[목록]</a></td></tr>
</table>
</c:if>
<form name="move">
	<input type="hidden" name="id" value="${writing.writing_id }"/>
	<input type="hidden" name="parentid" value="${writing.writing_id }"/>
	<input type="hidden" name="groupid" value="${writing.group_id }"/>
</form>
<script type="text/javascript">
function goReply(){
	document.move.action="../write/writeReplyForm.html";
	document.move.submit();
}
function goModify(){
	document.move.action="../write/modify.html";
	document.move.submit();
}
function goDelete(){
	document.move.action="../write/delete.html";
	document.move.submit();
}
</script>
</body>
</html>













