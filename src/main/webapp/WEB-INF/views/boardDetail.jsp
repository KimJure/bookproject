<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ page session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
             
    

<html lang="en">
<!-- 헤더 시작 -->
<%@ include file="include/header.jsp" %>
<!--  헤더 끝 -->
<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">
<!-- 네비게이션 시작 -->
<%@ include file="include/left_column.jsp" %>
<!-- 네비게이션 종료 -->
<!-- main_header 시작 -->
<%@ include file="include/main_header.jsp" %>
<!-- main_header 종료 -->

<div class="container">
    <h2>${boardDetail.title}</h2>
    <div class="metadata">
        <span>ID: ${boardDetail.id}</span>
        <span>
            <span id="typeText"></span>
        </span>
        <span>작성일: ${boardDetail.regdate}</span>
        <span>조회수: ${boardDetail.viewcnt+1}</span>
        <span>좋아요: <span id="likeCount">${boardDetail.likecnt}</span> 
            <i id="likeButton" class="fas fa-heart" style="font-size: 24px;"></i>
        </span>
    </div>
    <div class="content">
        <p>${boardDetail.content}</p>
    </div>
    
    <label class="reply" for="reply">댓글</label><br>
    <label for="author">작성자: ${user.id}</label>
    
<form action="${contextPath}/board/ReplyInsert" method="POST">
  <textarea name="dcontent" id="dcontent" rows="4" cols="50" placeholder="댓글을 입력하세요"></textarea>
  <input type="hidden" name="id" id="id" value="${user.id}">
  <input type="hidden" name="bno" id="bno" value="${boardDetail.bno}">
  <br>
  <input type="button" value="댓글 작성" class="reply-Button" id = "btnReplySave">
  <br><br>
</form>

<div id="ReplyList"></div>
   
    <div class="navigation-buttons">
    <form action="${contextPath}/board/boardDelete?bno=${boardDetail.bno}" method="post">
    <a href="#" class="navigation-button" id="goBackButton">
      <i class="fas fa-arrow-left"></i> 돌아가기
    </a>
        <c:if test="${user != null && user.id eq boardDetail.id}">
            <a id="editButton" href="boardUpdateview?bno=${boardDetail.bno}" class="navigation-editButton1">수정</a>
  <button type="submit" class="navigation-deleteButtonbutton">삭제</button>
        </c:if>
        </form>
    </div>
</div>
<div>
  
   <!-- Footer 시작 -->
            <%@ include file = "include/footer.jsp" %>
            <!-- Footer 끝 -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- 스크롤 최상단 올리기 버튼-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal 시작-->
    <%@ include file = "include/logout_modal.jsp" %>
    <!-- Logout Modal 끝-->

<!-- 자바스크립트 시작 -->
<%@ include file = "include/javascript.jsp" %>



<style>
.container {
  background-color: #f5f5f5;
  padding: 20px;
  border-radius: 8px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.metadata {
  margin-bottom: 10px;
}

.metadata span {
  margin-right: 10px;
}

#likeButton {
  color: #000000;
  transition: color 0.3s ease;
}

#likeButton:hover {
  color: #dc3545;
}

.content {
  margin-bottom: 20px;
}

