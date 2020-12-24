<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.layui-input {
	width: 50px;
}
.level {
	display: flex;
}
.footer {
	display: flex;
	align-items:center;
}
</style>
	<div class="layuimini-container layuimini-page-anim">
		<div class="layuimini-main">
			<fieldset class="layui-elem-field layui-field-title"
				style="margin-top: 50px;">
				<legend> 控制台</legend>
			</fieldset>
			<form class="layui-form" action="goConsole" method="POST">
				<div class="level">
					<div class="layui-form-item">
	                <label class="layui-form-label">一等奖人数</label>
	                <div class="layui-input-block">
	                    <input type="text" name="level1" lay-verify="title" autocomplete="off" class="layui-input">
	                </div>
           		</div>
           						<div class="layui-form-item">
	                <label class="layui-form-label">二等奖人数</label>
	                <div class="layui-input-block">
	                    <input type="text" name="level2" lay-verify="title" autocomplete="off" class="layui-input">
	                </div>
           		</div>
           						<div class="layui-form-item">
	                <label class="layui-form-label">三等奖人数</label>
	                <div class="layui-input-block">
	                    <input type="text" name="level3" lay-verify="title" autocomplete="off" class="layui-input">
	                </div>
           		</div>
				</div>
           		<div class="layui-form-item">
	                <label class="layui-form-label">开启动画</label>
	                <div class="layui-input-block">
	                  <input type="checkbox" name="yyy" lay-skin="switch" lay-text="ON|OFF" checked>
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
</script>
</body>
</html>