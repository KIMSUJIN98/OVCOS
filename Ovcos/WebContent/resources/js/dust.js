

function select1(sido){
    
    $.ajax({
        url:'http://apis.data.go.kr/B552584/ArpltnInforInqireSvc/getCtprvnRltmMesureDnsty?serviceKey=sRnVSoX8ptcgKb5UCmyid%2FdniHA7eyJ0GmaMQLs2MT15BxO7%2FkWh5XVZd%2BAY7a91ox1xXjrDV9Hty6nVVjFDhw%3D%3D&returnType=xml&numOfRows=100&pageNo=1&ver=1.0&sidoName='+sido,
        type:'get',
        success:function(response){
            console.log(response)
            var pm25 = (($(response).find("pm25Value"))[0]).innerHTML;
            var pm10 = (($(response).find("pm10Value"))[0]).innerHTML;
            console.log("pm10 : "+pm10);
            console.log("pm25 : "+pm25);

            // console.log($("#mi").prop("src","/Ovcos/resources/image/Emo2.png"));
            // 미세먼지 관련 태그
            var mi1 = $("#mi");
            var status1 = $("#status1");
            var miVal = $("#miVal");

            // 초미세먼지 관련 태그
            var mi2 = $("mi2");
            var status2 = $("#status2");
            var mival2 = $("#miVal2");
            
           

            // pm10 : 0~30 좋음, 31~80 보통, 81~150 나쁨, 151~ 매우나쁨
            if(pm10 <= 30){
                mi1.prop("src","/Ovcos/resources/image/Emo3.png");
                status1.html("좋음");
                miVal.html(pm10);
  
            }else if(pm10 <=80){
                mi1.prop("src","/Ovcos/resources/image/Emo4.png");
                status1.html("보통");
                miVal.html(pm10);

            }else if(pm10 <=150){
                mi1.prop("src","/Ovcos/resources/image/Emo1.png");
                status1.html("나쁨");
                miVal.html(pm10);

            }else{
                mi1.prop("src","/Ovcos/resources/image/Emo2.png");
                status1.html("매우나쁨");
                miVal.html(pm10);

            }




            // pm25 : 0~15 좋음, 15~35 보통, 36~75 나쁨, 76~ 매우나쁨
            if(pm25 <= 15){
                mi2.prop("src","/Ovcos/resources/image/Emo3.png");
                status2.html("좋음");
                miVal2.html(pm25);
            }else if(pm25 <=35){
                mi2.prop("src","/Ovcos/resources/image/Emo4.png");
                status2.html("보통");
                miVal2.html(pm25);
            }else if(pm25 <=75){
                mi2.prop("src","/Ovcos/resources/image/Emo1.png");
                status2.html("나쁨");
                miVal2.html(pm25);
            }else{
                mi2.prop("src","/Ovcos/resources/image/Emo2.png");
                status2.html("매우나쁨");
                miVal2.html(pm25);
            }



        }
    })


}
    
    
    function success({coords,timestamp}){
            const latitude = coords.latitude;
            const longitude = coords.longitude;
            // alert('위도 :'+latitude+', 경도 :'+longitude);
            naver.maps.Service.reverseGeocode({
                location: new naver.maps.LatLng(latitude, longitude),
            }, function(status, response) {
                if (status !== naver.maps.Service.Status.OK) {
                    return alert('Something wrong!');
                }

                var result = response.result, // 검색 결과의 컨테이너
                    items = result.items; // 검색 결과의 배열
                console.log(items)

                var item = items[0].addrdetail.sido;
                sido = String(item).substring(0,2);
                var dong = items[1].addrdetail.dongmyun;
                $("#addre").html("("+dong+")");


                select1(sido);

            });

        }

        function getUserLocation(){
            if(!navigator.geolocation){
                alert("위치 정보가 지원되지 않습니다");
                throw "위치 정보가 지원되지 않습니다."
            }else{
                navigator.geolocation.getCurrentPosition(success);
            }
        }

        


        

        getUserLocation();