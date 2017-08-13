<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<%@ page import="java.sql.*"%>

<%
request.setCharacterEncoding("gbk");

int id = Integer.parseInt(request.getParameter("id"));
int rootId = Integer.parseInt(request.getParameter("rootid"));
String title = request.getParameter("title");
title=title.trim();
if(title==null)
{
	out.println("please use my bbs in the right way!");
	return;
}
if(title.equals(""))
{
	out.println("标题不能为空！");
	return;
}

String cont = request.getParameter("cont");
cont=cont.trim();
if(cont.equals(""))
{
	out.println("内容不能为空！");
	return;
}
	
	
cont=cont.replaceAll("\n", "<br>");

Class.forName("com.mysql.jdbc.Driver");
String url = "jdbc:mysql://localhost/bbs?user=root&password=11235&useSSL=false";
Connection conn = DriverManager.getConnection(url);

conn.setAutoCommit(false);

String sql = "insert into article values (null,?,?,?,?,now(),0)";
PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setInt(1, id);
pstmt.setInt(2,rootId);
pstmt.setString(3,title);
pstmt.setString(4,cont);
pstmt.executeUpdate();

Statement stmt = conn.createStatement();
stmt.executeUpdate("update article set isleaf = 1 where id = "+id);

conn.commit();
conn.setAutoCommit(true);

stmt.close();
pstmt.close();
conn.close();

response.sendRedirect("ShowArticleTree.jsp");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>Insert title here</title>
</head>
<body>
<font color="red" size="9">OK!</font>
</body>
</html>