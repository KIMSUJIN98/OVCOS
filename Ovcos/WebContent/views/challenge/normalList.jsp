<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>챌린지</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/assets/favicon.ico" />
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="${pageContext.request.contextPath}/resources/css/challengeStyles.css" rel="stylesheet" />

<style>
    .modal-body input {
        width: 300px;
    }

    .newUpload span{
        font-size: 13px;
        color: gray;
    }
</style>

</head>

<body>
    <%@ include file="../common/nav.jsp" %>
    <!-- Header-->
    <header class="bg-dark py-5">
        <div class="container px-4 px-lg-5 my-5">
            <div class="text-center text-white">
                <h1 class="display-4 fw-bolder">일반</h1>
                <p class="lead fw-normal text-white-50 mb-0">
                	혼자 운동하는게 쉽지 않지? <br>
                	같이 즐기자GO! 
                </p>
            </div>
        </div>
    </header>
    
    <div style="float: left; padding-top: 30px; width: 84%;" align="right">
    <select name="location" id="selectLocation" onchange="selectBox();">
        <option name="selectLocation" value="서울">서울</option>
        <option name="selectLocation" value="부산">부산</option>
        <option name="selectLocation" value="인천">인천</option>
        <option name="selectLocation" value="대구">대구</option>
        <option name="selectLocation" value="광주">광주</option>
        <option name="selectLocation" value="대전">대전</option>
        <option name="selectLocation" value="울산">울산</option>
        <option name="selectLocation" value="세종">세종</option>
        <option name="selectLocation" value="경기">경기</option>
        <option name="selectLocation" value="강원">강원</option>
        <option name="selectLocation" value="충북">충북</option>
        <option name="selectLocation" value="충남">충남</option>
        <option name="selectLocation" value="전북">전북</option>
        <option name="selectLocation" value="전남">전남</option>
        <option name="selectLocation" value="경북">경북</option>
        <option name="selectLocation" value="경남">경남</option>
        <option name="selectLocation" value="제주">제주</option>
    </select>
    </div>
    <!-- Section-->
    <section class="py-5">
        <div class="container px-4 px-lg-5 mt-5">
            <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                <div class="col mb-5">
                    <div class="card h-100">
                        <!-- Product image-->
                        <!-- <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." /> -->
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center" style="margin-top: 50px;">
                                <h5 class="fw-bolder">챌린지 생성</h5>
                                새로운 챌린지를 <br>
                                생성해보세요!
                            </div>
                            <br><br>
                            <!-- Button to Open the Modal -->
                            <div class="text-center">
                                <button type="button" class="btn btn-outline-dark mt-auto" data-toggle="modal" data-target="#newCallengeNormal">새로운 모험</button>
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                        
                            <!-- The Modal -->
                            <div class="modal" id="newCallengeNormal">
                                <div class="modal-dialog">
                                    <div class="modal-content">

                                        <!-- Modal Header -->
                                        <div class="modal-header">
                                            <h4 class="modal-title">챌린지 생성</h4>
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        </div>

                                        <!-- Modal body -->
                                        <div class="modal-body" align="center">
                                            <form action="test.do" method="post" id="updatechallenge-form">
                                                <table class="newUpload">
                                                    <tr>
                                                        <td>
                                                            <input type="text" name="challengeName" required placeholder="챌린지명">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <input type="date" min="2020-01-01" name="challengeDate">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <select name="location" id="selectLocation">
                                                                <option name="selectLocation" value="서울">서울</option>
                                                                <option name="selectLocation" value="부산">부산</option>
                                                                <option name="selectLocation" value="인천">인천</option>
                                                                <option name="selectLocation" value="대구">대구</option>
                                                                <option name="selectLocation" value="광주">광주</option>
                                                                <option name="selectLocation" value="대전">대전</option>
                                                                <option name="selectLocation" value="울산">울산</option>
                                                                <option name="selectLocation" value="세종">세종</option>
                                                                <option name="selectLocation" value="경기">경기</option>
                                                                <option name="selectLocation" value="강원">강원</option>
                                                                <option name="selectLocation" value="충북">충북</option>
                                                                <option name="selectLocation" value="충남">충남</option>
                                                                <option name="selectLocation" value="전북">전북</option>
                                                                <option name="selectLocation" value="전남">전남</option>
                                                                <option name="selectLocation" value="경북">경북</option>
                                                                <option name="selectLocation" value="경남">경남</option>
                                                                <option name="selectLocation" value="제주">제주</option>
                                                            </select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <input type="number" name="challengeMax" min="2" placeholder="최대인원 (최소 2명이상)">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <input type="file" name="contestImg">
                                                            <br>
                                                            <span>이미지 파일을 업로드 해주세요.</span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <textarea name="challengeContent" cols="38" rows="10" style="resize: none;" placeholder="상세설명"></textarea>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <br>
                                                <button type="submit" class="btn btn-secondary">등록</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col mb-5">
                    <div class="card h-100">
                        <!-- Sale badge-->
                        <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">모집완료</div>
                        <!-- Product image-->
                        <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">챌린지</h5>
                                <!-- Product price-->
                                상세설명
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div class="text-center"><button type="button" class="btn btn-outline-dark mt-auto" data-toggle="modal" data-target="#cntsDetail">참가하기</button></div>
                        </div>
                            <!-- The Modal -->
                            <div class="modal" id="cntsDetail">
                                <div class="modal-dialog">
                                    <div class="modal-content">

                                        <!-- Modal Header -->
                                        <div class="modal-header">
                                            <h4 class="modal-title">챌린지 상세보기</h4>
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
                <div class="col mb-5">
                    <div class="card h-100">
                        <!-- Sale badge-->
                        <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">참여중</div>
                        <!-- Product image-->
                        <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">챌린지</h5>
                                <!-- Product price-->
                                상세설명
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">참가하기</a></div>
                        </div>
                    </div>
                </div>
                <div class="col mb-5">
                    <div class="card h-100">
                        <!-- Product image-->
                        <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">챌린지</h5>
                                <!-- Product price-->
                                상세설명
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">참가하기</a></div>
                        </div>
                    </div>
                </div>
                <div class="col mb-5">
                    <div class="card h-100">
                        <!-- Sale badge-->
                        <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">참여중</div>
                        <!-- Product image-->
                        <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">챌린지</h5>
                                <!-- Product price-->
                                상세설명
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">참가하기</a></div>
                        </div>
                    </div>
                </div>
                <div class="col mb-5">
                    <div class="card h-100">
                        <!-- Product image-->
                        <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">챌린지</h5>
                                <!-- Product price-->
                                상세설명
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">참가하기</a></div>
                        </div>
                    </div>
                </div>
                <div class="col mb-5">
                    <div class="card h-100">
                        <!-- Sale badge-->
                        <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">참여중</div>
                        <!-- Product image-->
                        <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">챌린지</h5>
                                <!-- Product price-->
                                상세설명
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">참가하기</a></div>
                        </div>
                    </div>
                </div>
                <div class="col mb-5">
                    <div class="card h-100">
                        <!-- Product image-->
                        <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">챌린지</h5>
                                <!-- Product price-->
                                상세설명
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">참가하기</a></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    
    <!-- Footer-->
    <footer class="py-5 bg-dark">
        <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2022</p></div>
    </footer>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="../../resources/js/scripts.js"></script>

    <script>
        var selectBox = function(){
            var selectLocation = document.getElementById("selectLocation");
            var value = (selectLocation.options[selectLocation.selectedIndex].value);
            // console.log(value);
        }
    </script>

</body>
</html>