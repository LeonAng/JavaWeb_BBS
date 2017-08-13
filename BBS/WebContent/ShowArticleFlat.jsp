<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<%@ page import="java.sql.*"%>

<%
int pageSize = 5;

String strPageNo = request.getParameter("pageNo");
int pageNo;
if(strPageNo==null || strPageNo.equals(""))
{
	pageNo=1;
}
else
{
	try
	{
		pageNo=Integer.parseInt(strPageNo.trim());
	}
	catch(NumberFormatException e)
	{
		pageNo=1;
	}
	if(pageNo<=0)
	{
		pageNo = 1;
	}
}


Class.forName("com.mysql.jdbc.Driver");
String url = "jdbc:mysql://localhost/bbs?user=root&password=11235&useSSL=false";
Connection conn = DriverManager.getConnection(url);

Statement stmtCount = conn.createStatement();
ResultSet rsCount = stmtCount.executeQuery("select count(*) from article where pid = 0");
rsCount.next();
int totalRecords = rsCount.getInt(1);
int totalPages = totalRecords % pageSize ==0 ? totalRecords/pageSize : totalRecords/pageSize+1;
if(pageNo>totalPages)
{
	pageNo = totalPages;
}
int startPos = (pageNo-1)*pageSize;


Statement stmt = conn.createStatement();
ResultSet rs = stmt.executeQuery("select * from article where pid = 0 order by pdate desc limit "+startPos+","+pageSize);


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv ="Content-Type" content="text/html; charset=GBK">
<title>BBS帖子列表</title>
</head>
<body>
<a href="Post.jsp">发表新帖</a>
<table border=1>
<%

while(rs.next())
{
%>	
	
	<tr>
		<td>
			<%=rs.getString("title") %>
		</td>
	</tr>

<%	
}
rs.close();
rsCount.close();
stmt.close();
stmtCount.close();
conn.close();
%>
</table>
共<%=totalPages %>页 &nbsp;&nbsp;第<%=pageNo %>页
<br/>
<a href="ShowArticleFlat.jsp?pageNo=<%= pageNo-1%>">上一页</a>&nbsp;

<form name="form1" action="ShowArticleFlat.jsp" style="margin:0px;display:inline;">
	<select name ="pageNo" onchange="document.form1.submit()">
		<%
			for(int i = 1;i<=totalPages;i++)
			{
		%>
			<option value=<%=i %> <%=(pageNo==i) ? "selected" : "" %>>第<%=i %>页
		<%
			}
		%>
	</select>	
</form>
&nbsp;
<a href="ShowArticleFlat.jsp?pageNo=<%= pageNo+1%>">下一页</a>

<form name="form2" action="ShowArticleFlat.jsp">
	<input type=text size=4 name="pageNo" value="<%=pageNo%>" />
	<input type="submit" value="go"/>
</form>
</body>
</html>