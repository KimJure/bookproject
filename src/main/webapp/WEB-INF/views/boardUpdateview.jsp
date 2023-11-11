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
  <form action="${contextPath}/board/boardUpdate?bno=${boardDetail.bno}" method="post">
    <h1><input type="text" id="title" name="title" required value="${boardDetail.title}"></h1>
    <div class="metadata">
      <span>ID: ${boardDetail.id}</span>
      <span>
        <span id="typeText"></span>
      </span>
      <span>작성일: ${boardDetail.regdate}</span>
      <span>조회수: ${boardDetail.viewcnt}</span>
      <span>좋아요: <span id="likeCount">${boardDetail.likecnt}</span> 
      <i id="likeButton" class="fas fa-heart" style="font-size: 24px;"></i></span>
    </div>
    <div class="content">
    <p> <input type="text" id="content" name="content" value="${boardDetail.content}"></p>
    </div>
    <div class="navigation-buttons">
      <button type="submit" class="navigation-button" value="${boardDetail.bno}" onclick="return confirmConfirm()">수정</button>
     <a href="${contextPath}/board/boardDetail?bno=${boardDetail.bno}" class="navigation-button1" onclick="return confirmCancel()">취소</a>
  </div>
  </form>
</div>
  
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
 /* 전체 컨테이너 스타일 */
.container {
  max-width: 800px;
  margin: 0 auto;
  padding: 20px;
  border: 1px solid #ccc;
  border-radius: 4px;
  font-family: Arial, sans-serif;
  background-color: #ffffff;
}

/* 제목 스타일 */
h1 {
  font-size: 32px;
  margin-top: 0;
  margin-bottom: 20px;
  color: #333;
  text-align: reft;
}

/* 메타데이터 스타일 */
.metadata {
  margin-bottom: 20px;
  color: #777;
  font-size: 14px;
  text-align: reft;
}

.metadata span {
  margin-right: 10px;
}

/* 좋아요 아이콘 스타일 */
#likeButton {
  color: red;
  font-size: 18px;
  vertical-align: middle;
}

#likeButton:hover {
  cursor: pointer;
}

/* 컨텐츠 스타일 */
.content {
  color: #333;
  line-height: 1.6;
}

/* 네비게이션 버튼 스타일 */
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


.navigation-button1 {
  display: inline-block;
  color: #fff;
  text-decoration: none;
  font-size: 16px;
  padding: 10px 20px;
  background-color: #ff0000;
  border-radius: 4px;
  transition: background-color 0.3s ease;
}

.navigation-button1 i {
  margin-right: 5px;
}

.navigation-button1:hover {
  background-color: #0056b3;
}


/* 유형 텍스트 스타일 */
#typeText {
  font-weight: bold;
}

/* 아이디 스타일 */
#typeText::before {
  content: "유형: ";
}

/* 아이콘 라이브러리 스타일 */
.fas {
  font-family: "Font Awesome 5 Free";
}

</style>

<script>

function confirmConfirm() {
    if (confirm("게시판 수정을 하시겠습니까?")) {
        alert("성공적으로 수정 되었습니다.");
        return true;  // 수정 처리 진행
    } else {
        alert("취소되었습니다.");
        return false; // 정지 처리 취소
    }
}

function confirmCancel() {
    if (confirm("취소 하시겠습니까?")) {
        alert("취소되었습니다.");
        window.history.back()
        return true;  // 취소 처리 진행
    } else {
        alert("취소되었습니다.");
        return false; // 취소 처리 취소
    }
}
</script>

</script>

<!-- 자바스크림트 끝 -->

</body>

</html>