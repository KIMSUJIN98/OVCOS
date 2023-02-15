<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../../resources/css/feedContent.css">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/f54b74b3a0.js" crossorigin="anonymous"></script>
</head>
<body>

<div class="feedWrap">
    <br>
    <div class="feedContent">
        <div class="feed_table">
            <table border="0px" id="f_table">
                <tr id="tr1">
                    <td id="profile" colspan="2">
                        <div>
                            <div id="p_img"><img src="${pageContext.request.contextPath}/resources/image/mypage.png" alt="프로필이미지"></div>
                            <div id="p_name">박철수</div>
                            <div id="p_loca">위치위치위치</div>
                        </div>
                    </td>
                    <td id="plus">
                    <div>
                        <img src="${pageContext.request.contextPath}/resources/image/more.png" alt="더보기 버튼">
                    </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" id="td2_1">
                        <div id="f_title">
                        <a href="">이번주에 제가 여기서 운동을 블라블래 피드 제목 했는데요</a>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" id="f_content">
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Et recusandae voluptates magni exercitationem earum, odit, numquam voluptas libero nisi pariatur esse nesciunt animi, labore corrupti beatae repellendus inventore tempora quod!</p>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" id="gpx">
                        <div>
                            <img src="${pageContext.request.contextPath}/resources/image/gpx_ex.png" alt="">
                        </div>
                    </td>
                </tr>
                <tr>
                    <td >
                        <div id="star">⭐⭐⭐⭐</div>
                    </td>
                    <td id="like">
                        <i class="fa-regular fa-heart"></i>
                    </td>
                    <td id="comment">댓글</td>
                </tr>
            </table>  
        
        </div>
    
    </div> 
    

    <div class="feedContent"></div>
    <div class="feedContent"></div>
    <div class="feedContent"></div>
    <div class="feedContent"></div>
    <div class="feedContent"></div>
    <div class="feedContent"></div>
    <div class="feedContent"></div>
    <div class="feedContent"></div>



</div>

</body>
</html>