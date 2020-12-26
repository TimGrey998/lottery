<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.lottery.dao.BaseDao" %>   
<%@page import="java.sql.ResultSet" %> 
<!DOCTYPE html>
<html>
<%
	int id = Integer.parseInt(request.getParameter("id"));
	String sql = "select * from wining";
	String res = "";
	ResultSet rs = BaseDao.executeQuery(sql);
	if(rs.next()) res = rs.getString("winingIds");
%>
<script>
	window.onload = function() {
		//var res = localStorage.getItem("res");
		var res = "<%=res%>";
		console.log(res.split(",")[1])
		var id = <%=id %>;
		document.write("<h1>参与成功，您的号码为:<%=id %>，请注意开奖信息，开奖后刷新页面查看结果</h1>");
		document.write("<div><button onclick='reload()' style='height:100px;width:200px;font-size:50px;'>刷新</button></div>");
		if(res.length!=0) {
			res = res.split(",");
			document.write("<h1>开奖结果为:"+res);
			for(let i in res) {
				if(res[i] == id) {
					console.log(res[i]);
					document.write("<h1 style='color:red'>恭喜中奖</h1>");
					return
				}
			}
			document.write("<h1>很遗憾您未中奖</h1>");
		}
	}
	function reload() {
	    location.reload();
	}
</script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
	</div>
</body>
</html>