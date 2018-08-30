<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<%@ include file="common.jsp"%>
<script type="text/javascript">
	function mainIframeChange(url) {
		$('#mainIframe').attr({src : url
		});
	}
</script>
<style>
</style>
<body>
	<ul class="nav nav-tabs">
		<li class="active" data-toggle="tab"><a class="dropdown-toggle" data-toggle="dropdown" href="#">流程部署 <span class="caret"></span>
		</a>
			<ul class="dropdown-menu">
				<li data-toggle="tab"><a href="#" onclick="mainIframeChange('model.action')">模型工作区部署</a></li>
				<!-- <li data-toggle="tab"><a href="#" onclick="mainIframeChange('depoly.action')">服务器路径部署</a></li>
				<li data-toggle="tab"><a href="#" onclick="mainIframeChange('process.action')">流程定义&部署管理</a></li> -->
				<!-- <li class="divider"></li> -->
			</ul></li>
		<!-- <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"> 启动流程 <span class="caret"></span>
		</a>
			<ul class="dropdown-menu">
				<li data-toggle="tab"><a href="#" onclick="mainIframeChange('startProcess.action')">启动流程（key）</a></li>
				<li data-toggle="tab"><a href="#" onclick="mainIframeChange('startProcessByMessage.action')">启动流程（message）</a></li>
				<li data-toggle="tab"><a href="#" onclick="mainIframeChange('process.action')">备用</a></li>
				<li data-toggle="tab"><a href="#" onclick="mainIframeChange('startProcessBySingal.action')">启动流程（Singal）</a></li>
				<li class="divider"></li>
				<li data-toggle="tab"><a href="#" onclick="mainIframeChange('startProcessByDuoShiLi.action')">多实例流程启动</a></li>
			</ul></li> -->
		<!-- <li data-toggle="tab"><a href="#" onclick="mainIframeChange('depoly.action')">部署流程</a></li> 
   <li data-toggle="tab"><a href="#" onclick="mainIframeChange('startProcess.action')">启动流程</a></li>   -->
		<!-- <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"> 任务列表 <span class="caret"></span>
		</a>
			<ul class="dropdown-menu">
				<li data-toggle="tab"><a href="#" onclick="mainIframeChange('task.action?1')">可签收任务</a></li>
				<li data-toggle="tab"><a href="#" onclick="mainIframeChange('task.action?2')">待办理任务(自定义condition)</a></li>
				<li data-toggle="tab"><a href="#" onclick="mainIframeChange('task.action?3')">待办理任务(通过agree、退回refuse)</a></li>
				<li data-toggle="tab"><a href="#" onclick="mainIframeChange('messageEvent.action')">发送消息事件(激活节点消息等待)</a></li>
				<li data-toggle="tab"><a href="#" onclick="mainIframeChange('signEvent.action')">发送信号事件(激活节点信号等待)</a></li>
				<li class="divider"></li>
				<li data-toggle="tab"><a href="#">备用</a></li>
			</ul></li> -->
		<!-- <li  data-toggle="tab"><a href="#" onclick="mainIframeChange('history.action')">历史查询</a></li> -->
		<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"> 历史查询 <span class="caret"></span>
		</a>
			<ul class="dropdown-menu">
				<li data-toggle="tab"><a href="#" onclick="mainIframeChange('historyFinished.action')">查询历史记录（已完成）</a></li>
				<li data-toggle="tab"><a href="#" onclick="mainIframeChange('history.action')">查询历史记录（全部）</a></li>
				<!-- <li data-toggle="tab"><a href="#" onclick="mainIframeChange('historySelfFinished.action')">查询历史记录（已完成-当前登录人）</a></li>
				<li data-toggle="tab"><a href="#" onclick="mainIframeChange('historySelf.action')">查询历史记录（全部-当前登录人）</a></li> -->
			</ul></li>
		<!-- <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"> 日程管理 <span class="caret"></span>
		</a>
			<ul class="dropdown-menu">
				<li data-toggle="tab"><a href="#" onclick="mainIframeChange('historyFinished.action')">我提交的日程</a></li>
				<li data-toggle="tab"><a href="#" onclick="mainIframeChange('history.action')">我负责的日程</a></li>
				<li data-toggle="tab"><a href="#" onclick="mainIframeChange('group.action')">我参与的日程</a></li>

				<li data-toggle="tab"><a href="#" onclick="mainIframeChange('demo.action')">任务列表（全部）</a></li>

				<li class="divider"></li>
				<li data-toggle="tab"><a href="#" onclick="mainIframeChange('timingTasks.action')">定时任务</a></li>
			</ul></li> -->
		<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"> 管理 <span class="caret"></span>
		</a>
			<ul class="dropdown-menu">
				<!-- <li data-toggle="tab"><a href="#" onclick="mainIframeChange('user.action')">用户</a></li>
				<li data-toggle="tab"><a href="#" onclick="mainIframeChange('group.action')">组</a></li> -->
				<li data-toggle="tab"><a href="#" onclick="mainIframeChange('factorType.action')">流程因素类型配置</a></li>
				<li data-toggle="tab"><a href="#" onclick="mainIframeChange('factor.action')">流程因素配置</a></li>
				<li data-toggle="tab"><a href="#" onclick="mainIframeChange('demo.action')">运行中流程</a></li>
				<li data-toggle="tab"><a href="#" onclick="mainIframeChange('terminate.action')">终止流程</a></li>
				<li data-toggle="tab"><a href="#" onclick="mainIframeChange('systemInfo.action')">引擎属性</a></li>
			</ul></li>
		<%-- <div style="float: right; color: rgb(51, 122, 183); font-size: 12px; margin-top: 2px; margin-right: 10px">
			<div>
				<label for="username">欢迎：</label> <span title="角色：{管理,用户}"><%=session.getAttribute("username")%></span>
			</div>
			<div style="text-align: right;">
				<a href="/module-bpm/logout.action" id="loginOut">安全退出</a>
			</div>
		</div> --%>
	</ul>
</body>
</html>
