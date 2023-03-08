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

            // 현재 날짜 및 시간 표시
            var date = new Date();

            var format = date.getFullYear()+"년 "+
                         ((date.getMonth()+1) <9? "0"+(date.getMonth()): (date.getMonth()))+"월 "+
                         (date.getDate() <9? "0"+(date.getDate()): (date.getDate()))+"일 "+
                         (date.getHours()<9 ? "0"+(date.getHours()): (date.getHours()))+"시";
            console.log(format);

            var datext = document.getElementById("date");
            datext.innerHTML= format;

            // pm10 : 0~30 좋음, 31~80 보통, 81~150 나쁨, 151~ 매우나쁨
            var pm10text = document.getElementById("pm10");
            var str;

            if(pm10 <= 30){
                str = "<img src='/Ovcos/resources/image/blueEmo.png' style='width:25px'> 미세("+pm10+") 좋음"
                pm10text.style.color = "blue";
            }else if(pm10 <=80){
                str = "<img src='/Ovcos/resources/image/greenEmo.png'style='width:25px'> 미세("+pm10+") 보통"
                pm10text.style.color = "green";
            }else if(pm10 <=150){
                str = "<img src='/Ovcos/resources/image/OrangeEmo.png' style='width:25px'> 미세("+pm10+") 나쁨"
                pm10text.style.color = "orange";
            }else{
                str = "<img src='/Ovcos/resources/image/redEmo.png' style='width:25px'> 미세("+pm10+") 매우나쁨"
                pm10text.style.color = "red";
            }
            pm10text.innerHTML = str;

            var pm25text = document.getElementById("pm25");
            var str1;

            // pm25 : 0~15 좋음, 15~35 보통, 36~75 나쁨, 76~ 매우나쁨
            if(pm25 <= 15){
                str1 = "<img src='/Ovcos/resources/image/blueEmo.png'> 초미세("+pm25+") 좋음"
                pm25text.style.color = "blue";
            }else if(pm25 <=35){
                str1 = "<img src='/Ovcos/resources/image/greenEmo.png'style='width:25px'> 초미세("+pm25+") 보통"
                pm25text.style.color = "green";
            }else if(pm25 <=75){
                str1 = "<img src='/Ovcos/resources/image/OrangeEmo.png'style='width:25px'> 초미세("+pm25+") 나쁨"
                pm25text.style.color = "blue";
            }else{
                str1 = "<img src='/Ovcos/resources/image/redEmo.png'> 초미세("+pm25+") 매우나쁨"
                pm25text.style.color = "red";
            }

            pm25text.innerHTML = str1;


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

                select1(sido);

            });

        }

        function getUserLocation(){
            if(!navigator.geolocation){
                throw "위치 정보가 지원되지 않습니다."
            }else{
                navigator.geolocation.getCurrentPosition(success);
            }
        }

        


        

        getUserLocation();