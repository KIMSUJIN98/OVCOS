<%@page import="com.ovcos.inquiry.model.vo.Inquiry"%>
<%@ include file="../common/nav.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%Inquiry i = (Inquiry)request.getAttribute("inquiry"); %>
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" href="../../resources/css/inquiryDetailStyle.css?abc">
      <link rel="stylesheet" href="resources/css/inquiryDetailStyle.css?abc">
<meta charset="UTF-8">
<title>Insert title here</title>



</head>
<body>
<div id="wrap">

<div class="outer">
        <br>
        <div class="inner">
        <h2 align="center" id="title">문의사항 상세보기</h2>
        <br>

    <table id="detail-area" border="1">
        <!-- (tr>th+td+th+td)*3 -->
        <tr>
            <th width="70">제목</th>
            <td colspan="5" width="600"><%=i.getInqTitle() %></td>
         
        </tr>
        <tr>
            <th>분류</th>
            <td><%= i.getInqMenu()%></td>
            <th>작성자</th>
            <td><%= i.getMemId()%></td>
            <th>작성일</th>
            <td><%=i.getInqDate() %></td>
        </tr>
        <tr>
            <th>내용</th>
            <td colspan="5">
                <p style="height: 300px;"><%=i.getInqCnt() %></p>
            </td>
            
        </tr>

    </table>
    <br><br>
    <div id="buttons">
        <a href="<%=contextPath %>/list.bo" class="btn btn-sm btn-secondary" >목록가기</a>
        <a href="<%= contextPath %>/updateForm.bo?num=<%= i.getInqNo() %>" class="btn btn-sm btn-warning">수정하기</a>
        <a href="<%= contextPath %>/deleteForm.bo?num=<%= i.getInqNo() %>" class="btn btn-sm btn-danger">삭제하기</a>
      
	    </div>

    </div>
</div>
    <!-- 얘를 보고 쿼리를 생각해야함. select notice_no, notice_title, notice_content , user_id(조인), create_date from notice+member -->
    <!-- 대충..이정도 짜면대지않을까 sql 디벨롭으로 이동  -->
</div>
</body>
</html>