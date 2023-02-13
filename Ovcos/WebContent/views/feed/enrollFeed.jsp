<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../../resources/css/feedMainStyle.css?문자열">
<link rel="stylesheet" href="../../resources/css/Create.css">
<title>Insert title here</title>

</head>
<body>
<!-- feed관련 페이지 작성 -->
<%@ include file="../common/nav.jsp" %>
<div id="nav"></div>
<div id="feedWrap">
        
            <div id="ct1">
                <div id="record">
                    <!-- 운동기록구역입니다 -->
                    <div id="recode1">
                        <div id="profile">
                            <div id="profile_img">
                                <img src="../../resources/image/mypage.png" alt="프로필이미지">
                            </div>
                            <a href="#" id="username"><h3>김네임</h3></a>
                        </div>
                        <div id="ac_recode">
                            <div id="last_ac1">
                                <div class="h51"><h5>LAST ACTIVITY</h5></div>
                                <div id="last_info"><a href="#" id="f_title">피드제목&nbsp;<span>2023-02-11</span></a></div>
                                
                            </div>
                            <div id="last_ac2">
                                <div class="h51"><h5>THIS WEEK</h5></div>
                                <div id="km1" class="km"><a href="#">0km</a></div>
                            </div>
                            <div id="last_ac3">
                                <div class="h51" id="ac3_h5"><h5>THIS YEAR</h5></div>
                                <div id="km2" class="km"><a href="#">0km</a></div>
                            </div>
                            
                        </div>
                    </div>
                </div>
                <div id="notice"><a href="#">서버 점검 예정 2023-03-03</a></div>
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
                <div id="footer">
                    <!-- 푸터구역 -->
                    <div id="f1">
                        <a href="#">약관&nbsp;</a> 
                        <a href="#">&nbsp;개인정보취급방침&nbsp;</a> 
                        <a href="#">&nbsp;고객센터&nbsp;</a>
                    </div>
                    <div>
                        <p> 
                        © 2023 KH OVCOS
                        </p>
                    </div>
                </div>
            </div>

    </div>
    
    <form action="" id="enrollfrm">
        <div class="popup" id="pop1">
            <a href="#a"><img id="end" src="../../resources/image/close.png"></a>
            <h2 id="feed1" style="margin-right: 530px;">피드작성</h2>
            <div>
                <table id="text1">
                    <tr>
                        <th id="th1">제목</th>
                        <td id="td1"><input type="text" name="title" size="55" placeholder="제목입력해주세요"></td>
                    </tr>
                </table>
            </div>
            <br>
            
            <div>
                <table id="text">
                    <tr>
                        <th id="th1" style="padding-bottom: 100px;">내용</th>
                        <td id="td1">
                            <textarea type="text" name="content" cols="54" rows="5" style="resize: none;"></textarea>
                        </td>
                    </tr>
                </table>
            </div>
            
            <hr>
            
            <div>
                <table id="avater1">
                    <th id="th2">
                        <label for="avatar">파일 첨부 : </label>
                        <input type="file" id="avatar" name="avatar" accept="image/png, image/jpeg">
                    </th>
                    <th id="star">별점:</th>
                    <td style="padding-right: -100px;">
                        <div class="rating_box">
                            <div class="rating">
                                ★★★★★
                                <span class="rating_star">★★★★★</span>
                                <input type="range" value="1" step="1" min="0" max="10">
                            </div>
                        </div>
                    </td>
                </table>
            </div>
            <hr>
            <div>
                <table>
                    <td style="height: 230px; width: 640px;">

                    </td>
                </table>
            </div>
            <br>
            <div>
                <table>
                    <tr>
                        <th>공개여부</th>
                        <td>
                            <select style="margin-left: 10px;">
                                <option>전채공개</option>
                                <option>비공개</option>
                                <option>친구에게만</option>
                            </select>
                        </td>
                        <td>
                            <button type="submit" id="upload" style="margin-left: 380px;">올리기</button>
                        </td>
                        <td>
                            <button id="btnout">취소</button>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        </div>
        <div class="dim"></div>
    </form>
    
    
    
    <script>
        const rating_input = document.querySelector('.rating input');
        const rating_star = document.querySelector('.rating_star');

        // 별점 드래그 할 때
        rating_input.addEventListener('input', () => {
            rating_star.style.width = `${rating_input.value * 10}%`;
        });

        $("#btnout").click(function () {
            $("#enrollfrm").css("display", "none");
        })
        $("#end").click(function () {
            $("#enrollfrm").css("display", "none");
        })


        $("#enro").click(function () {
            $("#enrollfrm").css("display", "block");
            $(".dim").css("display", "block");
        })
    </script>
    
</body>
</html>