.reply-Button {
  background-color: #000000;
  color: #fff;
  border: none;
  padding: 10px 20px;
  border-radius: 4px;
  font-size: 16px;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

.label.reply {
  font-size: 40px;
}

.reply-Button:hover {
  background-color: #000011;
}

.navigation-buttons {
  margin-top: 30px;
  text-align: center;
}

.navigation-button {
  display: inline-block;
  color: #fff;
  text-decoration: none;
  font-size: 16px;
  padding: 10px 20px;
  background-color: #007bff;
  border-radius: 4px;
  transition: background-color 0.3s ease;
}

.navigation-button i {
  margin-right: 5px;
}

.navigation-button:hover {
  background-color: #0056b3;
}

.navigation-editButton1 {
  background-color: #218838;
  color: #fff;
  border: none;
  padding: 10px 20px;
  border-radius: 4px;
  font-size: 16px;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

.navigation-editButton1:hover {
  background-color: #218000;
}

.button-container {
  display: flex;
  align-items: center;
}

.navigation-editButton1,
.navigation-deleteButtonbutton {
  margin-right: 10px;
}

.navigation-deleteButtonbutton {
  background-color: #dc3545;
  color: #fff;
  border: none;
  padding: 10px 20px;
  border-radius: 4px;
  font-size: 16px;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

.navigation-deleteButtonbutton:hover {
  background-color: #ff0000;
}
  background-color: #ff0000;
}

#replyContainer {
  border: 1px solid #ccc;
  padding: 100px;
  margin-bottom: 200px;
}

/* 댓글 스타일 */
.reply {
  margin-bottom: 10px;
}

.reply .author {
  font-weight: bold;
}

.reply .content {
  margin-top: 5px;
}

.reply .date {
  font-size: 12px;
  color: #888;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

   
   $(document).ready(function () {
       ReplyList();
       
       $(document).on('click', '#btnReplySave',function(){
          var confirminsert = confirm("댓글을 등록하시겠습니까?");
           if (confirminsert) {
          var dcontent = $("#dcontent").val();
          var id = $("#id").val();
          
          var url = "${pageContext.request.contextPath}/board/ReplyInsert";
          var paramData = {
             "dcontent"   : dcontent,
             "id"   : id,
             "bno"      : '${boardDetail.bno}',
             }

          $.ajax({
             url: url,
             data: paramData,
             dataType: 'json',
             type: 'POST',
             success:function(result){
                //Controller 에서 insert 처리후, 여기로 돌아옴
                ReplyList();
                $("#dcontent").val('');
                alert('댓글이 등록되었습니다.');
             },
             error:function(result){
                alert('에러가 발생했습니다.');
                }
             });
           }
           else alert('취소하였습니다.');
          });
   });   
   // 댓글 목록 불러오기 > board/replylist,bno
   function ReplyList(){
      const url = "${pageContext.request.contextPath}/board/ReplyList";
      var paramData = {
            "bno" : "${boardDetail.bno}"
      };
      
      $.ajax({
         url: url,
         data: paramData,
         dataType: 'json',
         type: 'GET',
         success:function(result){

            var htmls = ""; //문서꾸미기
            if(result.length < 1){
               htmls += '<h3>댓글이 없습니다</h3>';
            } else{
               $(result).each(function(){
                  htmls = htmls + '<div class = "" id = "dno' + this.dno + '">';
                  //ajax에서는 div별로 개별 아이디가 부여되어야함
                  //<div id = "reno12"> <div id="reno13">
                  htmls += '<span class="d-block">';
                  htmls += this.replynum + ' - ';
                  htmls += '<strong class = "text-gray-dark">' + this.id + '</strong>';
                  htmls += '<span style="padding-left:7px; font-size: 9pt">';

                  htmls += '<a href="javascript:void(0)" onclick="fn_editReply(' + this.dno + ', \'' + this.id + '\', \'' + this.dcontent + '\', \'' + this.replynum + '\' )" style="padding-right:5px">수정</a>';
                       htmls += '<a href="javascript:void(0)" onclick="fn_ReplyDelete(' + this.dno + ')">삭제</a>'; 
                       htmls += '</span>';
                  htmls += '</span><br>';
                  htmls += this.dcontent;
                  htmls += '</p>';
                  htmls += '</div>';
               });
            }
            $("#ReplyList").html(htmls);  //댓글위치에 html로 보여주기
            },
            error:function(result){
               alert("실패");
            }
         });
   }
   
   //댓글 삭제하기
   function fn_ReplyDelete(dno) {
    var confirmDelete = confirm("댓글을 삭제하시겠습니까?");
    if (confirmDelete) {
        var url = "${pageContext.request.contextPath}/board/ReplyDelete";
        var paramData = {
            "dno": dno
        };

        $.ajax({
            url: url,
            data: paramData,
            dataType: 'json',
            type: 'POST',
            success: function (result) {
                if (result) {
                    alert("댓글이 삭제되었습니다.");
                    ReplyList();
                }
            },
            error: function (result) {
                alert('댓글 삭제에 실패했습니다.');
            }
        });
    }
    else alert('취소하였습니다.');
}
   
   //댓글 수정하기(form)
      function fn_editReply(dno, id, dcontent, replynum) {
         var htmls = "";
         htmls = htmls + '<div class="" id="dno' +dno + '">';   
         htmls += '<span class="d-block">';
         htmls += replynum + ' - ';
         htmls += '<strong class="text-gray-dark">' + dcontent + '</strong>';
         htmls += '<span style="padding-left: 7px; font-size: 9pt">';
         htmls += '<a href="javascript:void(0)" onclick="fn_ReplyUpdate(' + dno +
               ', \'' + dcontent + '\')" style="padding-right:5px">저장</a>';
         htmls += '<a href="javascript:void(0)" onclick="ReplyList()" >취소</a>';
         htmls += '</span>';
         htmls += '</span><br>';
         htmls += '<textarea id="editmemo" name="editmemo" rows="3">';
         htmls += dcontent;
         htmls += '</textarea>';
         htmls += '</p>';
         htmls += '</div>';
         //선택한 요소를 다른것으로 바꿉니다.(변경)
         $('#dno'+dno).replaceWith(htmls);
         $('#dno'+dno+'#editmemo').focus();
      }
   
    //댓글 수정하기(처리)
       function fn_ReplyUpdate(dno, id) {
          var confirmUpdate = confirm("댓글을 수정하시겠습니까?");
          if (confirmUpdate) {
            var editmemo = $('#editmemo').val();
          const url = "${pageContext.request.contextPath}/board/ReplyUpdate";
          var paramData = {
                "dno"   : dno,
                "id": id,
                 "dcontent" : editmemo
          };

          $.ajax({
              url: url,
              data: paramData,
              dataType: 'json',
              type: 'POST',
              success: function(result) {
                 alert('댓글 수정 완료.');
                  ReplyList();
                  $('#editmemo').val("");
              },
              error: function(result) {
                  alert('댓글 수정 실패.');
              }
          });
       }
   }   
   </script>
   
   <script>
  var type = "${boardDetail.type}";
  var typeText = document.getElementById("typeText");

  switch (type) {
    case "1":
      typeText.textContent = "공지";
      break;
    case "2":
      typeText.textContent = "자유";
      break;
    case "3":
      typeText.textContent = "리뷰";
      break;
    default:
      typeText.textContent = "알 수 없음";
      break;
  }
</script>

<script>
    const goBackButton = document.getElementById("goBackButton");

    goBackButton.addEventListener("click", function(event) {
        event.preventDefault();
        history.back();
    });
</script>

<!-- 자바스크림트 끝 -->

</body>

</html>