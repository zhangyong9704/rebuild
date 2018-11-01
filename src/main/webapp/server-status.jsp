<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.rebuild.utils.AppUtils"%>
<%@ page import="com.rebuild.server.helper.SystemConfigurer"%>
<%@ page import="org.apache.commons.lang.SystemUtils"%>
<%@ page import="cn.devezhao.commons.CalendarUtils"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="com.rebuild.server.ServerListener"%>
<%@ page import="com.rebuild.server.Application"%>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="com.rebuild.server.ServerStatus"%>
<%@ page import="java.util.Map"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" type="text/css" href="<%=ServerListener.getContextPath()%>/assets/css/rb-base.css">
<title>服务状态</title>
<style type="text/css">
.block{margin:0 auto;max-width:1000px;margin-bottom:32px;padding:0 14px}
</style>
</head>
<body>
<div class="block">
	<h5 class="text-bold">快速检查</h5>
	<table class="table table-bordered table-sm">
	<tbody>
		<% for (Map.Entry<String, String> e : ServerStatus.getLastStatus().entrySet()) { %>
		<tr>
			<th><%=e.getKey()%></th>
			<td><%=e.getValue() == StringUtils.EMPTY ? "OK" : e.getValue()%></td>
		</tr>
		<% }%>
		<tr>
			<th width="30%">Memory Usage</th>
			<td>n/a</td>
		</tr>
		<tr>
			<th>CPU Usage</th>
			<td>n/a</td>
		</tr>
	</tbody>
	</table>
</div>
<% if (AppUtils.getRequestUser(request) != null) { %>
<div class="block">
	<h5 class="text-bold">系统信息</h5>
	<table class="table table-bordered table-sm">
	<tbody>
		<tr>
			<th width="30%">Application Version</th>
			<td><a href="https://github.com/getrebuild/rebuild/releases"><%=Application.VER%></a></td>
		</tr>
		<tr>
			<th>Startup Time</th>
			<td><%=ServerListener.getStartupTime()%></td>
		</tr>
		<tr>
			<th>System Time</th>
			<td><%=CalendarUtils.now()%></td>
		</tr>
		<tr>
			<th>OS</th>
			<td><%=SystemUtils.OS_NAME%> (<%=SystemUtils.OS_ARCH%>)</td>
		</tr>
		<tr>
			<th>JVM</th>
			<td><%=SystemUtils.JAVA_VERSION%> (<%=SystemUtils.JAVA_VENDOR%>)</td>
		</tr>
		<tr>
			<th>Catalina Base</th>
			<td><%=System.getProperty("catalina.base")%></td>
		</tr>
		<tr>
			<th>Temp Directory</th>
			<td><%=SystemConfigurer.getFileOfTemp("/")%></td>
		</tr>
	</tbody>
	</table>
</div>
<% } %>
<div class="block">
<div class="text-muted">&copy; 2018 <a href="https://getrebuild.com/">Rebuild</a></div>
</div>
</body>
</html>