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
<style>
        .outer{
        background-color: black;
        color: white;
        width: 1000px;
        height: 500px;
        margin: auto;
        margin-top: 50px;
    }
</style>

</head>
<body>

	<%@ include file="../common/nav.jsp" %>

    <div class="outer" align="center">
        <br>
        <h2 align="center">공지사항 상세보기</h2>
        <br>

    <table id="detail-area" border="1">
        <!-- (tr>th+td+th+td)*3 -->
        <tr>
            <th width="70">제목</th>
            <td colspan="3" width="430"><%=n.getNtcTitle() %></td>
            
        </tr>
        <tr>
            <th>작성자</th>
            <td><%= n.getNtcWriter()%></td>
            <th>작성일</th>
            <td><%=n.getNtcDate() %></td>
        </tr>
        <tr>
            <th>내용</th>
            <td colspan="3">
                <p style="height: 150px;"><%=n.getNtcCnt() %></p>
            </td>
            
        </tr>




    </table>
    <br><br>
    <div>
        <a href="<%=contextPath %>/list.no" class="btn btn-sm btn-secondary">목록가기</a>
        <!-- 히스토리백 -->
        <!-- 현재 로그인한 사용자가 해당 글을 쓴 본인일 경우  -->
        <%if(loginUser!=null && n.getNtcWriter().equals(loginUser.getMemId()) ){%>
            <a href="<%= contextPath %>/updateForm.no?num=<%= n.getNtcNo() %>" class="btn btn-sm btn-warning">수정하기</a>
            <a href="<%= contextPath %>/deleteForm.no?num=<%= n.getNtcNo() %>" class="btn btn-sm btn-danger">삭제하기</a>
            <%} %>
    </div>

    </div>


</body>
</html>