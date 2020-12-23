<%@page import="com.lottery.entity.Prize"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.layui-top-box {
	padding: 40px 20px 20px 20px;
	color: #fff
}

.panel-title {
	margin-top: 0;
	margin-bottom: 0;
	font-size: 14px;
	color: inherit
}

.label {
	display: inline;
	padding: .2em .6em .3em;
	font-size: 75%;
	font-weight: 700;
	line-height: 1;
	color: #fff;
	text-align: center;
	white-space: nowrap;
	vertical-align: baseline;
	border-radius: .25em;
	margin-top: .3em;
}

.layui-red {
	color: red
}

.main_btn>p {
	height: 40px;
}

.prize-card {
	display: block; height : 100%;
	color: #fff;
	background-color: #2f4056;
	cursor: pointer;
	box-shadow: 3px 3px 5px rgba(0, 0, 0, 0.5);
	border-radius: 5px;
	padding: 10px 15px;
	height: 180px;
}

.prize-card:hover {
	transform: scale(1.02);
	transition: 0.5s;
}

a:hover {
	color: #fff;
}

.card-body {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.card-title {
	margin-left: 15px;
}

.prize-level {
	font-size: 20px;
}

.prize-name {
	font-size: 50px;
}

.fa-plus-square-o {
	font-size: 30px;
	color: #fff;
}

.plus-container {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100%;
	width: 100%;
}

.layui-box {
	color: black;
}

.prizeImg {
	height: 100px;
	witdh: 100px;
	border-radius: 50%;
	margin-right: 30px;
	color: transparent;
}
</style>
<div class="layuimini-container layuimini-page-anim">
	<div class="layuimini-main layui-top-box">
		<div class="layui-row layui-col-space10">
			<%
			List<Prize> prizes = (List<Prize>) request.getAttribute("prizes");
			for (Prize prize : prizes) {
				String level = "&nbsp";
				int id = prize.getPrizeId();
				switch (prize.getLevel()) {
				case 1:
					level = "一等奖";
					break;
				case 2:
					level = "二等奖";
					break;
				case 3:
					level = "三等奖";
					break;
				}
			%>
			<div class="layui-col-md4 ">
				<a class="prize-card" layuimini-content-href="/lottery/prizeInfo?id=<%=id%>" data-title="奖品信息">
					<div>
						<div class="card-body">
							<div class="card-title">
								<h5 class="prize-level"><%=level%></h5>
								<h1 class="prize-name"><%=prize.getPrizeName()%></h1>
							</div>
							<div>
								<img class="prizeImg"
									src="/lottery/img/prizes/<%=prize.getImage()%>" />
							</div>
						</div>
						<div class="card-footer">
							<i class="fa fa-commenting"></i> <span><%=prize.getDesc()%></span>
						</div>
					</div>
				</a>
			</div>

			<%
			}
			%>
			<div class="layui-col-md4">
				<a class="prize-card" layuimini-content-href="/lottery/addPrize" data-title="添加奖品">
					<div class="plus-container">
						<div>
							<i class="fa fa-plus-square-o"></i> <span class="notice"
								style="margin: 5px; color: #fff;">点击添加一个奖品</span>
						</div>
					</div>
				</a>
			</div>

		</div>

		<div class="layui-box">
			<div class="layui-row layui-col-space10">
				<div class="layui-col-md12">
					<blockquote class="layui-elem-quote main_btn">
						<p>
							本后台系统基于layui2.5.4以及font-awesome-4.7.0实现。layui开发文档地址：<a
								class="layui-btn layui-btn-xs layui-btn-danger" target="_blank"
								href="http://www.layui.com/doc">layui文档</a>
						</p>
						<p>
							技术交流QQ群（561838086）：<a target="_blank"
								href="https://jq.qq.com/?_wv=1027&k=5JRGVfe"><img border="0"
								src="//pub.idqqimg.com/wpa/images/group.png" alt="layuimini"
								title="layuimini"></a>（加群请备注来源：如gitee、github、官网等）
						</p>
						<p>喜欢此后台模板的可以给我的GitHub和Gitee加个Star支持一下</p>
						<p>
							GitHub地址：
							<iframe
								src="https://ghbtns.com/github-btn.html?user=zhongshaofa&repo=layuimini&type=star&count=true"
								frameborder="0" scrolling="0" width="100px" height="20px"></iframe>
							<iframe
								src="https://ghbtns.com/github-btn.html?user=zhongshaofa&repo=layuimini&type=fork&count=true"
								frameborder="0" scrolling="0" width="100px" height="20px"></iframe>
						</p>
						<p>
							Gitee地址：<a href="https://gitee.com/zhongshaofa/layuimini"
								target="_blank"><img
								src="https://gitee.com/zhongshaofa/layuimini/badge/star.svg?theme=dark"
								alt="star"></a> <a
								href="https://gitee.com/zhongshaofa/layuimini" target="_blank"><img
								src="https://gitee.com/zhongshaofa/layuimini/badge/fork.svg?theme=dark"
								alt="fork"></a>
						</p>
					</blockquote>
				</div>
			</div>
		</div>

		<div class="layui-box">
			<div class="layui-row layui-col-space10">
				<div class="layui-col-md6">
					<table class="layui-table">
						<colgroup>
							<col width="150">
							<col width="200">
							<col>
						</colgroup>
						<thead>
							<tr>
								<th>昵称</th>
								<th>加入时间</th>
								<th>签名</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>贤心</td>
								<td>2016-11-29</td>
								<td>人生就像是一场修行</td>
							</tr>
							<tr>
								<td>许闲心</td>
								<td>2016-11-28</td>
								<td>于千万人之中遇见你所遇见的人，于千万年之中，时间的无涯的荒野里…</td>
							</tr>
							<tr>
								<td>许闲心</td>
								<td>2016-11-28</td>
								<td>于千万人之中遇见你所遇见的人，于千万年之中，时间的无涯的荒野里…</td>
							</tr>
							<tr>
								<td>许闲心</td>
								<td>2016-11-28</td>
								<td>于千万人之中遇见你所遇见的人，于千万年之中，时间的无涯的荒野里…</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="layui-col-md6">
					<ul class="layui-timeline">
						<li class="layui-timeline-item"><i
							class="layui-icon layui-timeline-axis">&#xe63f;</i>
							<div class="layui-timeline-content layui-text">
								<h3 class="layui-timeline-title">8月18日</h3>
								<p>
									layui 2.0 的一切准备工作似乎都已到位。发布之弦，一触即发。 <br>不枉近百个日日夜夜与之为伴。因小而大，因弱而强。
									<br>无论它能走多远，抑或如何支撑？至少我曾倾注全心，无怨无悔 <i class="layui-icon"></i>
								</p>
							</div></li>
						<li class="layui-timeline-item"><i
							class="layui-icon layui-timeline-axis">&#xe63f;</i>
							<div class="layui-timeline-content layui-text">
								<h3 class="layui-timeline-title">8月16日</h3>
								<p>
									杜甫的思想核心是儒家的仁政思想，他有“<em>致君尧舜上，再使风俗淳</em>”的宏伟抱负。个人最爱的名篇有：
								</p>
								<ul>
									<li>《登高》</li>
									<li>《茅屋为秋风所破歌》</li>
								</ul>
							</div></li>
						<li class="layui-timeline-item"><i
							class="layui-icon layui-timeline-axis">&#xe63f;</i>
							<div class="layui-timeline-content layui-text">
								<h3 class="layui-timeline-title">8月15日</h3>
								<p>
									中国人民抗日战争胜利72周年 <br>常常在想，尽管对这个国家有这样那样的抱怨，但我们的确生在了最好的时代 <br>铭记、感恩
									<br>所有为中华民族浴血奋战的英雄将士 <br>永垂不朽
								</p>
							</div></li>
						<li class="layui-timeline-item"><i
							class="layui-icon layui-timeline-axis">&#xe63f;</i>
							<div class="layui-timeline-content layui-text">
								<div class="layui-timeline-title">过去</div>
							</div></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>