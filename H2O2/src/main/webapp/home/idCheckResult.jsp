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
<h2 align="center">���̵� �ߺ� Ȯ��</h2>
<form action="../idcheck/idcheck.html" name="frm">
���̵� : <input type="text" name="USER" value="${ID }"/>
<input type="submit" value="�ߺ� �˻�"/><br/>
<c:if test="${DUP == 'NO' }">
	${ID }�� ��밡�� �մϴ�.
	<input type="button" value="���" onClick="idOK()"/>
</c:if>
<c:if test="${DUP == 'YES' }">
	${ID }�� �̹� ��� ���Դϴ�.
	<script type="text/javascript">
		opener.document.registerFrm.id.value = '';
	</script>
</c:if>
</form>
</body>
</html>












