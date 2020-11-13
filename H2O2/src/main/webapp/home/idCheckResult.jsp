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
<script type="text/javascript">
function idOK(){
	opener.document.registerFrm.id.value = document.frm.USER.value;
	opener.document.registerFrm.IDCHK.value = 'YES';
	self.close();
}
</script>
<h2 align="center">아이디 중복 확인</h2>
<form action="../idcheck/idcheck.html" name="frm">
아이디 : <input type="text" name="USER" value="${ID }"/>
<input type="submit" value="중복 검사"/><br/>
<c:if test="${DUP == 'NO' }">
	${ID }는 사용가능 합니다.
	<input type="button" value="사용" onClick="idOK()"/>
</c:if>
<c:if test="${DUP == 'YES' }">
	${ID }는 이미 사용 중입니다.
	<script type="text/javascript">
		opener.document.registerFrm.id.value = '';
	</script>
</c:if>
</form>
</body>
</html>












