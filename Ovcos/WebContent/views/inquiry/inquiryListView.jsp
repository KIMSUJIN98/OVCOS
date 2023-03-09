<%@page import="com.ovcos.common.model.vo.Pageinfo"%>
<%@page import="com.ovcos.inquiry.model.vo.Inquiry"%>
<%@ include file="../common/nav.jsp" %>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Inquiry> list = (ArrayList<Inquiry>)request.getAttribute("list");

%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="../../resources/css/inquiryListStyle.css?abc">
      <link rel="stylesheet" href="resources/css/inquiryListStyle.css?abc">
      
<style>
   
   /* #enroll-form table {border: 1px solid white;} */
   #enroll-form input, #enroll-form textarea{
      width: 100%;
      box-sizing: border-box;
   }
</style>
</head>
<body>
<div id="wrap">
   <div class="outer">
      <br>
      <h2 align="center">내 문의내역</h2>
      <br>
      	<div align="right" style="width:860px;">
      		<a href="<%=contextPath %>/enrollForm.bo" class="btn btn-sm btn-secondary">글작성</a>
			<br><br>
			</div>
	
			<table class="list-area">
				<thead>
					<tr>
						<th>문의번호</th>
						<th>분류</th>
	                    <th>문의제목</th>
	                    <th>문의작성일</th>
	                    <th>문의작성자</th>
					</tr>
      <% for (Inquiry i : list) { %>
      	<%if(loginUser != null && loginUser.getMemId().equals(i.getMemId())){ %>
			<%} %>

					</thead>
					<tbody>
					<%} %>
						<% if(list.isEmpty()){ %>
						<tr>
							<td colspan="6">조회된 문의사항이 없습니다.</td>
						</tr>
						<%}else{ %>
						<%for(Inquiry i : list){ %>
						<tr>
							<td><%=i.getInqNo() %></td>
							<td><%=i.getInqMenu() %></td>
							<td><%=i.getInqTitle() %></td>
							<td><%=i.getInqDate() %></td>
							<td><%=i.getMemId()%></td>
						</tr>
						<%} %>
						<%} %>
					</tbody>
				</table>
				
				</div>
</div>
				<script>
				$(function(){
	        		$("table>tbody>tr").click(function(){
	        			const num = $(this).children().eq(0).text();
	        			location.href='<%=contextPath%>/detail.bo?num=' + num;
	        		})
	        	})
				</script>
						
</body>
</html>