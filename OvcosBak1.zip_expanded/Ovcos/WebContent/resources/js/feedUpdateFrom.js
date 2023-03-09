
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

// var map = new naver.maps.Map('map', {
//     center: new naver.maps.LatLng(37.4923615, 127.0292881),
//     zoom: 12
//     }); 
        
        
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
           
                
            console.log("gkdl"+$("#imgPath").val())
        
            
           
            
        
        }// end if
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
                    url:"/Ovcos/aft",
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
        
        var file = event.target.files[0];
        var formData = new FormData();
        formData.append("file", file);
        setTimeout(function(){
            $.ajax({
                url:"/Ovcos/enroll.ajax",
                type:'post',
                processData:false,
                contentType:false,
                enctype:'multipart/form-data',
                data:formData,
                success:function(result){
                    var str = result;
                    console.log(result)

                    $.ajax({
                        url: '/Ovcos/resources/temp_gpx_upfiles/'+str,
                        dataType: 'xml',
                        contentType:  "charset=EUC-KR",
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
                    content: '<img src=/Ovcos/resources/image/endlocation5.png alt="" style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; max-width: none; max-height: none; -webkit-user-select: none; position: absolute; width: 45px; height: 45px; left: 0px; top: 0px;">',
                    size: new naver.maps.Size(45, 45),
                    anchor: new naver.maps.Point(26, 40)
                }
            });
            marker = new naver.maps.Marker({
                position: new naver.maps.LatLng(startLat, startLon),
                map: map,
                icon: {
                        content: '<img src=/Ovcos/resources/image/location3.png alt="" style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; max-width: none; max-height: none; -webkit-user-select: none; position: absolute; width: 45px; height: 45px; left: 0px; top: 0px;">',
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

