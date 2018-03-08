<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%@ page import="java.text.*"%>
<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日");
	Date tod = new Date();
	String tim = sdf.format(tod);
	out.println(tim);
%>


