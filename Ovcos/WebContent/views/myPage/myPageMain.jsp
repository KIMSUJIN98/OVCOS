<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%= contextPath %>/resources/css/myPageStyle.css">

<!-- 페이징 연결자료 -->
<link rel="stylesheet" href="<%= contextPath %>/resources/css/paginate.css">
    <link rel="stylesheet" href="<%= contextPath %>/resources/css/ligne.css">
    <script type="text/javascript" src="<%= contextPath %>/resources/js/paginate.js"></script>

    <style>
        *{
            font-family: sans-serif;
        }
    </style>


</head>
<body>
	
	<div class="mp-wrap">
        <!-- 배경이미지 및 프로필 관리 영역 -->
        <div class="mp-section1">
            <table id="back-table">
                <tr height="300" class="back-img">
                    <td width="15%"></td>
                    <td width="100px"><img src="<%= contextPath %>/resources/image/mypage.png" alt="프로필이미지"></td>
                    <td id="name">김수진</td>
                    <td></td>
                </tr>
                <tr height="50">
                    <td></td>
                    <td></td>
                    <td id="introduce">지구 끝까지 달릴 기세로 오늘 하루도 화이팅!</td>
                    <td></td>
                </tr>
            </table>
        </div>


        <!-- 운동기록 관리 영역 -->
        <div class="mp-section2">
            <div id="myHealth">
                <div class="sec2-blank"><!-- 상단 여백 --></div>
                <div id="display_list">
                    <div class="sec2-blank2">
                        <!-- 좌측 여백 -->
                    </div>
                    <div id="list_content">
                        <!-- 테두리 안에 들어가 있는 내용 -->
                        <h1>나의 운동로그</h1>

                    </div>
                    <div class="sec2-blank2">
                        <!-- 우측 여백 -->
                    </div>
                </div>
                <div class="sec2-blank"><!-- 하단 여백--></div>
            </div>
        </div>

        <!-- 게시글 관리 영역 -->
        <div class="mp-section3">
            <div id="myActivity">
                <div class="sec2-blank"><!-- 상단 여백 --></div>
                <div id="activity_list">
                    <div class="sec2-blank2">
                        <!-- 좌측 여백 -->
                    </div>
                    <div id="activity_content">
                        <!-- 테두리 안에 들어가 있는 내용 -->

                        <div class="container">
                            <div>
                                <h1>조회</h1>
                            </div>
                            <div class="panel">
                                <div class="body">
                                    <div class="input-group">
                                        <label for="searchBox"></label>
                                        <input type="search" id="searchBox" placeholder="키워드를 입력하세요">
                                    </div>
                                </div>
                            </div>
                            <table class="myTable table hover">
                                <tbody>
                                <tr>
                                    <th>USER ID</th>
                                    <th>ID</th>
                                    <th>TITTLE</th>
                                    <th>COMPLETED</th>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>1</td>
                                    <td>delectus aut autem</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>2</td>
                                    <td>quis ut nam facilis et officia qui</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>3</td>
                                    <td>fugiat veniam minus</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>4</td>
                                    <td>et porro tempora</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>5</td>
                                    <td>laboriosam mollitia et enim quasi adipisci quia provident illum</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>6</td>
                                    <td>qui ullam ratione quibusdam voluptatem quia omnis</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>7</td>
                                    <td>illo expedita consequatur quia in</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>8</td>
                                    <td>quo adipisci enim quam ut ab</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>9</td>
                                    <td>molestiae perspiciatis ipsa</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>10</td>
                                    <td>illo est ratione doloremque quia maiores aut</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>11</td>
                                    <td>vero rerum temporibus dolor</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>12</td>
                                    <td>ipsa repellendus fugit nisi</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>1</td>
                                    <td>delectus aut autem</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>2</td>
                                    <td>quis ut nam facilis et officia qui</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>3</td>
                                    <td>fugiat veniam minus</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>4</td>
                                    <td>et porro tempora</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>5</td>
                                    <td>laboriosam mollitia et enim quasi adipisci quia provident illum</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>6</td>
                                    <td>qui ullam ratione quibusdam voluptatem quia omnis</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>7</td>
                                    <td>illo expedita consequatur quia in</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>8</td>
                                    <td>quo adipisci enim quam ut ab</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>9</td>
                                    <td>molestiae perspiciatis ipsa</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>10</td>
                                    <td>illo est ratione doloremque quia maiores aut</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>11</td>
                                    <td>vero rerum temporibus dolor</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>12</td>
                                    <td>ipsa repellendus fugit nisi</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>1</td>
                                    <td>delectus aut autem</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>2</td>
                                    <td>quis ut nam facilis et officia qui</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>3</td>
                                    <td>fugiat veniam minus</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>4</td>
                                    <td>et porro tempora</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>5</td>
                                    <td>laboriosam mollitia et enim quasi adipisci quia provident illum</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>6</td>
                                    <td>qui ullam ratione quibusdam voluptatem quia omnis</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>7</td>
                                    <td>illo expedita consequatur quia in</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>8</td>
                                    <td>quo adipisci enim quam ut ab</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>9</td>
                                    <td>molestiae perspiciatis ipsa</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>10</td>
                                    <td>illo est ratione doloremque quia maiores aut</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>11</td>
                                    <td>vero rerum temporibus dolor</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>12</td>
                                    <td>ipsa repellendus fugit nisi</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>1</td>
                                    <td>delectus aut autem</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>2</td>
                                    <td>quis ut nam facilis et officia qui</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>3</td>
                                    <td>fugiat veniam minus</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>4</td>
                                    <td>et porro tempora</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>5</td>
                                    <td>laboriosam mollitia et enim quasi adipisci quia provident illum</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>6</td>
                                    <td>qui ullam ratione quibusdam voluptatem quia omnis</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>7</td>
                                    <td>illo expedita consequatur quia in</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>8</td>
                                    <td>quo adipisci enim quam ut ab</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>9</td>
                                    <td>molestiae perspiciatis ipsa</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>10</td>
                                    <td>illo est ratione doloremque quia maiores aut</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>11</td>
                                    <td>vero rerum temporibus dolor</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>12</td>
                                    <td>ipsa repellendus fugit nisi</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>1</td>
                                    <td>delectus aut autem</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>2</td>
                                    <td>quis ut nam facilis et officia qui</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>3</td>
                                    <td>fugiat veniam minus</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>4</td>
                                    <td>et porro tempora</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>5</td>
                                    <td>laboriosam mollitia et enim quasi adipisci quia provident illum</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>6</td>
                                    <td>qui ullam ratione quibusdam voluptatem quia omnis</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>7</td>
                                    <td>illo expedita consequatur quia in</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>8</td>
                                    <td>quo adipisci enim quam ut ab</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>9</td>
                                    <td>molestiae perspiciatis ipsa</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>10</td>
                                    <td>illo est ratione doloremque quia maiores aut</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>11</td>
                                    <td>vero rerum temporibus dolor</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>12</td>
                                    <td>ipsa repellendus fugit nisi</td>
                                    <td></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                        

                    </div>
                    <div class="sec2-blank2">
                        <!-- 우측 여백 -->
                    </div>
                </div>
                <div class="sec2-blank"><!-- 하단 여백--></div>
            </div>







        <script>
            let options = {
                numberPerPage:10, //Cantidad de datos por pagina
                goBar:true, //Barra donde puedes digitar el numero de la pagina al que quiere ir
                pageCounter:true, //Contador de paginas, en cual estas, de cuantas paginas
            };
        
            let filterOptions = {
                el:'#searchBox' //Caja de texto para filtrar, puede ser una clase o un ID
            };
        
            paginate.init('.myTable',options,filterOptions);
        </script>
        
        
        <!-- footer 영역 -->
        <div class="mp-section4">
            
        </div>

    </div>

</body>
</html>