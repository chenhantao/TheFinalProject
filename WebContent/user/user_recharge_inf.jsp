<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
table {
	border-collapse: collapse;
}

td {
	border: 2px solid blue;
}
</style>
</head>
<body>
	<center>
		<h1>留言信息列表</h1>
		<form name="form" >
			<table>
				<tr>
					<td>时间</td>
					<td>金额</td>
				</tr>
				<c:forEach items="${list }" var="user" varStatus="status">
					<tr id="<c:out  value="${user.id}"/>">
						<td><input value="${user.id.time}" readonly="readonly" /></td>
						<td><input name="list[${status.index}].money"
							value="${user.money}" readonly="readonly" /></td>
					</tr>
				</c:forEach>
			</table>
		</form>
		<br>
		<table>
			<tr>
				<td colspan="6" align="center" bgcolor="#5BA8DE">共${page.totalRecords}条记录
					共${page.totalPages}页 当前第${page.pageNo}页<br> <a
					href="<%=request.getContextPath()%>/deposit/show?pageNo=${page.topPageNo}"><input
						type="button" name="fristPage" value="首页" /></a> <c:choose>
						<c:when test="${page.pageNo!=1}">
							<a
								href="<%=request.getContextPath()%>/deposit/show?pageNo=${page.previousPageNo }"><input
								type="button" name="previousPage" value="上一页" /></a>
						</c:when>
						<c:otherwise>
							<input type="button" disabled="disabled" name="previousPage"
								value="上一页" />
						</c:otherwise>
					</c:choose> <c:choose>
						<c:when test="${page.pageNo != page.totalPages}">
							<a
								href="<%=request.getContextPath()%>/deposit/show?pageNo=${page.nextPageNo }"><input
								type="button" name="nextPage" value="下一页" /></a>
						</c:when>
						<c:otherwise>
							<input type="button" disabled="disabled" name="nextPage"
								value="下一页" />
						</c:otherwise>
					</c:choose> <a
					href="<%=request.getContextPath()%>/deposit/show?pageNo=${page.bottomPageNo}"><input
						type="button" name="lastPage" value="尾页" /></a>
				</td>
			</tr>
		</table>
	</center>
	
	
	<center>
		当前余额：<%=request.getAttribute("u_balance") %>
		<form action="/TheFinalProject/deposit/deposit">
			<input type="text" name="depositMoney">
			<input type="submit" value="充值">
		</form>
	</center>
</body>
</html>