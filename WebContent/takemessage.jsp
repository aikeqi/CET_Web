<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*" pageEncoding="UTF-8"%>
<jsp:useBean id="connDbBean" class="dataconn.dataconn" />
<%
	request.setCharacterEncoding("utf-8");
	String answer = request.getParameter("answer");
	out.println(answer);
	String username = "";
	String sql1 = "SELECT * FROM user WHERE name = '" + username + "'";
	ResultSet rs1 = connDbBean.executeQuery(sql1);
	String answers = rs1.getString("answers");
	answers = answers + answer;
	String sql2 = "INSERT INTO user WHERE answers = '"+answers+"'";
	int result = connDbBean.executeUpdate(sql2);
	if(result != 0){
		String sql3 = "SELECT * FROM paper";
		ResultSet rs2  = connDbBean.executeQuery(sql3);
		while(rs2.next()){
			rs2.getString("stagetwo");
		}
	}
%>