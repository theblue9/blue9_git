<%@ page language="java" pageEncoding="UTF-8"%>

<%@ include file="/project/mainHeader.jsp"%>

<script type="text/javascript" src="../js/jquery-3.5.1.js"></script>



<div class="container">

   <div class="row" style="background-color: #F8F8F8;" >

      <div class="col-sm-12" style="height:40px">

         

      </div>

   </div>

 

   

   <!-- intro+차트 올 공간 시작 -->

   <div class="row"

      style="background-color: #F8F8F8; height: 745px;">

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

               <th scope="col">병원명</th>

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

   <!-- intro+차트 올 공간 끝 -->







</div>



<nav aria-label="...">

  <ul class="pagination pagination-sm justify-content-center" style="margin: 20px;">

    <li class="page-item" aria-current="page">

      <span class="page-link">

        1

        <span class="sr-only">(current)</span>

      </span>

    </li>

    <%for(int i=2;i<28;i++){ %>

    <li class="page-item"><a class="page-link" href="javascript:call('<%=i%>')"><%=i %></a></li>

   <%} %>

  </ul>

</nav>



                    

                   <script>

                    

                    var address = encodeURIComponent('http://apis.data.go.kr/B552657/ErmctInfoInqireService/getEmrrmRltmUsefulSckbdInfoInqire?serviceKey=s5f25rkgZmeg3PC1sixLX7%2B6iWHyi5W7jVhufWw0NYq%2BY2HbEP7J4FhyMqcfxQYsa8g0yvJVPujXtpVAMtUoWg%3D%3D&STAGE1=&STAGE2=&pageNo=1&numOfRows=15&');

                        

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

                                         message += "<td>"+dutyName+"</td>";

                                         message += "<td>"+hvec+"</td>";

                                         message += "<td>"+hvgc+"</td>";

                                         message += "<td>"+hvamyn+"</td>";

                                         message += "<td>"+dutyTel3+"</td>";

                                         message += "</tr>";

                                 });   

                                 

                                 $("#table_body").empty();

                                 $("#table_body").append(message);

                                 

                                        

                            }      

                        });  

                        

                        function call(p){

                            var address = encodeURIComponent('http://apis.data.go.kr/B552657/ErmctInfoInqireService/getEmrrmRltmUsefulSckbdInfoInqire?serviceKey=s5f25rkgZmeg3PC1sixLX7%2B6iWHyi5W7jVhufWw0NYq%2BY2HbEP7J4FhyMqcfxQYsa8g0yvJVPujXtpVAMtUoWg%3D%3D&STAGE1=&STAGE2=&pageNo='+p+'&numOfRows=15&');

                              

                           

                           $.ajax({

                               url : 'projectProxy.jsp?url='+address,

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

                                            message += "<td>"+dutyName+"</td>";

                                            message += "<td>"+hvec+"</td>";

                                            message += "<td>"+hvgc+"</td>";

                                            message += "<td>"+hvamyn+"</td>";

                                            message += "<td>"+dutyTel3+"</td>";

                                            message += "</tr>";

                                    });   

                                    

                                    $("#table_body").empty();

                                    $("#table_body").append(message);

                                    

                                           

                               }    

                               

                           });  

                           

                        }

                     

                    </script>