<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.lottery.entity.Player" %>
<%@page import="java.util.List" %>
<style>
	body {
		position: relative;
	}
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
	.btn-box {
		display:flex;
		margin:20px 30px;
		justify-content:space-between;
	}
	.qr-code {
		position: absolute;
		display:block;
		top: 50%;
		left: 50%;
		transform: translate(-50%,-50%);
		height: 200px;
		width: 200px;
	}
</style>
<body>
<%List<Player> players = (List<Player>) request.getAttribute("players"); %>
<div class="layuimini-container layuimini-page-anim" template id="F_ID">
    <div class="layuimini-main">
    	<div class="btn-box">
    		<div>
    			<h2>已<%=players.size() %>有人参与抽奖</h2>
    		</div>
    		<div>
    			<button  class="layui-btn showQr">二维码</button>
    			<button  class="layui-btn" onclick="myrefresh()">刷新</button>
    			<button  class="layui-btn" onclick="resetdb()">清空</button>
    		</div>
    	</div>
    	<div class="layui-row layui-col-space10">
    	<%
    		for(Player player: players){
   		%>
   		<div class="layui-col-md2 usr-card">
   			<img src="/lottery/img/user.jpg" class="avatar" />
   			<h3>No.<%=player.getId() %></h3>
   			<h2><%=player.getName() %></h2>
    	</div>	 
   		<%	 			
    		}
    	%>
		</div>
    </div>
</div>
</body>
<script type="text/javascript" src="/lottery/layui/lib/jquery-3.4.1/jquery-3.4.1.min.js"></script>
<script>
    layui.use(['form', 'table','miniPage','element'], function () {
        var $ = layui.jquery,
            form = layui.form,
            table = layui.table,
            miniPage = layui.miniPage;
    });
    $(function(){
    	  $('.showQr').on('click',function(){
    	      var img = '<img src="/lottery/img/qrcode.png" style="width:500px;height:500px;">'
    	      layer.open({
    	        type: 1,//Page层类型
    	        area: ['520px', '565px'],
    	        title: '扫码参与抽奖',
    	        shade: 0.6 ,//遮罩透明度
    	        maxmin: true ,//允许全屏最小化
    	        anim: 4 ,//0-6的动画形式，-1不开启
    	        content: img
    	      }); 
    	  });
    	  
    	});
	function resetdb() {
		var r  = confirm("确定要清空吗");
		if(r == true) {
			window.location.href="/lottery/resetPlayer"	
		}
	}
    function myrefresh(){
    	location.reload();
    }
</script>