<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>대회목록</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${pageContext.request.contextPath}/resources/css/challengeStyles.css" rel="stylesheet" />
        <style>
            #updateContest-form input{
                width: 100%;
                box-sizing: border-box;
            } 
        </style>

    </head>

    <body>
        <%@ include file="../common/nav.jsp" %>
            <!-- Navigation
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container px-4 px-lg-5">
            <a class="navbar-brand" href="#!">Start Bootstrap</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                    <li class="nav-item"><a class="nav-link active" aria-current="page" href="#!">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="#!">About</a></li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="#!">All Products</a></li>
                            <li><hr class="dropdown-divider" /></li>
                            <li><a class="dropdown-item" href="#!">Popular Items</a></li>
                            <li><a class="dropdown-item" href="#!">New Arrivals</a></li>
                        </ul>
                    </li>
                </ul>
                <form class="d-flex">
                    <button class="btn btn-outline-dark" type="submit">
                        <i class="bi-cart-fill me-1"></i>
                        Cart
                        <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                    </button>
                </form>
            </div>
        </div>
    </nav> -->


            <!-- Header-->
            <header class="bg-dark py-5">
                <div class="container px-4 px-lg-5 my-5">
                    <div class="text-center text-white">
                        <h1 class="display-4 fw-bolder">대회</h1>
                        <p class="lead fw-normal text-white-50 mb-0">
                            대회 혼자가기 무섭니? <br>
                            같이 가보자GO!
                        </p>
                    </div>
                </div>
            </header>

            <!-- Button to Open the Modal -->
            <div style="float: left; padding-top: 30px; width: 84%;" align="right">
                <button type="button" class="btn btn-outline-dark mt-auto" data-toggle="modal" data-target="#newCnts">대회추가</button>
            </div>

            <!-- The Modal -->
            <div class="modal" id="newCnts">
                <div class="modal-dialog">
                    <div class="modal-content">

                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title">대회 추가</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>


                        <!-- Modal body -->
                        <div class="modal-body" align="center">
                            <form action="test.do" method="post" id="updateContest-form">
                                <table>
                                    <tr>
                                        <th>대회명</th>
                                        <td>
                                            <input type="text" name="contestName" required>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>대회날짜</th>
                                        <td>
                                            <input type="date" min="2020-01-01" name="contestDate">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>URL</th>
                                        <td>
                                            <input type="text" name="contestUrl">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>이미지</th>
                                        <td>
                                            <input type="file" name="contestImg">
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

            <!-- Section-->
            <section class="py-5">
                <div class="container px-4 px-lg-5 mt-5">
                    <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                        <div class="col mb-5">
                            <div class="card h-100">
                                <!-- Product image-->
                                <img class="card-img-top" src="../../resources/image/서울마라톤.PNG" alt="..." />
                                <!-- Product details-->
                                <div class="card-body p-4">
                                    <div class="text-center">
                                        <h5 class="fw-bolder">서울마라톤</h5>
                                        상세설명
                                    </div>
                                </div>
                                <!-- Product actions-->
                                <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                    <div class="text-center"><a class="btn btn-outline-dark mt-auto"
                                            href="contestList.jsp">참가하기</a></div>
                                </div>
                            </div>
                        </div>
                        <div class="col mb-5">
                            <div class="card h-100">
                                <!-- Sale badge-->
                                <div class="badge bg-dark text-white position-absolute"
                                    style="top: 0.5rem; right: 0.5rem">모집완료</div>
                                <!-- Product image-->
                                <img class="card-img-top" src="../../resources/image/JTBC마라톤.PNG" alt="..." />
                                <!-- Product details-->
                                <div class="card-body p-4">
                                    <div class="text-center">
                                        <!-- Product name-->
                                        <h5 class="fw-bolder">JTBC마라톤</h5>
                                        <!-- Product price-->
                                        상세설명
                                    </div>
                                </div>
                                <!-- Product actions-->
                                <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                    <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">참가하기</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col mb-5">
                            <div class="card h-100">
                                <!-- Sale badge-->
                                <div class="badge bg-dark text-white position-absolute"
                                    style="top: 0.5rem; right: 0.5rem">참여중</div>
                                <!-- Product image-->
                                <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg"
                                    alt="..." />
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
                                    <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">참가하기</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col mb-5">
                            <div class="card h-100">
                                <!-- Product image-->
                                <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg"
                                    alt="..." />
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
                                    <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">참가하기</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col mb-5">
                            <div class="card h-100">
                                <!-- Sale badge-->
                                <div class="badge bg-dark text-white position-absolute"
                                    style="top: 0.5rem; right: 0.5rem">참여중</div>
                                <!-- Product image-->
                                <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg"
                                    alt="..." />
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
                                    <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">참가하기</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col mb-5">
                            <div class="card h-100">
                                <!-- Product image-->
                                <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg"
                                    alt="..." />
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
                                    <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">참가하기</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col mb-5">
                            <div class="card h-100">
                                <!-- Sale badge-->
                                <div class="badge bg-dark text-white position-absolute"
                                    style="top: 0.5rem; right: 0.5rem">참여중</div>
                                <!-- Product image-->
                                <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg"
                                    alt="..." />
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
                                    <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">참가하기</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col mb-5">
                            <div class="card h-100">
                                <!-- Product image-->
                                <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg"
                                    alt="..." />
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
                                    <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">참가하기</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>


            <!-- Footer-->
            <footer class="py-5 bg-dark">
                <div class="container">
                    <p class="m-0 text-center text-white">Copyright &copy; Your Website 2022</p>
                </div>
            </footer>
            <!-- Bootstrap core JS-->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
            <!-- Core theme JS-->
            <script src="../../resources/js/scripts.js"></script>

    </body>

    </html>