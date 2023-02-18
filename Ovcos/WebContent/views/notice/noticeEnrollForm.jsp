<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
        width: 1000px;
        height: 500px;
        margin: auto;
        margin-top: 50px;
        background : black;
        color: white;
    }
    #enroll-form input, #enroll-form textarea{
        width: 100%;
        box-sizing: border-box;
    }

</style>
</head>
<body>
	<%@ include file="../common/nav.jsp" %>


 <div class="outer" align="center">
        <br>
        <h2 align="center">공지사항 작성하기</h2>
        <br>

        <form action="<%= contextPath %>/insert.no" id="enroll-form" method="post">
            <table>
                <tr>
                    <th>제목</th>
                    <td><input type="text" name="title" required></td>
                </tr>
                
                <tr>
                    <th>내용</th>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <textarea  rows="10" name="content" id="" style="resize: none;" required></textarea>
                    </td>
                </tr>
            </table>
            
            <br><br>
            <div>
                <button type="submit">등록하기</button>
                <button type="reset">초기화</button>
                <button type="button" onclick="history.back()">뒤로가기</button>
                <!-- 윈도우객체배울때 히스토리에 대해 배움 -->
            </div>

        </form>


    </div>
    
    
</body>
</html>