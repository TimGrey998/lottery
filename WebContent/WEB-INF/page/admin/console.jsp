<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.layui-input {
	width: 50px;
}
.flex-box {
	display: flex;
}
.footer {
	display: flex;
	justify-content:center;
}
.grey {
	background-color:rgb(228,228,228);
}
</style>
	<div class="layuimini-container layuimini-page-anim">
		<div class="layuimini-main">
			<fieldset class="layui-elem-field layui-field-title"
				style="margin-top: 50px;">
				<legend> 控制台</legend>
			</fieldset>
			<div style="margin:15px">
				<button class="layui-btn layui-bg-red" onclick="window.location.href='/lottery/resetEveryThing';">重置抽奖系统</button>
			</div>
			<form class="layui-form" action="goConsole" method="POST">
           			<div class="layui-form-item">
	                <label class="layui-form-label">奖品分级</label>
	                <div class="layui-input-block" onclick="level()">
	                  <input type="checkbox" name="level"  lay-skin="switch" lay-text="ON|OFF" >
	                </div>
            	</div>
				<div class="flex-box">
					<div class="layui-form-item">
	                <label class="layui-form-label">一等奖人数</label>
	                <div class="layui-input-block">
	                    <input  type="text" name="level1" lay-verify="title" autocomplete="off" class="layui-input btns grey" disabled>
	                </div>
           		</div>
           						<div class="layui-form-item">
	                <label class="layui-form-label">二等奖人数</label>
	                <div class="layui-input-block">
	                    <input type="text" name="level2" lay-verify="title" autocomplete="off" class="layui-input btns grey" disabled>
	                </div>
           		</div>
           						<div class="layui-form-item">
	                <label class="layui-form-label">三等奖人数</label>
	                <div class="layui-input-block">
	                    <input type="text" name="level3" lay-verify="title" autocomplete="off" class="layui-input btns grey" disabled>
	                </div>
           		</div>
				</div>
           		<div class="flex-box">
           			<div class="layui-form-item">
	                <label class="layui-form-label">开启动画</label>
	                <div class="layui-input-block">
	                  <input type="checkbox" name="yyy" lay-skin="switch" lay-text="ON|OFF" checked>
	                </div>
            	</div>
            	<div class="layui-form-item">
	                <label class="layui-form-label">记录抽奖</label>
	                <div class="layui-input-block">
	                  <input type="checkbox" name="yyy" lay-skin="switch" lay-text="ON|OFF" checked>
	                </div>
            	</div>
            	<div class="layui-form-item">
	                <label class="layui-form-label">结束后清空用户</label>
	                <div class="layui-input-block">
	                  <input type="checkbox" name="yyy" lay-skin="switch" lay-text="ON|OFF" >
	                </div>
            	</div>
           		</div>
           		<div class="footer">
           			<div class="layui-form-item">
	            	<button type="submit" class="layui-btn">提交</button>    
           			</div>
           		</div>
			</form>
		</div>
	</div>

<script>
layui.use(['form', 'layedit', 'laydate'], function () {
    var form = layui.form
        , layer = layui.layer
        , layedit = layui.layedit
        , laydate = layui.laydate;
    form.render();
});
	var index = 0;
function level() {
	let btns = document.getElementsByClassName("btns");
	if(index%2==0) {
		for(let i =0;i <btns.length;i++) {
			btns[i].removeAttribute("disabled");
			btns[i].classList.remove("grey");
		}
	} else {
		for(let i =0;i <btns.length;i++) {
			btns[i].setAttribute("disabled",true);
			btns[i].classList.add("grey");
		}
	}
	index++;
}
</script>
</body>
</html>