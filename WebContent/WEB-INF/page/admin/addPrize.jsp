<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<div class="layuimini-container layuimini-page-anim">
    <div class="layuimini-main">
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
            <legend>填写抽奖信息</legend>
        </fieldset>

        <form class="layui-form" action="/lottery/addPrize" method="POST" enctype="multipart/form-data">
            <div class="layui-form-item">
                <label class="layui-form-label">奖品名称</label>
                <div class="layui-input-block">
                    <input type="text" name="prizeName" lay-verify="title" autocomplete="off" placeholder="请输入奖品名称" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">奖品等级</label>
                <div class="layui-input-block">
                    <input type="radio" name="level" value="1" title="一等奖" />
                    <input type="radio" name="level" value="2" title="二等奖" />
                    <input type="radio" name="level" value="3" title="三等奖" />
                    <input type="radio" name="level" value="0" title="不分等级" />
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
                <div class="layui-input-block">
                    <textarea placeholder="请输入内容" class="layui-textarea" name="desc"></textarea>
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-input-block">
                    <input type="submit" class="layui-btn" value="立即提交"/>
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