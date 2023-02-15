<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../common/nav.jsp" %>

    <div class="outer">
        <br><br>
        <div id="title"><h2>공지사항</h2></div>    
        <br><br>
    
        <div><button>글작성</button></div>
        <table>
            <thead>
                <th>글번호</th>
                <th  width="400">제목</th>
                <th >조회수</th>
                <th width="100">작성일</th>
            </thead>
            <tbody>

                    <tr>
                        <td colspan="5" align="center">존재하는 공지사항이 없습니다</td>
                    </tr>

                        <tr>
                            <td>3</td>
                            <td>서버 점검 예정입니다</td>
                            <td>1</td>
                            <td>2022-02-13</td>
                        </tr>
            </tbody>
        </table>
    </div>


</body>
</html>