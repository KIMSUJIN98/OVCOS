<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="EUC-KR">
    <title>challengeMain</title>
    <link rel="stylesheet" href="../../resources/css/challengeWrap.css">
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>


</head>

<body>
    <%@ include file="../common/nav.jsp" %>
        <div class="wrap">

            <div id="content">
                <div id="chlgMain1">
                    <!-- Button to Open the Modal -->
                    <!-- <button type="button" class="btn btn-primary btn-sm btn-secondary" data-toggle="modal" data-target="#myModal">챌린지 생성</button> -->
                    <div id="demo" class="carousel slide" data-ride="carousel">

                        <!-- Indicators -->
                        <ul class="carousel-indicators">
                          <li data-target="#demo" data-slide-to="0" class="active"></li>
                          <li data-target="#demo" data-slide-to="1"></li>
                        </ul>
                      
                        <!-- The slideshow -->
                        <div class="carousel-inner">
                          <div class="carousel-item active">
                            <div style="background-color: blue; width: 200px; height: 200px; color: white; display: block;">
                                참여중
                            </div>
                            <div class="card">
                                <div class="card-header">Header</div>
                                <div class="card-body">Content</div>
                                <div class="card-footer">Footer</div>
                            </div>
                          </div>
                          <div class="carousel-item">
                            <div style="background-color: blue; width: 100px; height: 100px; color: white;">
                                참여완료
                            </div>
                          </div>

                        </div>
                      
                        <!-- Left and right controls -->
                        <a class="carousel-control-prev" href="#demo" data-slide="prev">
                          <!-- <span class="carousel-control-prev-icon"></span> -->
                        </a>
                        <!-- <a class="carousel-control-next" href="#demo" data-slide="next">
                          <span class="carousel-control-next-icon"></span>
                        </a> -->
                      
                      </div>
                </div>

                <div id="chlgMain2">

                </div>


                <!-- The Modal -->
                <div class="modal" id="myModal">
                    <div class="modal-dialog">
                        <div class="modal-content">

                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h4 class="modal-title">챌린지 생성</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>

                            <!-- Modal body -->
                            <div class="modal-body">
                                Modal body..
                            </div>

                            <!-- Modal footer -->
                            <div class="modal-footer">
                                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                            </div>

                        </div>
                    </div>
                </div>


            </div>



        </div>
</body>

</html>