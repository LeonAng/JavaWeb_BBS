<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
    
<%
String action = request.getParameter("action");
if (action!=null &&action.equals("login"))
{
	String username = request.getParameter("username");
	String password = request.getParameter("password");

	if(username==null || !username.equals("Leon"))
	{
		//out.println("�û�������,����������  ");
		out.println("<font color=\"white\" size=\"5\">�û�������,����������</font>");
		   
		//return;
	}
	else if(password==null || !password.equals("Leon"))
	{
		//out.println("�������,����������");
		out.println("<font color=\"white\" size=\"5\">�������,����������</font>");
		//return;
	}
	else
	{
		//out.println("Welcome admin!"+username);
		//out.println("<font color=\"white\" size=\"5\">Welcome admin!"+username+"</font>");
		session.setAttribute("admin","true");
		response.sendRedirect("ShowArticleTree.jsp");
	}
}

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=GBK">
    <title>��ӭ����BBS�����̨</title>
    
    <link href="dist/css/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="dist/css/flat-ui.css" rel="stylesheet">
    <link rel="shortcut icon" href="dist/img/favicon.ico">
    <script src="dist/js/vendor/html5shiv.js"></script>
    <script src="dist/js/vendor/respond.min.js"></script>

    <style>
        body
        {
            background-image:url('pictures/login.jpg');
            background-size: cover;
        }
        h5
        {
            font-family: "Lucida Fax";
        }
        a
        {
            font-family: ����;
        }
        p
        {
            font-family: ����;
        }
        button
        {
            margin-left:210px;
            margin-top: 20px;
        }
    </style>

</head>
<body>
    <style>
         body {
            padding-bottom: 20px;
            padding-top: 10px;
            }
         .navbar {
            margin-bottom: 20px;
         }
        u
        {
             font-weight:bold;

        }
    </style>

    <div class="container">
        <nav role="navigation" class="navbar navbar-inverse navbar-embossed">
            <div class="navbar-header">
                <button data-target="#bs-example-navbar-collapse-15" data-toggle="collapse" class="navbar-toggle" type="button">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a href="#" class="navbar-brand">BBS����ƽ̨</a>
            </div>
            <div id="bs-example-navbar-collapse-15" class="collapse navbar-collapse">
                <p class="navbar-text navbar-right">�û�����Leon ���룺Leon</p>
            </div>
        </nav>
    </div>

    <script src="dist/js/vendor/jquery.min.js"></script>
    <script src="dist/js/flat-ui.min.js"></script>
    <script src="assets/js/application.js"></script>

    <br><br>
    <div style="position:absolute;margin-left:90px;margin-top: 20px; font-family: Helvetica;">
        <h3 style="color: white ">Share your story.</h3>
        <h3 style="color: white ">Make up your story.</h3>
        <h3 style="color: white ">Let's ZhuangBi together!</h3>
    </div>
    <div style="margin-left:750px;margin-top:80px;">
        <form action="Login.jsp" method="post">
        	<input type="hidden" name=action value=login>
            <h5><span style="color: white ">username:</span><input type="text" name="username" style="border-radius:300px;" style="color: black;"></h5>
            <h5><span style="color: white ">password:</span><input type="password" type="text" name="password" style="border-radius:300px;"></h5>
            <button type="submit" class="btn btn-primary btn-hg">LOGIN</button>
            <br/>
            <p align="center"><a href="ShowArticleTree.jsp" ><font color="white" size="5" ><u>�����¼ֱ�ӿ�������</u></font></a></p>
            <p align="center"><a href="ShowArticleFlat2.jsp" ><font color="white" size="5" ><u>�����¼ֱ�ӿ�������</u></font></a></p>
        </form>
    </div>

    <h6 style="color: white;margin-left:70px;margin-top:170px; ">design by  Leon</h6>
</body>
</body>
</html>