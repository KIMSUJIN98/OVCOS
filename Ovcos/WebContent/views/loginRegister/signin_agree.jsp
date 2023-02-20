<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html lang="en">

  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
      integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
      integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
      crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
      crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../../resources/css/agreeStyle.css?abc">

    <script src="https://kit.fontawesome.com/66bc1e54e8.js" crossorigin="anonymous"></script>
    <title>OVCOS</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
      integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="../../resources/js/jquery-3.6.3.min.js"></script>
  </head>

  <body>



    <script>
      $(function () {
        $("#lastgroup").remove();
      })


    </script>

    <div id="wrap">

      <div class="popup_area">
        <div class="signin_box">
          <div class="popup_top">

            <br><span id="title">OVCOS 가입 약관 동의</span> <br>
          </div>

          <div class="popup_body">
            <div class="checkbox_group">
              <div id="allAgree">
                <tr>
                  <td><input type="checkbox" id="check_all"></td>
                  <td style="padding-left: 20px;">&nbsp;&nbsp;&nbsp;약관 전체 동의</td>
                </tr>

              </div>

              <div id="agree">
                <form action="test1.do" method="post">
                  <table id="agreeTable">
                    <tr>
                      <td><input type="checkbox" class="normal"></td>
                      <td class="ness">필수</td>
                      <td style="padding-right: 120px;">연령(만 14세 이상) 확인</td>
                      <td></td>
                    </tr>
                    <tr>
                      <td class="checkbox"><input type="checkbox" class="normal"></td>
                      <td class="ness">필수</td>
                      <td id="more">서비스 이용약관 동의</td>
                      <td class="detail" align="center" data-bs-toggle="modal" data-bs-target="#exampleModal"><i
                          class="fa-solid fa-angle-right"></i></td>
                    </tr>
                    <tr>
                      <td><input type="checkbox" class="normal"></td>
                      <td class="ness">필수</td>
                      <td>개인정보 수집 및 이용 동의</td>
                      <td class="detail" align="center" data-bs-toggle="modal" data-bs-target="#exampleModal"><i
                          class="fa-solid fa-angle-right"></i></td>
                    </tr>
                    <tr>
                      <td><input type="checkbox" class="normal"></td>
                      <td class="ness">필수</td>
                      <td>개인정보 제3자 제공 동의</td>
                      <td class="detail" align="center" data-bs-toggle="modal" data-bs-target="#exampleModal"><i
                          class="fa-solid fa-angle-right"></i></td>
                    </tr>
                    <tr>
                      <td><input type="checkbox" class="normal"></td>
                      <td class="ness">필수</td>
                      <td>위치기반 서비스 이용약관</td>
                      <td class="detail" align="center" data-bs-toggle="modal" data-bs-target="#exampleModal" class="modal-dialog modal-dialog-centered modal-dialog-scrollable"><i
                          class="fa-solid fa-angle-right"></i></td>
                    </tr>
                    <tr>
                      <td><input type="checkbox" class="normal"></td>
                      <td id="selection">선택</td>
                      <td>광고성 정보 수신동의</td>
                      <td class="detail" align="center" data-bs-toggle="modal" data-bs-target="#exampleModal"
                        style="cursor:pointer;"><i class="fa-solid fa-angle-right"></i></td>
                    </tr>
                  </table>
              </div>
            
            </div>
            <script>
              $(".checkbox_group").on("click", "#check_all", function () {
                  var checked = $(this).is(":checked");

                  if(checked){
                    $(this).parents(".checkbox_group").find('input').prop("checked", true);
                  } else {
                    $(this).parents(".checkbox_group").find('input').prop("checked", false);
                  }
                });

                $(".checkbox_group").on('click', 'input:not(#check_all)', function () {
                  var is_checked = true;
                  $(".checkbox_group input:not(#check_all)").each(function() {
                    is_checked =  is_checked && $(this).is(":checked");
                  })
                  $("#check_all").prop("checked", is_checked)
                });
            </script>
            
            

            <div id="info">

              인증번호는 이메일로 전송되며, 이메일 미인증 시 가입이 불가능합니다. <br>
              전체 동의는 필수 및 선택정보에 대한 동의도 포함되어 있으며, 개별적으로도 동의를 선택하실 수 있습니다.
              선택항목에 대한 동의를 거부하는 경우에도 서비스 이용이 가능합니다. <br>

              '화살표 버튼'을 누르면 관련 내용을 확인할 수 있습니다.

            </div>
          </div>
        </div>
        <button class="next_btn">다음</button>


      </div>

    </div>
    </div>
    </form>

    </div>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">이용약관</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            Lorem ipsum dolor sit, amet consectetur adipisicing elit. Corrupti, commodi. Natus libero consequuntur dignissimos et dolorem voluptatum sint nostrum similique ea, minus quo quaerat sapiente assumenda officia debitis iure repellat?
            Lorem ipsum dolor sit, amet consectetur adipisicing elit. Corrupti, commodi. Natus libero consequuntur dignissimos et dolorem voluptatum sint nostrum similique ea, minus quo quaerat sapiente assumenda officia debitis iure repellat?
            Lorem ipsum dolor sit, amet consectetur adipisicing elit. Corrupti, commodi. Natus libero consequuntur dignissimos et dolorem voluptatum sint nostrum similique ea, minus quo quaerat sapiente assumenda officia debitis iure repellat?
            Lorem ipsum dolor sit, amet consectetur adipisicing elit. Corrupti, commodi. Natus libero consequuntur dignissimos et dolorem voluptatum sint nostrum similique ea, minus quo quaerat sapiente assumenda officia debitis iure repellat?
            Lorem ipsum dolor sit, amet consectetur adipisicing elit. Corrupti, commodi. Natus libero consequuntur dignissimos et dolorem voluptatum sint nostrum similique ea, minus quo quaerat sapiente assumenda officia debitis iure repellat?
            Lorem ipsum dolor sit, amet consectetur adipisicing elit. Corrupti, commodi. Natus libero consequuntur dignissimos et dolorem voluptatum sint nostrum similique ea, minus quo quaerat sapiente assumenda officia debitis iure repellat?
            Lorem ipsum dolor sit, amet consectetur adipisicing elit. Corrupti, commodi. Natus libero consequuntur dignissimos et dolorem voluptatum sint nostrum similique ea, minus quo quaerat sapiente assumenda officia debitis iure repellat?
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
          </div>
        </div>
      </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
      crossorigin="anonymous"></script>
      
        

  </html>