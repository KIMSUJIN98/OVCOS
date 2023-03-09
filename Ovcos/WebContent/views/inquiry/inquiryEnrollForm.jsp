<%@ include file="../common/nav.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        
<!DOCTYPE html>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="outer">
      <br>
      <h2 align="center">문의하기</h2>
      <br>

      <form id="enroll-form" action="<%= contextPath%>/insert.bo" method="post">
      
       <input type = "hidden" name="memId" value="<%= loginUser.getMemId() %>">
         <table align="center">
            <th>분류</th>
            <td><select name="select">
				  <option value="1">피드</option>
				  <option value="2">탐색</option>
				  <option value="3">챌린지</option>
				  <option value="4">마이페이지</option>
				  <option value="5">기타</option>
			</select></td>
            <tr>
               <th>제목</th>
               <td>
                  <input type="text" name="inqTitle" required>
               </td>
            </tr>
            <tr>
               <th>내용</th>
               <td>
                  <textarea rows="10" name="inqCnt" style="resize: none;" required></textarea>
               </td>
            </tr>
            
         </table>
         <br>
         <div align="center">
            <button type="submit">작성하기</button>
            <button type="reset">취소하기</button>
            <button type="button" onclick="history.back()">뒤로가기</button>
         </div>
      </form>
   </div>
   
  <%--  <script>
   	const selectInput = document.querySelector("#select");
   	
   	selectInput.addEventListener('change', function(){
   		const selectedValue = selectInput.value;
   		
   		const xhr = new XMLHttpRequest();
   		xhr.open('POST', '<%=contextPath%>/insert.bo');
   		xhr.sendRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
   		xhr.send('value=${selectedValue}');
   	})
   </script> --%>



</body>
</html>