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
<script type="text/javascript">
function validate(frm){
	if(frm.title.value == '') {alert("������ �Է��ϼ���."); return false;}
	if(frm.name.value == ''){alert("�г����� �Է��ϼ���."); return false;}
	if(frm.password.value==''){alert("��ȣ�� �Է��ϼ���."); return false;}
	if(frm.content.value==''){alert("������ �Է��ϼ���."); return false;}
	var r = confirm("������ �����Ͻðڽ��ϱ�?");
	if(r == false) return false;
}
</script>
<form:form action="../write/updateDo.html" method="post" 
	enctype="multipart/form-data" modelAttribute="writing"
	onSubmit="return validate(this)">
<form:hidden path="writing_id" value="${writing.writing_id }"/>
<table width="100%" border="1" align="center">
<tr><td>������</td><td><form:input path="title" size="20"
	value="${writing.title }"/></td></tr>
<tr><td>�г���</td><td><form:input path="writer_name" size="20"
	value="${writing.writer_name }"/></td></tr>
<tr><td>�̸���</td><td><form:input path="email" size="30"
	value="${writing.email }"/></td></tr>
<tr><td>�� ȣ</td><td><form:password path="password" size="20"/></td></tr>
<tr><td>�̹���</td><td><input type="file" name="image"/><br/>
	<img alt="" 
	src="${pageContext.request.contextPath}/upload/${writing.image_name }" width="350" height="350"
			border="0"></td></tr>
<tr><td>�۳���</td><td>
	<form:textarea rows="8" cols="40" path="content"
		value="${writing.content}"></form:textarea>
	</td></tr>
<tr><td colspan="2"><input type="submit" value="����"/>
	<input type="button" value="���" onClick="javascript:history.go(-1)"/>
	</td></tr>
</table>
</form:form>
</body>
</html>













