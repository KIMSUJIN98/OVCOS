
<%@page import="com.ovcos.feed.model.vo.Feed"%>
<%@page import="com.ovcos.loginRegister.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>
    <head>
    <meta charset="UTF-8">
    <title>OVCOS - 피드등록</title>
    <!-- Favicon-->
	<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/assets/favicon.ico"/>
	<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/image/favicon.png" sizes="16x16"/>
    <!-- <script src='https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js'></script> -->
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=97s38uvudx"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/feedEnrollForm.css">
    <!-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/navStyle.css"> -->
    <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet"> -->
    <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/canvg/1.5/canvg.min.js"></script> -->
    <!-- <script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script> -->
    <!-- <script src="dom-to-image.js"></script> -->
    <script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html-to-image/1.11.11/html-to-image.min.js" integrity="sha512-7tWCgq9tTYS/QkGVyKrtLpqAoMV9XIUxoou+sPUypsaZx56cYR/qio84fPK9EvJJtKvJEwt7vkn6je5UVzGevw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<%
   String contextPath = request.getContextPath();
   Member loginUser = (Member)session.getAttribute("loginUser");
 %>

 
    
    </head>
    <body>
        
        
    <!--         
        <div id="map" style="width: 600px; height: 600px;"></div> -->
        <div id="feedex">
            <div id="top">
                <div id="title">피드 등록</div>
            </div>
            <div id="mapContent">
                <div id="map"></div>
            </div>
            
            	<form action="<%=contextPath%>/enroll.feed" id="enrollfrm" method="post" enctype="multipart/form-data">
                <div id="content">
                    <input type="hidden" name="userId" value="<%= loginUser.getMemId()%>">
                    <input type="hidden" name="startLon" id="startLon" value="">
                    <input type="hidden" name="startLat" id="startLat" value="">
                    <input type="hidden" name="distance" id="distance" value="">
                    <input type="hidden" name="imgPath" id="imgPath" value="">
    
                        <div style="display: flex; line-height: 30px;">
                            <label for="avatar" style="float: left;"><b>파일첨부 : &nbsp;</b></label>
                            <input type="file" name="avatar" id="avatar" accept=".gpx" style="margin-top: 5px;">
                            <div style="display: flex; float: right;" >
                                <b style="padding-top: 5px; padding-right: 5px; margin-left: 120px; float: left;">별점</b>
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
                            <th style="box-sizing: content-box;">제목</th>
                            <td>
                                <input type="text" name="title" size="79" placeholder="제목입력해주세요" value=""
                                style="height: 40px;" required>
                            </td>
    
                        </tr>
                    </table>
                    <table id="text">
                        <tr>
                            <th style="padding-bottom: 200px;">내용</th>
                            <td>
                                <textarea name="content"  cols="80" rows="13" style="resize: none;" required></textarea>
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
                        <div style="padding-right: 10px;">
                        <input type="button"  id="back" value="뒤로가기" onclick="history.back();" />
                        <button type="reset"
                            id="reset">초기화</button>
                        <button type="submit" style="margin-right: 20px;"
                            id="insert" onclick="return fileSubmit()">제출</button>
                    </div>
                    </div>
                </form>
                </div>
    
         <script>
            $("#sc").click(function(){
            var map = document.querySelector("#map");
            domtoimage.toPng(map).then(function(dataUrl){
                var img = new Image();
                img.src = dataUrl;
                document.body.appendChild(img);
            })
            .catch(function(error){
                console.log("oops, something went wrong!",error);
            })
        })

        var map = new naver.maps.Map('map', {
            center: new naver.maps.LatLng(37.4923615, 127.0292881),
            zoom: 12
            }); 
                
                
        function fileSubmit(){
            var today = new Date();
            const year = today.getFullYear();
            const month = (today.getMonth() <10? "0"+(today.getMonth()+1): today.getMonth);
            const date = (today.getDate() <10? "0"+(today.getDate()): today.getDate());
            const hour = (today.getHours() <10? "0"+(today.getHours()): today.getHours());
            const min = (today.getMinutes() <10? "0"+(today.getMinutes()): today.getMinutes());
            const sec = (today.getSeconds() <10? "0"+(today.getSeconds()): today.getSeconds());

            var str = year+month+date+hour+min+sec;
            console.log(year+month+date+hour+min+sec);


            var title = $("input[name='title']");
            var file = document.getElementById('avatar');
            var content = $("textarea");
            var imgPath = $("#imgPath");
            if(file.files.length <1){
                alert("Gpx 파일을 선택해주세요");
                return false;
            }else{
                if(String(title.val()).length <1){
                    var len = file.files[0].name;
                    var s = String(len).lastIndexOf("g");
                    title.val(String(len).substring(0,s-1));
                    content.val(String(len).substring(0,s-1));
                    var name = String(len).substring(0,s-1)+str+".png";
                    imgPath.val(name);
                    // map capture
                    screenShot($("#map"),name);      
                }else{
                    var name = title.val()+str+".png";
                    imgPath.val(name);
                    screenShot($("#map"),name);   
                }
            }
            
            return true;
            }
            

            function screenShot(target,name){
                if(target != null && target.length >0){
                    var t = target[0];
                    var path="";
                    htmlToImage.toPng(t).then(function(dataUrl){

                        var myImg = dataUrl.replace("data:image/png;base64,","");
                        $.ajax({
                            type:"post",
                            data:{
                                "imgSrc" : myImg,
                                "fileName": name
                            },
                            dataType:"text",
                            url:"<%=contextPath%>/aft",
                            success:function(data){
                                // console.log(data+".png")
                            path = data;
                            console.log(path)
                    

                            },
                            error:function(){
                                alert("error!");
                            }
                        })
                        
                    })
                }
                return path;
            }
                

            $("#insert").click(function () {
                var last = $("#dist").text().lastIndexOf("k");
                $("#distance").val($("#dist").text().substring(0, last));
                $("#startLat").val(startLat);
                $("#startLon").val(startLon);
                $(":radio").each(function (index, value) {
                    if ($(this).attr("checked")) {
                        $("#rate").val($(this).val());
                    }
                })
            })


            $(function () {
                $("#reset").click(function () {
                    $("#title").val("");
                    $("textarea").val("");
                    $("#avatar").val("");
                    $(".star-rating label")
                })
            });


            $("#reset").click(function () {
                $("#path").remove();
                $("#dist").text("");
            })


            var polyline = null;
            var marker = null;
            var array = [];
            var lats = [];
            var lons = [];
            var startLat = null;
            var startLon = null;
            // 거리구하는데 필요한 변수
            var sum = 0;
            function deg2rad(deg) {
                return (deg * Math.PI / 180)
            }
            function rad2deg(deg) {
                return (deg * 180 / Math.PI);
            }
            var R = 6371; // Radius of the earth in km
            var gpxFileInput = document.getElementById('avatar');
            gpxFileInput.addEventListener('change', handleFileSelect, false);
                
                
            function handleFileSelect(event) {
                array = [];
                lats = [];
                lons = [];
                sum = 0;

                $("path").remove();
                $(".marker").remove();
                
                var file = event.target.files[0];
                var formData = new FormData();
                formData.append("file", file);
                setTimeout(function(){
                    $.ajax({
                        url:"<%=contextPath%>/enroll.ajax",
                        type:'post',
                        processData:false,
                        contentType:false,
                        enctype:'multipart/form-data',
                        data:formData,
                        success:function(result){
                            console.log(result)

                            $.ajax({
                                url: '<%=contextPath%>/resources/temp_gpx_upfiles/'+result,
                                dataType: 'xml',
                                strokeColor: '#FF0000', //선 색 빨강 #빨강,초록,파랑
                                strokeOpacity: 0.8, //선 투명도 0 ~ 1
                                strokeWeight: 5,   //선 두께
                                success: function(result){
                                    map.data.addGpx(result);
                                }
                            });
                            
                        },
                        error:function(){

                        }
                        
                    })
                },30
                )

                var reader = new FileReader();
                
                reader.onload = function (event) {
                    var gpx = $.parseXML(event.target.result);
                    console.log(gpx);
                    
                    var trackPoints = $(gpx).find('trkpt');
                    // console.log(trackPoints);
                    trackPoints.each(function (index, value) {
                        var lat = $(this).attr('lat');
                        var lon = $(this).attr('lon');
                        
                        
                        array.push(new naver.maps.LatLng(lat, lon));
                        lats.push(lat);
                        lons.push(lon);
                        if (index == 0) {
                            startLat = lat;
                            startLon = lon;
                        }
                    });
                    
                    
                    for (let i = 1; i < lats.length; i++) {
                        if (lats[i - 1] == lats[i]) {
                            dist = 0
                        } else {
                            var theta = lons[i - 1] - lons[i];
                            // console.log(theta)
                            var dist = Math.sin(deg2rad(lats[i - 1])) * Math.sin(deg2rad(lats[i])) + Math.cos(deg2rad(lats[i - 1])) * Math.cos(deg2rad(lats[i])) * Math.cos(deg2rad(theta));
                            dist = Math.acos(dist);
                            dist = rad2deg(dist);
                            dist = dist * 60 * 1.1515;
                            dist = dist * 1.609344;
                            if (dist === NaN) {
                                dist = 0;
                            }
                            sum += dist;
                        }
                    }
                    // hidden에 초기 위도와 경도 대입하기
                    $("#startLat").val(startLat);
                    $("#startLon").val(startLon);
                    $("#distance").val(sum.toFixed(1));
                    // 화면에 경로 표시하기
                    $("#dist").text(sum.toFixed(2) + 'km');
                    
                    //지도에 마커 표시하기
                    marker = new naver.maps.Marker({
                        position: new naver.maps.LatLng(lats[lats.length - 1], lons[lons.length - 1]),
                        map: map,
                        icon: {
                            content: '<img src=/Ovcos/resources/image/endlocation5.png alt="" class="marker" style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; max-width: none; max-height: none; -webkit-user-select: none; position: absolute; width: 45px; height: 45px; left: 0px; top: 0px;">',
                            size: new naver.maps.Size(45, 45),
                            anchor: new naver.maps.Point(26, 40)
                        }
                    });
                    marker = new naver.maps.Marker({
                        position: new naver.maps.LatLng(startLat, startLon),
                        map: map,
                        icon: {
                                content: '<img src=/Ovcos/resources/image/location3.png alt="" class="marker" style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; max-width: none; max-height: none; -webkit-user-select: none; position: absolute; width: 45px; height: 45px; left: 0px; top: 0px;">',
                            size: new naver.maps.Size(45, 45),
                            anchor: new naver.maps.Point(26, 40)
                        }
                    });
                };
                reader.readAsText(file);
            };

            function cap(){
                    var node = document.getElementById("map");
        
                    htmlToImage.toPng(node).then(function(dataUrl){
                        var img = new Image();
                        img.src = dataUrl;
                        document.body.appendChild(img);
                        $("image").css({width:"600px", heith:"600px"})
                        
                        
                        var link = document.createElement("a");
                        link.download = "naver.png";
                        link.href=dataUrl;
                        link.click();
                    })
                    .catch(function(error){
                        console.error("opps, somethig wlent wrong!", error);
                    })
                }
         </script>
        
    </body>
    </html>