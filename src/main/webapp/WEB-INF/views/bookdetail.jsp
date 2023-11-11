<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ page session="true"%>

<html lang="en">
<!-- 헤더 시작 -->
<%@ include file="include/header.jsp"%>
<!--  헤더 끝 -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript">
$(document).ready(function(){
   let logincheck = "${user}";
   
   var url = "${pageContext.request.contextPath}/book/bookdetail1";
   var paramData = {
                "id" : '${user.id}',
         "booknum" : '${book.booknum}',
         "bookname" : '${book.bookname}'
         
   }
   
   $('#rentalbtn').click(function(){
      if (logincheck == ""){
         alert('로그인후 이용가능합니다.');
         location.href="${contextPath}/board/loginForm";
      } else {
         if(confirm('정말로['+"${book.bookname}"+']을 대여 하겠습니까?')){
         $.ajax({
            url:url,
            data:paramData,
            dataType:'json',
            type:'POST',
            success : function(result){
               alert('대여완료');
               document.location.reload();
            },
            error : function(resule){
               alert('에러발생');
            }
         });
      }
      }   
   });
   
});
   



</script>
<body id="page-top">
   <!-- Page Wrapper -->
   <div id="wrapper">
      <!-- 네비게이션 시작 -->
      <%@ include file="include/left_column.jsp"%>
      <!-- 네비게이션 종료 -->
      <!-- main_header 시작 -->
      <%@ include file="include/main_header.jsp"%>
      <!-- main_header 종료 -->
      <div class="container-fluid">
         <div class="card shadow mb-4">
            <div class="card-header py-3">
               <h4 class="m-0 font-weight-bold text-primary">
                  상세보기 / 대여
                  <hr>
               </h4>
                  <div class="col-lg-8">

                     <!-- Background Gradient Utilities -->
                     <div class="card shadow mb-4">
                        <div class="card-body">
                           <div class="table-responsive">
                              <table>
                                 <tr>
                                    <th colspan="2">
                                       <div class="card-body">
                                          <h6 class="m-0 font-weight-bold text-primary">책 제목</h6>
                                          <br>
                                          <p>${book.bookname}</p>
                                       </div>
                                    </th>
                                    <th>
                                       <div class="card-body">
                                          <h6 class="m-0 font-weight-bold text-primary">저자</h6>
                                          <br>
                                          <p>${book.author}</p>
                                       </div>
                                    </th>
                                    <th>
                                       <div class="card-body ">
                                          <h6 class="m-0 font-weight-bold text-primary">출판사</h6>
                                          <br>
                                          <p>${book.publishr}</p>
                                       </div>
                                    </th>
                                    <th>
                                       <div class="card-body">
                                          <h6 class="m-0 font-weight-bold text-primary">장르</h6>
                                          <br>
                                          <p>${book.genre}</p>
                                       </div>
                                    </th>
                                    <th>
                                       <div class="card-body">
                                          <h6 class="m-0 font-weight-bold text-primary">책출판지</h6>
                                          <br>
                                          <p>${book.country}</p>
                                       </div>
                                    </th>
                                 </tr>
                                 <tr>
                                    <td colspan="3" rowspan="2">
                                       <div class="card-body card mb-4 py-3 border-primary">
                                          <h6 class="m-0 font-weight-bold text-primary">책 소개</h6>
                                          <br>
                                          <textarea style="border: none; resize: none;"
                                             id="bookcomment" rows="8" cols="70" readonly>${book.bookcomment}</textarea>
                                       </div>
                                    </td>
                                    <th>
                                       <div class="card-body">
                                          <h6 class="m-0 font-weight-bold text-primary">책 등록일</h6>
                                          <br>
                                          <p>${book.regdate}</p>
                                       </div>
                                    </th>
                                    <th>
                                       <div class="card-body">
                                          <h6 class="m-0 font-weight-bold text-primary">책 가격</h6>
                                          <br>
                                          <p>${book.pay}원</p>
                                       </div>
                                    </th>
                                    <th>
                                       <div class="card-body">
                                          <h6 class="m-0 font-weight-bold text-primary">페이지</h6>
                                          <br>
                                          <p>${book.bookpage}쪽</p>
                                       </div>
                                    </th>
                                 </tr>
                                 <tr>
                                    <th colspan="2">
                                       <div class="card-body" style="height: 45px">
                                          <h6 class="m-0 font-weight-bold text-primary">
                                             이 책의
                                             대여횟수&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                             <font style="color: #858795">${book.bookrentalcnt}번</font>
                                          </h6>

                                       </div>
                                       <div class="card-body" style="height: 45px">
                                          <h6 class="m-0 font-weight-bold text-primary">
                                             남은갯수&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                             <font style="color: #858795">${book.bookcnt}/${book.bookmax}권</font>
                                          </h6>
                                       </div>
                                    </th>
                                    <th><center>
                                          <h6 class="m-0 font-weight-bold text-primary">대여 여부</h6>
                                          <br>
                                          <c:if test="${book.bookcnt ne 0}">
                                             <button id="rentalbtn" name="rentalbtn" type="button"
                                                class="btn btn-success" onclick="">대여하기</button>
                                          </c:if>
                                          <c:if test="${book.bookcnt eq 0}">
                                             <button class="btn btn-danger" onclick ="alert('책이 없습니다.')">대여불가</button>
                                          </c:if>
                                       </center></th>
                                 </tr>
                              </table>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- Footer 시작 -->
      <%@ include file="include/footer.jsp"%>
      <!-- Footer 끝 -->

   </div>
   <!-- End of Content Wrapper -->

   <!-- End of Page Wrapper -->

   <!-- 스크롤 최상단 올리기 버튼-->
   <a class="scroll-to-top rounded" href="#page-top"> <i
      class="fas fa-angle-up"></i>
   </a>

   <!-- Logout Modal 시작-->
   <%@ include file="include/logout_modal.jsp"%>
   <!-- Logout Modal 끝-->

</body>

</html>