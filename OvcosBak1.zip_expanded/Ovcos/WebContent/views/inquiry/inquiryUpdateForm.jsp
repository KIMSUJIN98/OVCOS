<%@page import="com.ovcos.inquiry.model.vo.Inquiry"%>
<%@ include file="../common/nav.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    Inquiry i = (Inquiry) request.getAttribute("i");
    %>
        
<!DOCTYPE html>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	 <link rel="stylesheet" href="../../resources/css/inquiryEnrollStyle.css?abc">
      <link rel="stylesheet" href="resources/css/inquiryEnrollStyle.css?abc">
      


<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<div id="wrap">
<div class="outer">
      <br>
      <div class="inner">
      <h2 align="center" id="title">문의사항 수정하기</h2>
      <br>

      <form id="update-form" action="<%= contextPath%>/update.bo" method="post">
      
       <input type = "hidden" name="num" value="<%= i.getInqNo() %>">
         <table align="center">
            <th width="100px">분류</th>
            <td width="150px"><select name="select">
				  <option value="1">피드</option>
				  <option value="2">탐색</option>
				  <option value="3">챌린지</option>
				  <option value="4">마이페이지</option>
				  <option value="5">기타</option>
			</select></td>
            <tr>
               <th>제목</th>
               <td>
                  <input type="text" name="inqTitle" required value="<%=i.getInqTitle()%>">
               </td>
            </tr>
            <tr>
               <th>내용</th>
               <td>
                  <input type="text" name="inqCnt" id="inqCnt" required value="<%=i.getInqCnt()%>">
               </td>
            </tr>
            
         </table>
         <br>
         <div align="center">
            <button type="submit" class="btn btn-sm btn-light">수정하기</button>
            <button type="button" onclick="history.back()"class="btn btn-sm btn-danger">뒤로가기</button>
         </div>
      </form>
   </div>
   </div>
   </div>
   


</body>
</html>