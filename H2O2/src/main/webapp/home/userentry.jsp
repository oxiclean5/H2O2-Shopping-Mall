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
function formCheck(frm){
	if(frm.IDCHK.value == ''){alert("ID�ߺ��˻縦 ���ּ���."); return false;}
	if(frm.name.value==''){alert("�̸��� �Է��ϼ���."); return false;}
	if(frm.id.value==''){alert("ID�� �Է��ϼ���."); return false;}
	if(frm.password.value==''){alert("��ȣ�� �Է��ϼ���."); return false;	}
	if(frm.password.value != frm.CONFIRM.value){
		alert("��ȣ�� ��ġ���� �ʽ��ϴ�."); return false;
	}
	if(!frm.gender[0].checked && !frm.gender[1].checked){
		alert("������ �����ϻ���."); return false;
	}
	if(frm.job.selectedIndex < 1){alert("������ �����ϼ���."); return false;	}
	if(confirm("�Է��� ������ �½��ϱ�?")){		
	}else{ return false;}
}
function idCheck(){
	//1.ID�� �ԷµǾ����� Ȯ���Ѵ�.
	if(document.registerFrm.id.value==''){
		alert("ID�� �Է��ϼ���.");
		document.registerFrm.id.focus();
		return;//�Լ� ����
	}
	//2.�˾�â�� ����� �ߺ��˻��� ����� �����ش�.
	window.open(
	"../idcheck/idcheck.html?USER="+document.registerFrm.id.value
	,"_blank","width=450,height=300");
}
</script>
<div align="center">
<h2 align="center">�������� �Է�</h2>
<form:form action="../entry/entry.html" method="post" 
	modelAttribute="guest" name="registerFrm"
	onSubmit="return formCheck(this)">
<input type="hidden" name="IDCHK"/>
�̸� : <form:input path="name"/><br/>
���̵� : <form:input path="id"/>
<input type="button" value="�ߺ��˻�" onClick="idCheck()"/><br/>
��ȣ : <form:password path="password"/><br/>
��ȣ Ȯ�� : <input type="password" name="CONFIRM"/><br/>
���� : ��<form:radiobutton path="gender" value="M"/>
��<form:radiobutton path="gender" value="F"/><br/>
�̸��� : <form:input path="email"/><br/>
�ּ� : <form:input path="addr"/><br/>
���� : <form:select path="job">
		<form:option value="--�����ϼ���--"/>
		<form:option value="ȸ���"/><form:option value="�л�"/>
		<form:option value="��Ÿ"/></form:select><br/><br/>
<input type="submit" value="ȸ������" class="btn"/>
<input type="reset" value="�� ��"/>
</form:form>
</div>
</body>
</html>












