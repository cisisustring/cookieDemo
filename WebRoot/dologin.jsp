<%@ page language="java" import="java.util.*,java.net.*"
	contentType="text/html; charset=utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>dologin.jsp</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
</head>
<body>
	<h1>获取用户名和密码,储存cookie</h1>
	<hr>
	<%
		request.setCharacterEncoding("utf-8");
		String username = "", password = "";
		username = URLEncoder.encode(request.getParameter("username"),
				"utf-8");
		password = URLEncoder.encode(request.getParameter("password"),
				"utf-8");
		String[] sts = request.getParameterValues("isusecookie");
		if (sts != null && sts.length > 0) {
			//勾选了保存cookie
			Cookie usernamecookie = new Cookie("username", username);
			Cookie passwordcookie = new Cookie("password", password);
			usernamecookie.setMaxAge(864000);//设置cookie保存时间为10天，单位是秒
			passwordcookie.setMaxAge(864000);
			response.addCookie(usernamecookie);
			response.addCookie(passwordcookie);
		} else {//取消cookie
			Cookie[] cookies = request.getCookies();
			if (cookies != null && cookies.length > 0) {
				for (Cookie c : cookies) {
					if (c.getName().equals("username")
							|| c.getName().equals("password")) {
						c.setMaxAge(0);//设置cookie马上过期
						response.addCookie(c);//调整后的cookie一定要重新保存
					}
				}
			}
		}
	%>
	用户名是：<%=URLDecoder.decode(username,"utf-8") %><br> 密码是:<%=URLDecoder.decode(password,"utf-8")%><br>
	request用户名是：<%=request.getParameter("username") %><br> request密码是:<%=request.getParameter("password")%><br>
	
	<a href="users.jsp">点击查看cookie信息</a>
</body>
</html>
