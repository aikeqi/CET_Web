<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<jsp:useBean id="connDbBean" scope="page" class="dataconn.dataconn"/>
<!DOCTYPE html>
<html>
  <head>
    <title>Bootstrap 101 Template</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <!-- Bootstrap -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
	<link href="css/layoutit.css" rel="stylesheet">
	<link href="css/bootstrap-combined.min.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="http://cdn.bootcss.com/html5shiv/3.7.0/html5shiv.min.js"></script>
        <script src="http://cdn.bootcss.com/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="http://cdn.bootcss.com/jquery/1.10.2/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/js/bootstrap.min.js"></script>

<%
	String username = (String)session.getAttribute("username");
	String bookid = (String)session.getAttribute("bookid");
	String[] classes = {"success", "error", "warning", "info"};
	
	int page_persize=4;//每页显示记录数
	int page_total=0;//总的页数
	int page_now=1;//当前页码
	int rs_total=0;//总的记录数
	
	String sql="select  * from book where bookid=" + bookid + ";";
	try {
		ResultSet rs = connDbBean.executeQuery(sql);
		
		rs.last();//指针到最后一条记录
		rs_total=rs.getRow();//读出当前行号即总的记录数
		if (rs_total % page_persize==0)
		    page_total=rs_total/page_persize;
		else
		    page_total=rs_total/page_persize+1;
		
		try{
			if (!(request.getParameter("page_now")==null || request.getParameter("page_now").equals("")))
				page_now=Math.min(Math.abs(Integer.parseInt(request.getParameter("page_now"))),page_total);
			}catch(java.lang.NumberFormatException e){
				out.print("指定页码格式不正确"+e);
			}
		if (page_now==0) page_now=1;
		%>
	    
<div class="container-fluid">
	<div class="row-fluid">
		<div class="span2">
		</div>
		<div class="span6">
			<div class="page-header">
				<h1>
					<%=username %> <small>的生词本</small>
				</h1>
			</div>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>
							编号
						</th>
						<th>
							英语
						</th>
						<th>
							词性
						</th>
						<th>
							释义
						</th>
					</tr>
				</thead>
				<tbody>
				 <%
				 	rs.absolute((page_now-1)*page_persize+1);
					
					//当前页输出
				    rs.previous();
				 	for (int i = 1; i <= page_persize; i++)
				 	{
				 		if (!rs.next()) break;//如果记录数不够则中断循环
				 	%>
				 		<tr class="<%=classes[(i - 1) % 4] %>">
						<td>
							<%=(page_now-1)*page_persize+i %>
						</td>
						<td>
							<%=rs.getString("english") %>
						</td>
						<td>
							<%=rs.getString("englishtype") %>
						</td>
						<td>
							<%=rs.getString("chinese") %>
						</td>
					</tr>
				 	<%
				 	
				 	}
				 %>
					
					
				</tbody>
			</table>
			<div class="pagination">
				<ul>
				<%
					if (page_now != 1)
					{
						out.print("<li><a href=?page_now=1>首页</a></li>"); 
						out.print("<li><a href=?page_now="+(page_now-1)+">上一页</a></li>");
					}
					else
					{
						out.print("<li><a>首页</a></li>"); 
						out.print("<li><a>上一页</a></li>");
					}
					out.print("<li><a>第" + page_now + "页</a></li>");
					if (page_now != page_total)
					{
						out.print("<li><a href=?page_now="+(page_now+1)+">下一页</a></li>");
						out.print("<li><a href=?page_now="+page_total+">尾页</a></li>");
					}
					else
					{
						out.print("<li><a>下一页</a></li>");
						out.print("<li><a>尾页</a></li>");
					}
				%>
				</ul>
			</div>
		</div>
		<div class="span4">
			<div class="row-fluid">
				<div class="span12">
				</div>
			</div>
			<div class="row-fluid">
				<div class="span2">
				</div>
				<div class="span6">
					 <a href="addword.jsp"><input  class="btn btn-block btn-large btn-primary" type="button" value="添加生词 "/></a>
					 
					 <hr />
					 <a href="index.jsp"><input class="btn btn-block btn-large btn-info" type="button" value="返回" /></a>
				</div>
				<div class="span4">
				</div>
			</div>
		</div>
	</div>
</div>
	    <%
		rs.close(); 
	} catch(Exception e) {
		
	} 
	connDbBean.closeStmt();     
	connDbBean.closeConn(); 
%> 
  </body>
</html>