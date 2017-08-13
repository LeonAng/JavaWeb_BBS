<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
String strId = request.getParameter("id");
int id = Integer.parseInt(strId);

Class.forName("com.mysql.jdbc.Driver");
String url = "jdbc:mysql://localhost/bbs?user=root&password=11235&useSSL=false";
Connection conn = DriverManager.getConnection(url);
Statement stmt = conn.createStatement();
ResultSet rs = stmt.executeQuery("select * from article where id = "+id);

%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>BBS文章内容</title>
</head>
<body>
<%
if(rs.next())
{
%>
	<table border="1">
		<tr>
			<td>ID</td>
			<td><%=rs.getInt("id") %></td>
		</tr>
		<tr>
			<td>Title</td>
			<td><%=rs.getString("title") %></td>
		</tr>
		<tr>
			<td>Content</td>
			<td><%=rs.getString("cont") %></td>
		</tr>
	</table>

<a href="Reply.jsp?id=<%=rs.getInt("id") %>&rootid=<%=rs.getInt("rootid") %>">回复</a>

<%	
}
rs.close();
stmt.close();
conn.close();
%>
</body>
</html>