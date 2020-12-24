<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.lottery.entity.Player" %>
<%@page import="java.util.List" %>
<style>
	.avatar {
		height: 100px;
		width: 100px;
		border-radius: 50%;
		cursor: pointer;
	}
	.avatar:hover {
		transform: scale(1.02);
		transition: 0.5s;
	}
	.usr-card {
		display:flex;
		flex-direction: column;
		align-items: center;
	}
</style>
<div class="layuimini-container layuimini-page-anim">
    <div class="layuimini-main">
    	<div class="layui-row layui-col-space10">
    	<%
    		List<Player> players = (List<Player>) request.getAttribute("players");
    		for(Player player: players){
   		%>
   		<div class="layui-col-md2 usr-card">
   			<img src="/lottery/img/user.jpg" class="avatar" />
   			<h2><%=player.getName() %></h2>
    	</div>	 
   		<%	 			
    		}
    	%>
   
		</div>
    </div>
</div>

<script>
    layui.use(['form', 'table','miniPage','element'], function () {
        var $ = layui.jquery,
            form = layui.form,
            table = layui.table,
            miniPage = layui.miniPage;
    });
</script>