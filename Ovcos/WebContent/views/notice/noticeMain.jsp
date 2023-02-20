<%@page import="com.ovcos.notice.model.vo.Notice"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/noticeMain.css?문자열">
</head>
<body>

	
	<%@ include file="../common/nav.jsp" %>

    	<div class="wrap">
        <div id="title">
            <h1>공지사항</h1>
        </div>
        <div id="content">
			<br><br><br>
			<% if(loginUser != null &&loginUser.getMemId().equals("admin")) {%>
				<div align="right" style="width: 90%; margin:auto;">
					<a href="<%= contextPath %>/enrollForm.no" class = "btn btn-sm btn-secondary">글작성</a>
					<br><br>
				</div>
			<%} %>            
				<table border="0px">
					<thead>
						<tr id="tr1">
							<th width="40">번호</th>
							<th  width="500">제목</th>
							<th width="70">작성자</th>
							<th width="50">조회수</th>
							<th width="100">작성일</th>
						</tr>
					</thead>
					
					<tbody>
						<% if(list.isEmpty()) { %>
							<tr>
								<td colspan="5" align="center">존재하는 공지사항이 없습니다</td>
							</tr>
						<% }else{ %>
							<% for(Notice n : list) {%>
								<tr>
									<td><%= n.getNtcNo()%></td>
									<td><%= n.getNtcTitle()%></td>
									<td width="100"><%= n.getNtcWriter()%></td>
									<td><%= n.getNtcCount() %></td>
									<td><%= n.getNtcDate()%></td>
								</tr>
							<% } %>    
						<% } %>
					</tbody>
				</table>
        </div>

        <div id="footer">

        </div>
	</div>
	

	<script>
	       $(function(){
	          $("table>tbody>tr").click(function(){   
	            const num = $(this).children().eq(0).text()    //==n.getNoticeNo().text()
	       		location.href = '<%=contextPath%>/detail.no?num='+num;
	       		
	          })
	       })
	</script>

</body>
</html>