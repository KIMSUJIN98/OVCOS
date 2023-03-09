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
   
.list-area>tbody>tr:hover{
    	cursor:pointer;
    	
    }
</style>
</head>
<body>
<div id="wrap">
   <div class="outer">
      <br>
      <div class="inner">
      <h2 align="center" id="title">나의 문의내역</h2>
      <br>
      	<div align="right" style="width:800px;" id="enrollBtn">
      		<a href="<%=contextPath %>/enrollForm.bo" class="btn btn-sm btn-secondary">글작성</a>
			<br><br>
			</div>
	
			<table class="list-area" align="center" border="1px solid black">
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
							<th colspan="6" width="650px">조회된 문의사항이 없습니다.</th>
						</tr>
						<%}else{ %>
						<%for(Inquiry i : list){ %>
						<tr>
							<td width="80px;"><%=i.getInqNo() %></td>
							
							<td width="80px;"><%=i.getInqMenu() %></td>
							<td width="250px;"><%=i.getInqTitle() %></td>
							<td width="150px;"><%=i.getInqDate() %></td>
							<td width="100px;"><%=i.getMemId()%></td>
						</tr>
						<%} %>
						<%} %>
					</tbody>
				</table>
				
				</div>
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