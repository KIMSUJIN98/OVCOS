<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="../../resources/css/feedMainStyle.css?문자열">
        <link rel="stylesheet" href="../../resources/css/Create.css">
        <script type="text/javascript"
            src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=kv51brmje9"></script>
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
                                <a href="#" id="username">
                                    <h3>김네임</h3>
                                </a>
                            </div>
                            <div id="ac_recode">
                                <div id="last_ac1">
                                    <div class="h51">
                                        <h5>LAST ACTIVITY</h5>
                                    </div>
                                    <div id="last_info"><a href="#" id="f_title">피드제목&nbsp;<span>2023-02-11</span></a>
                                    </div>

                                </div>
                                <div id="last_ac2">
                                    <div class="h51">
                                        <h5>THIS WEEK</h5>
                                    </div>
                                    <div id="km1" class="km"><a href="#">0km</a></div>
                                </div>
                                <div id="last_ac3">
                                    <div class="h51" id="ac3_h5">
                                        <h5>THIS YEAR</h5>
                                    </div>
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

            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                Open modal
            </button>


            <!-- The Modal -->
            <div class="modal" id="myModal" tabindex="-1" role="dialog">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">

                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title">Modal Heading</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>

                        <!-- Modal body -->
                        <div class="modal-body">
                            <form action="" id="enrollfrm">
                                <table id="text1">
                                    <tr>
                                        <th>제목</th>
                                        <td><input type="text" name="title" size="62" placeholder="제목입력해주세요"></td>
                                    </tr>
                                </table>

                                <br>


                                <table id="text">
                                    <tr>
                                        <th style="padding-bottom: 160px;">내용</th>
                                        <td>
                                            <textarea type="text" name="content" cols="62" rows="7"
                                                style="resize: none;"></textarea>
                                        </td>
                                    </tr>
                                    

                                </table>
                                <hr>

                                <div style=" display: flex;">
                                    <div >
                                        <label for="avatar" style="margin-left: 50px;"><b>파일 첨부 :</b></label>
                                        <input type="file" id="avatar" name="avatar" accept="">
                                    </div>
                                    <div style="display: flex; float: right;">
                                        <b style="padding-top: 5px; padding-right: 5px; margin-left: 160px;">별점</b>
                                        <div class="star-rating">
                                            <input type="radio" id="5-stars" name="rating" value="5" />
                                            <label for="5-stars" class="star">&#9733;</label>
                                            <input type="radio" id="4-stars" name="rating" value="4" />
                                            <label for="4-stars" class="star">&#9733;</label>
                                            <input type="radio" id="3-stars" name="rating" value="3" />
                                            <label for="3-stars" class="star">&#9733;</label>
                                            <input type="radio" id="2-stars" name="rating" value="2" />
                                            <label for="2-stars" class="star">&#9733;</label>
                                            <input type="radio" id="1-star" name="rating" value="1" />
                                            <label for="1-star" class="star">&#9733;</label>
                                        </div>
                                    </div>
                                </div>
                                <hr>
                                <div id="map" style="width:100%;height:350px;"></div>

                                </form>
                                </div>


                        <!-- Modal footer -->

                        <div>
                            <b style="margin-left: 50px;">공개여부</b>
                            <select>
                                <option>전채공개</option>
                                <option>비공개</option>
                                <option>친구에게만</option>
                            </select>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary" >작성</button>
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                        </div>

                    </div>
                </div>
            </div>

                                <script>
                                    var mapOptions = {
                                        center: new naver.maps.LatLng(37.3595704, 127.105399),
                                        zoom: 10
                                    };
                                    
                                    var map = new naver.maps.Map('map', mapOptions);
                                    </script>





            <script>

                var map = new naver.maps.Map('map', {
                    center: new naver.maps.LatLng(37.3595704, 127.105399),
                    zoom: 10
                });

            </script>

    </body>

    </html>