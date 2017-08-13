<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>

<%
int id =  Integer.parseInt(request.getParameter("id"));
int rootId = Integer.parseInt(request.getParameter("rootid"));


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>回复</title>

<script language="javascript">
<!--
	//javascript去空格函数
	function LTrim(str)//去掉字符串的头空格
	{
		var i;
		for(i=0;i<str.length;i++)
		{
			if(str.charAt(i)!=" ")break;	
		}
		str=str.substring(i,str.length);
		return str;
	}
	
	function RTrim(str)
	{
		var i;
		for(i=str.length-1;i>=0;i--)
		{
			if(str.charAt(i)!=" " && str.charAt(i)!=" ")break;
		}
		str = str.substring(0,i+1);
		return str;
	}
	function Trim(str)
	{
		return LTrim(RTrim(str));
	}
	
	function check()
	{
		if(Trim(document.reply.title.value) == "")
		{
			alert("请输入标题!");
			document.reply.title.focus();
			return false;
		}
		if(Trim(document.reply.cont.value) == "")
		{
			alert("请输入内容!");
			document.reply.cont.focus();
			return false;	
		}
		return true;
	}
-->
</script>

</head>
<body>
<form name=reply action="ReplyOK.jsp" method="post" onsubmit="return check()">
	<input type="hidden" name="id" value="<%=id %>">
	<input type="hidden" name="rootid" value="<%=rootId%>">
	<table border="1">
		<tr>
			<td>
				标题：<input type="text" name="title" size="80">
			</td>
		</tr>
		
		<tr>
			<td>
				内容：<textarea cols="80" rows="12" name="cont"></textarea>
			</td>
		</tr>
		
		<tr>
			<td>
				<input type="submit" value="提交">
			</td>
		</tr>
	</table>
</form>
</body>
</html>