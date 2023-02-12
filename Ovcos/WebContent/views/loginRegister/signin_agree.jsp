<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
  	<link rel="stylesheet" href="../../resources/css/start.css">
    <link rel="stylesheet" href="../../resources/css/header.css">
    <link rel="stylesheet" href="../../resources/css/findId.css">

    <title>OVCOS</title>
</head>    
<body>

    <%@ include file="../../views/common/navForIndex.jsp" %>

    <script>
      $(function(){
        $("#lastgroup").remove();
      })
    </script>

      <div id="startWrap">

          <form action="test1.do" method="post">
            <div id="content">
              <div id="login">
              <img src="../../resources/image/logo.png" alt="로고" id="logotop">
                         <div id="step">
                  <ul id="joinStep">
                    <li><b>약관동의</b></li>
                    <li>이메일 동의</li>
                    <li>정보 기입</li>
                    <li>완료</li>
                  </ul>
                </div>
                <div id="provision">
                  <div style="overflow:auto; width:100%; height:100%;">
                  Lorem ipsum dolor sit amet consectetur adipisicing elit. Quia, blanditiis! Porro eum, dolor, beatae hic ad sapiente vero numquam maxime quaerat pariatur sequi, alias aspernatur fugiat magni nesciunt rem labore!
                  Lorem ipsum dolor sit amet consectetur, adipisicing elit. Maiores numquam recusandae veritatis harum ducimus provident facilis consequuntur magni maxime, amet, odio possimus natus dolores. Eos vel aliquam modi repellendus fugiat!
                  Lorem ipsum dolor sit amet consectetur adipisicing elit. Omnis cumque saepe harum tenetur, nam accusantium blanditiis odio quisquam libero doloremque similique dicta et ex id labore esse illo reprehenderit aspernatur!
                  Lorem ipsum dolor, sit amet consesctetur adipisicing elit. Omnis suscipit molestiae aliquam! Reprehenderit iure esse sequi vel quasi soluta animi corrupti reiciendis consectetur. Provident possimus nam unde dolorum, eos molestiae?
                  Lorem ipsum dolor sit amet consectetur, adipisicing elit. Rem labore, sapiente officiis autem necessitatibus omnis a minus nemo dignissimos vel cumque temporibus enim molestias quod quis dolores. Ab, consectetur quo.
                  Lorem ipsum dolor sit, amet consectetur adipisicing elit. Sequi commodi accusantium quis molestiae explicabo aut modi et ullam cum ducimus. Autem aspernatur nulla maiores. Eum minus nesciunt ullam optio corporis?
                  </div>
                </div>
                <div id="agreeCheck">
                  <input type="checkbox">동의합니다.
                </div>
                <button class="btn"> <a href="email1.html">다음</a></button>
                <!-- <button class="btn" onclick="location.herf='email1.html'">다음</button> -->
                
              
              
            
            
            </div>
          </div>
        </form>
        
      </div>        
  </div>
</body>
</html>