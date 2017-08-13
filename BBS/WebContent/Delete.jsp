<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<%@ page import="java.sql.*"%>

<%!
private void del(Connection conn,int pid)
{
	Statement stmt = null;
	ResultSet rs = null;
	
	try
	{
		stmt = conn.createStatement();
		String sql = "select * from article where pid ="+pid;
		rs = stmt.executeQuery(sql);
		while(rs.next())
		{
			del(conn,rs.getInt("id"));
		}
		stmt.executeUpdate("delete from article where id = "+pid);
		
	}
	catch(SQLException e)
	{
		e.printStackTrace();
	}
	finally
	{
		try
		{
			if(rs!=null)
			{
				rs.close();
				rs=null;
			}
			if(stmt!=null)
			{
				stmt.close();
				stmt =null;
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
	}
}
%>

<%
String admin = (String)session.getAttribute("admin");

if(admin==null || !admin.equals("true"))
{
	out.println("不登录别想删除帖子！");
	return;
}
%>

<%
int id = Integer.parseInt(request.getParameter("id"));
int pid = Integer.parseInt(request.getParameter("pid"));

Class.forName("com.mysql.jdbc.Driver");
String url = "jdbc:mysql://localhost/bbs?user=root&password=11235&useSSL=false";
Connection conn = DriverManager.getConnection(url);

conn.setAutoCommit(false);

del(conn,id);
Statement stmt = conn.createStatement();
ResultSet rs = stmt.executeQuery("select count(*) from article where pid = "+pid);
rs.next();
int count = rs.getInt(1);
rs.close();
if(count<=0)
{
	Statement stmtUpdate = conn.createStatement();
	stmtUpdate.executeUpdate("update article set isleaf = 0 where id = "+pid);
	stmtUpdate.close();
}

stmt.close();

conn.commit();
conn.setAutoCommit(true);


conn.close();

response.sendRedirect("ShowArticleTree.jsp");
%>