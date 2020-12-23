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
			System.out.println(prize.getLevel()==1);
		%>
        <form class="layui-form" action="addPrize" lay-filter="example" method="POST">
            <div class="layui-form-item">
                <label class="layui-form-label">奖品名称</label>
                <div class="layui-input-block">
                    <input type="text" name="prizeName" lay-verify="title" autocomplete="off" value="<%=prize.getPrizeName() %>" class="layui-input" readonly>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">奖品等级</label>
                <div class="layui-input-block">
                    <input type="radio" name="level" value="1" title="一等奖" <%=prize.getLevel()==1?"checked":"disabled" %> />
                    <input type="radio" name="level" value="2" title="二等奖" <%=prize.getLevel()==2?"checked":"disabled" %> />
                    <input type="radio" name="level" value="3" title="三等奖" <%=prize.getLevel()==3?"checked":"disabled" %> />
                    <input type="radio" name="level" value="0" title="不分等级" <%=prize.getLevel()==0?"checked":"disabled" %> />
                </div>
            </div>
            
               <div class="layui-form-item">
                <label class="layui-form-label">奖品图片</label>
                <div class="layui-input-block">
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
                    <button class="layui-btn" type="submit" >立即提交</button>
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