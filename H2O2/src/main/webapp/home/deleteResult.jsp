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
<c:if test="${ ! empty param.id }">
<script type="text/javascript">
	alert("�������� �ʾҽ��ϴ�. ��ȣ�� ��ġ���� �ʽ��ϴ�.");
	location.href="../read/readImage.html?id="+${param.id};//�������� �ʾ����Ƿ�,���������� ��ȯ
</script>
</c:if>
<c:if test="${ empty param.id }">
<script type="text/javascript">
	alert("�����Ǿ����ϴ�.");
	location.href="../write/writeList.html";//������ �� ������� ��ȯ
</script>
</c:if>
</body>
</html>












