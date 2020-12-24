<%@page import="com.lottery.entity.Prize" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="layuimini-container layuimini-page-anim">
    <div class="layuimini-main">
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
            <legend>奖品信息</legend>
        </fieldset>
		<%
			Prize prize = (Prize)request.getAttribute("prize");
			System.out.println("prizeinfo,print:"+prize.getPrizeId());
			session.setAttribute("id", prize.getPrizeId());
		%>
        <form class="layui-form" action="updatePrize" lay-filter="example" method="POST" enctype="multipart/form-data">
            <div class="layui-form-item">
                <label class="layui-form-label">奖品名称</label>
                <div class="layui-input-block">
                    <input type="text" name="prizeName" lay-verify="title" autocomplete="off" value="<%=prize.getPrizeName() %>" class="layui-input" readonly>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">奖品等级</label>
                <div class="layui-input-block">
                    <input type="radio" name="level" value="1" title="一等奖" <%=prize.getLevel()==1?"checked":"" %> />
                    <input type="radio" name="level" value="2" title="二等奖" <%=prize.getLevel()==2?"checked":"" %> />
                    <input type="radio" name="level" value="3" title="三等奖" <%=prize.getLevel()==3?"checked":"" %> />
                    <input type="radio" name="level" value="0" title="不分等级" <%=prize.getLevel()==0?"checked":"" %> />
                </div>
            </div>
               <div class="layui-form-item">
                <label class="layui-form-label" >奖品图片</label>
                <div class="layui-input-block">
                	 <img class="prizeImg" style="height:200px;witdh:200px;" src="/lottery/img/prizes/<%=prize.getImage()%>" />
                	 <input type="file" name="image" />
                </div>
            </div>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">奖品描述</label>
                    <textarea placeholder="请输入内容" class="layui-textarea" name="desc" readonly><%=prize.getDesc() %></textarea>
                <div class="layui-input-block">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" id="button1" onclick="edit()">编辑信息</button>
                    <button class="layui-btn" type="submit" >提交</button>
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
    document.querySelector('#button1').addEventListener('click',function(){
        var button=this;
        button.setAttribute('disabled',true);
    },false);
    function edit() {
    	document.getElementsByName("desc")[0].removeAttribute("readonly");
    	let inputs = document.getElementsByTagName("input");
    	console.log(inputs);
    	for(i = 0;i < inputs.length;i++) {
    		inputs[i].removeAttribute("readonly");
    		inputs[i].removeAttribute("disabled");
    		console.log(i);
    	}
    	
    }
</script>