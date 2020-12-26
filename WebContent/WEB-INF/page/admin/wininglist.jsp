<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.lottery.entity.Wining" %>
<%@page import="com.lottery.entity.Player" %>
<%@page import="java.util.List" %>    
<div class="layuimini-container layuimini-page-anim">
    <div class="layuimini-main">
		<table class="layui-table">
		<%
			List<Wining> wins =(List<Wining>) request.getAttribute("wins");	
			List<Player> players = (List<Player>) request.getAttribute("players");
			int index = 1;
		%>
		<div style="display:flex;justify-content:flex-end;margin:10px;">
			<button class="layui-btn layui-bg-red" >清空</button>
		</div>

		  <thead>
		    <tr>
		      <th width="5%">序号</th>
		      <th width="10%">参与人数</th>
		      <th width="10%">中奖人数</th>
		      <th width="20%">一等奖</th>
		      <th width="20%">二等奖</th>
		      <th width="20%">三等奖</th>
		      <th>操作</th>
		    </tr> 
		  </thead>
		  <tbody>
		  <%
		  	for(Wining win:wins) {
		  		int sum = win.getSumMembers();
		  		String[] winMemId = win.getWiningMembers().split(",");
		  		String[] winingLevels = win.getWiningLevels().split(",");
		  		int level1 = Integer.parseInt(winingLevels[0])-1;
		  		int level2 = Integer.parseInt(winingLevels[1])+level1;
		  		String winner1 = "";
		  		String winner2 = "";
		  		String winner3 = "";
		  		String winingCount = winingLevels[3];
		  		for(int i = 0;i<winMemId.length;i++) {
		  			for(Player player:players) {
		  				if(player.getId() == Integer.parseInt(winMemId[i])) {
		  					if(i<=level1) winner1 = winner1 + player.getName();
		  					else if(i>level1&&i<=level2) winner2 = winner2 + player.getName();
		  					else winner3 = winner3 + player.getName();
		  				}
		  			}
		  		}
		  %>
		 	 <tr>
			      <td><%=index %></td>
			      <td><%=sum %></td>
			      <td><%=winingCount %></td>
			      <td><%=winner1 %></td>
			      <td><%=winner2 %></td>
			      <td><%=winner3 %></td>
			      <td>
			      	<button class="layui-btn layui-bgn-blue">查看详情</button>
			      </td>
		   	 </tr>
		  <%
		  	index++;
		  	}
		  %>
		    
		  </tbody>
		</table>
    </div>
</div>