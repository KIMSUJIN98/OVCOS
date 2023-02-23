<%@page import="com.ovcos.notice.model.vo.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    Notice n =(Notice)request.getAttribute("notice"); 
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/noticeDetail.css">
<style>

</style>

</head>
<body>

	<%@ include file="../common/nav.jsp" %>

    <div class="wrap">

        <div class="title">

            <span id="title"><h2>공지사항</h2></span>

        </div>


        <div class="content">
            <table id="detail-area" border="0"  align="center">
            <!-- (tr>th+td+th+td)*3 -->
                <tr id="t_title">
                    <th>제목</th>
                    <td colspan="3" width="430"><%=n.getNtcTitle() %></td>
                    
                </tr>
                <tr id="t_info">
                    <th>작성자</th>
                    <td><%= n.getNtcWriter()%></td>
                    <th>작성일</th>
                    <td><%=n.getNtcDate() %></td>
                </tr>
                <tr id="t_content">
                    
                    <td colspan="4">
                        <p><%=n.getNtcCnt() %></p>
                    </td>
                    
                </tr>
            </table>
        </div>

        <div class="btn_div" align="right">
            <a href="<%=contextPath %>/list.no" class="btn btn-sm btn-light">목록가기</a>
            <!-- 히스토리백 -->
            <!-- 현재 로그인한 사용자가 해당 글을 쓴 본인일 경우  -->
            <%if(loginUser!=null && n.getNtcWriter().equals(loginUser.getMemId()) ){%>
                <a href="<%= contextPath %>/updateForm.no?num=<%= n.getNtcNo() %>" class="btn btn-sm btn-warning">수정하기</a>
                <a href="<%= contextPath %>/deleteForm.no?num=<%= n.getNtcNo() %>" class="btn btn-sm btn-danger">삭제하기</a>
                <%} %>
        </div>
     

        

    </div>
    <div class="footer"></div>

</body>
</html>