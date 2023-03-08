<%@page import="com.ovcos.loginRegister.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/feedEnrollForm.css">
</head>
<%
	String contextPath = request.getContextPath();
	Member loginUser = (Member)session.getAttribute("loginUser");
%>
<body>
        <div id="feedex">
            <div id="top">
                <div id="title">피드 등록</div>
            </div>
            <div id="mapContent">
                <div id="map"></div>
            </div>
            <form action="/enroll.feed" id="enrollfrm" method="post" enctype="multipart/form-data">
                <div id="content">
                    <input type="hidden" name="userId" value="">
                    <input type="hidden" name="startLon" id="startLon" value="">
                    <input type="hidden" name="startLat" id="startLat" value="">
                    <input type="hidden" name="distance" id="distance" value="">

                        <div style="display: flex; line-height: 30px;">
                            <label for="avatar" style="float: left;"><b>파일첨부 : &nbsp;</b></label>
                            <input type="file" name="avatar" id="avatar" accept=".gpx" style="margin-top: 8px;">
                            <div style="display: flex; float: right;" >
                                <b style="padding-top: 5px; padding-right: 5px; margin-left: 160px; float: left;">별점</b>
                                <div class="star-rating" style="display: flex;">
                                    <input type="radio" id="5-stars"
                                        name="rating" value="5" />
                                    <label for="5-stars"
                                        class="star">&#9733;</label>
                                    <input type="radio" id="4-stars"
                                        name="rating" value="4" />
                                    <label for="4-stars"
                                        class="star">&#9733;</label>
                                    <input type="radio" id="3-stars"
                                        name="rating" value="3" />
                                    <label for="3-stars"
                                        class="star">&#9733;</label>
                                    <input type="radio" id="2-stars"
                                        name="rating" value="2" />
                                    <label for="2-stars"
                                        class="star">&#9733;</label>
                                    <input type="radio" id="1-star"
                                        name="rating" value="1" />
                                    <label for="1-star"
                                        class="star">&#9733;</label>
                                </div>
                            </div>
                        </div>               
                    </div>
                
                    <table id="title2">
                        <tr>
                            <th>제목</th>
                            <td>
                                <input type="text" name="title" size="78" placeholder="제목입력해주세요" value="">

                            </td>

                        </tr>
                    </table>
                    <table id="text">
                        <tr>
                            <th style="padding-bottom: 220px;">내용</th>
                            <td>
                                <textarea name="content"  cols="80" rows="13" style="resize: none;"></textarea>
                            </td>
                        </tr>
                    </table>
                    <div style="display: flex;">
                        <div>
                            <b style="margin-left: 30px;">공개여부</b>
                            <select name="displayNy" id="displayNy">
                                <option value="전체">전채공개</option>
                                <option value="비공개">비공개</option>
                                <option value="친구">친구에게만</option>
                            </select>
                        </div>
                        <div>
                            <div style="margin-left: 300px;">
                                <b style="margin-right: 5px;">경로등록하기</b>
                                <select name="trackNy" id="trackNy">
                                    <option value="Y">등록</option>
                                    <option value="N">미등록</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <hr>
                    <div class="ff" style="display: flex; justify-content: space-between;">
                        <div id="dist1">총길이 :<span id="dist"></span></div>
                        <div>
                        <button type="reset" class="btn btn-primary"
                            id="reset">초기화</button>
                        <button type="submit" class="btn btn-primary"
                            id="insert" onclick="return fileSubmit()">제출</button>
                        <button type="button" id="sc" onclick="capture();">스샷</button>
                        <button type="button" onclick="save();">저장</button>
                    </div>
                    </div>
                </div>

            </form>
        </div>

</body>
</html>