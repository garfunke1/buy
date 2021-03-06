<%@page import="com.cn.easybuy.util.Pages"%>
<%@page import="com.cn.easybuy.entity.Product"%>
<%@page import="java.util.List"%>
<%@ page import="com.cn.easybuy.dao.*"%>
<%@ page import="com.cn.easybuy.dao.impl.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台管理 - 易买网</title>
<link type="text/css" rel="stylesheet" href="../css/style.css" />
<script type="text/javascript" src="../scripts/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="../scripts/function.js"></script>
<script type="text/javascript">
	function del() {
		if (!confirm("确认删除?"))
			window.event.returnValue = false;

	}
</script>


</head>
<body>
	<div id="header" class="wrap">
		<div id="logo">
			<img src="../images/logo.png" />
		</div>
		<div class="help">
			<a href="../index.jsp">返回前台页面</a>
		</div>
		<div class="navbar">
			<ul class="clearfix">
				<li><a href="index.jsp">首页</a></li>
				<li><a href="user.jsp">用户</a></li>
				<li class="current"><a href="product.jsp">商品</a></li>
				<li><a href="order.jsp">订单</a></li>
				<li><a href="guestbook.jsp">留言</a></li>
				<li><a href="news.jsp">新闻</a></li>
			</ul>
		</div>
	</div>
	<jsp:include page="date.jsp" />
	<div id="position" class="wrap">
		您现在的位置：<a href="index.jsp">易买网</a> &gt; 管理后台
	</div>
	<div id="main" class="wrap">
		<div id="menu-mng" class="lefter">
			<div class="box">
				<dl>
					<dt>用户管理</dt>
					<dd>
						<a href="user.jsp">用户管理</a>
					</dd>
					<dt>商品信息</dt>
					<dd>
						<em><a href="productClass-add.jsp">新增</a></em><a
							href="productClass.jsp">分类管理</a>
					</dd>
					<dd>
						<em><a href="product-add.jsp">新增</a></em><a href="product.jsp">商品管理</a>
					</dd>
					<dt>订单管理</dt>
					<dd>
						<a href="order.jsp">订单管理</a>
					</dd>
					<dt>留言管理</dt>
					<dd>
						<a href="guestbook.jsp">留言管理</a>
					</dd>
					<dt>新闻管理</dt>
					<dd>
						<em><a href="news-add.jsp">新增</a></em><a href="news.jsp">新闻管理</a>
					</dd>
				</dl>
			</div>
		</div>
		<div class="main">
			<h2>商品管理</h2>
			<div class="manage">
				<table class="list">
					<tr>
						<th>编号</th>
						<th>商品名称</th>
						<th>操作</th>
					</tr>

					<%
						Pages pages=(Pages)session.getAttribute("pages2");
						if(pages==null) {
							response.sendRedirect("page_Product.jsp");
							return ;
						} else {
							int pageIndex = pages.getPageIndex();
							int pageTotal = pages.getPageTotal();
							List<Product> list= (List<Product>) session.getAttribute("list2");
					 		for(Product p : list) {
					%>

					<tr>
						<td class="first w4 c"><%=p.getId()%></td>
						<td class="thumb"><img width="30%" height="30%" src="../<%=p.getFileName()%> " /> 
						<a href="../product-view.jsp?productID=<%=p.getId()%>" target="_self"><%=p.getName()%></a></td>
						<td class="w1 c">
						<a href="product-modify.jsp?id=<%=p.getId()%>">修改</a> 
						<a class="manageDel" onclick='del()' href="deleteProduct?deleid=<%=p.getId()%> ">删除</a>
						</td>
					</tr>
				
					<%
							}
					 	}
					%>
					
				</table>
				[ 当前页: <%=pages.getPageIndex() %> 共 <%=pages.getPageTotal() %> 页 ]
					<%
						if(pages.getPageIndex()>1) {				
					%>
					<a href="page_Product.jsp?pageIndex=1">首页</a>
					<a href="page_Product.jsp?pageIndex=<%=pages.getPageIndex()-1 %> ">上一页</a>
					<%  } 
						if(pages.getPageIndex() < pages.getPageTotal() ) { 
					%>
					<a href="page_Product.jsp?pageIndex=<%=pages.getPageIndex()+1%>">下一页</a>
					<a href="page_Product.jsp?pageIndex=<%=pages.getPageTotal() %>">尾页</a>
					<% } %>
			</div>
		</div>
		<div class="clear"></div>
		  <div class="pager">
			
			
			<!--	<ul class="clearfix">
					<li><a >首页</a></li>
					<li>...</li>
					<li><a >4</a></li>
					<li class="current">5</li>
                    <li><a >6</a></li>
                    <li>...</li>
					<li><a >尾页</a></li>
				</ul>   -->
			</div> 
	</div>
	<div id="footer">Copyright &copy; 2013 北大青鸟 All Rights Reserved.
		京ICP证1000001号</div>
</body>
</html>
