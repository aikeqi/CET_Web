<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.sql.*"
	pageEncoding="UTF-8"%>
	<jsp:useBean id="connDbBean" class="dataconn.dataconn" />
<%
	request.setCharacterEncoding("utf-8");
	String answer = request.getParameter("answer");
	out.println(answer);
	String sql = "";
%>