<%@ page language="java" pageEncoding="UTF-8"%>

<%@ include file="/project/projectHeader.jsp"%>

<script type="text/javascript" src="../js/jquery-3.5.1.js"></script>

  

  

  

  

<!-- Bootstrap CSS -->

<link rel="stylesheet"

     href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"

      integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"

      crossorigin="anonymous">



<!-- Optional JavaScript -->

<!-- jQuery first, then Popper.js, then Bootstrap JS -->



<script   src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"

         integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"

        crossorigin="anonymous"></script>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"

         integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"

         crossorigin="anonymous"></script>



<div class="container">

<!-- 검색창 시작 -->

   <div class="row" style="background-color: #F8F8F8;" >

      <div class="col-sm-12" style="height:40px">

         

      </div>

   </div>

   <div class="row" style="background-color: #F8F8F8;">

      <div class="col-sm-12"  >

         <div class="form-row d-flex align-items-center">

            <div class="form-group col-md-10">

               <input type="text" id="address" name="address" class="form-control"

                  placeholder="주소를 입력하세요." />

            </div>

            <div class="form-group col-md-2">

               <a href="resultPage.jsp" id="search" class="btn btn-outline-primary">

                  <i class="fa fa-search" aria-hidden="true"></i> 검색 </a>

            </div>

         </div>

      </div>

   </div>



   <div class="row"

      style="background-color: #F8F8F8; height: 500px; ">

      <div class="col-sm-12">

         <table class="table table-hover" style="text-align: center;">

         <colgroup>

            <col width="35%" />

            <col width="10%" />

            <col width="10%" />

            <col width="10%" />

            <col width="30%" />

         </colgroup>

         <thead>

            <tr>

               <th scope="col">병원명(지도)</th>

               <th scope="col">응급실</th>

               <th scope="col">입원실</th>

               <th scope="col">구급차</th>

               <th scope="col">전화</th>

            </tr>

         </thead>

         <tbody id="table_body">

         </tbody>

         

      </table>

      </div>

   </div>

</div>

<!-- 차트 공간 끝 -->



                   <script>

                  $("#address").keydown(function(key) {

                  if (key.keyCode == 13) {

                     $('#search').trigger("click");

                  

                  }

               });

                  $('#search').bind('click', function(){

                  if($('#address').val()==""){

                     alert('주소를 입력하세요..');

                     return;

                  }

                  var address = encodeURIComponent('http://apis.data.go.kr/B552657/ErmctInfoInqireService/getEmrrmRltmUsefulSckbdInfoInqire?serviceKey=s5f25rkgZmeg3PC1sixLX7%2B6iWHyi5W7jVhufWw0NYq%2BY2HbEP7J4FhyMqcfxQYsa8g0yvJVPujXtpVAMtUoWg%3D%3D&STAGE1=&STAGE2=&pageNo=1&numOfRows=400&');

                    

                    // console.log(address);

           

                    $.ajax({

                        url : 'projectProxy.jsp?url=' + address,

                        type : 'GET',

                        dataType : 'xml',

                        error : function(){

                            alert('error');

                        },

                        success : function(xml){

                                                        

                           let message = "";

                             $(xml).find("item").each(function(){  

                                message += "<tr>";

                                     var dutyName = $(this).find("dutyName").text();

                                     var hvec = $(this).find("hvec").text();

                                     var hvgc = $(this).find("hvgc").text();

                                     var hvamyn = $(this).find("hvamyn").text();

                                     var dutyTel3 =  $(this).find("dutyTel3").text(); 

                                     var findStr = $("#address").val() ;

                                     if(dutyName.indexOf(findStr) != -1){

                                    	 message += "<td><a href='mapPage.jsp?name="+dutyName+"'>"+dutyName+"</a></td>";

                                         message += "<td>"+hvec+"</td>";

                                         message += "<td>"+hvgc+"</td>";

                                         message += "<td	>"+hvamyn+"</td>";

                                         message += "<td>"+dutyTel3+"</td>";

                                         message += "</tr>";

                                    }

                             });   

                             

                             $("#table_body").empty();

                             $("#table_body").append(message);

                                                                   

                        }      

                    });  

                  });

                    

                        

                    </script>