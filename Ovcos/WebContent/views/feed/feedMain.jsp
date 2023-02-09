<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="../../resources/css/feedMainStyle.css">
<title>Insert title here</title>

</head>
<body>
<!-- feed관련 페이지 작성 -->

<div id="feedWrap">
        
            <div id="ct1">
                <div id="record">운동기록구역입니다</div>
                <div id="notice">공지사항구역입니다</div>
            </div>
            <div id="ct2">
                <div id="content_header">
                    <div id="btn_list">
                        <div id="all_feed"><a href="">전체피드</a></div>
                        <div id="fw_feed"><a href="">친구피드</a></div>
                        <div id="my_feed"><a href="">내피드</a></div>
                    </div>
                    <div id="feed_select">
                        <select name="" id="fs">
                            <option value="">최신순</option>
                            <option value="">오래된순</option>
                            <option value="">별점순</option>
                            <option value="">찜순</option>
                        </select>
                    </div>
                </div>

                <div id="content_feed">
                    <iframe src="mainHeader.html"></iframe>
                </div>
            </div>

            
            <div id="ct3">
                <div id="dust">미세먼지api 구역</div>
                <div id="weather">날씨 api 구역</div>
                <div id="footer"> 푸터구역
                </div>
            
            </div>

    </div>
</body>
</html>