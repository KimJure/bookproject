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

    <!-- Page Wrapper -->
    <div id="wrapper">
<!-- 네비게이션 시작 -->
<%@ include file="include/left_column.jsp" %>
<!-- 네비게이션 종료 -->
<!-- main_header 시작 -->
<%@ include file="include/main_header.jsp" %>
<!-- main_header 종료 -->



<div class="container">
  <h1>글쓰기</h1>
 <form action="${contextPath}/board/boardInsert" method="post">
 <div class="input-group">
        <label for="id">아이디</label>
        <input type="text" id="id" name="id" value="${user.id}" readonly="readonly">
      </div>
  <div class="category">
  <label for="type">게시판 유형</label>
  <select id="type" name="type">
    <option value="0">선택</option>
    <option value="1">공지사항</option>
    <option value="2">자유게시판</option>
    <option value="3">리뷰게시판</option>
  </select>
  <!-- 선택한 게시판 유형에 따라 값을 저장할 숨겨진 입력 요소 -->
  <input type="hidden" id="typeValue" name="typeValue">
</div>
  <div class="input-group">
    <label for="title">제목</label>
    <input type="text" id="title" name="title">
  </div>
  <div class="input-group">
    <label for="content">내용</label>
    <textarea id="content" name="content"></textarea>
  </div>
  <div class="button-group">
  <button type="submit" onclick="confirmConfirm()">글쓰기</button>
  <button type="button" class="cancel-button" onclick="confirmCancel()">취소</button>
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
    /* Container */
    .container {
      max-width: 500px;
      margin: 0 auto;
      padding: 20px;
      background: linear-gradient(to bottom, #f5f5f5, #e8e8e8);
      border: 1px solid #ddd;
      border-radius: 10px;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }
    
    /* Heading */
    h1 {
      font-size: 36px;
      text-align: center;
      margin-bottom: 20px;
      color: #333;
      text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
    }
    
    /* Form */
    form {
      display: flex;
      flex-direction: column;
    }
    
    /* type */
    .type {
      margin-bottom: 20px;
    }
    
    label[for="type"] {
      display: block;
      font-weight: bold;
      margin-bottom: 10px;
      color: #777;
      text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1);
    }
    
    select#type {
      width: 100%;
      padding: 10px;
      border: none;
      background-color: #f5f5f5;
      border-radius: 5px;
      box-shadow: inset 0 2px 5px rgba(0, 0, 0, 0.1);
      font-size: 16px;
      color: #555;
    }
    
    /* Input Group */
    .input-group {
      margin-bottom: 20px;
    }
    
    label[for="title"],
    label[for="content"],
    label[for="username"] {
      display: block;
      font-weight: bold;
      margin-bottom: 10px;
      color: #777;
      text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1);
    }
    
    input[type="text"],
    textarea {
      width: 100%;
      padding: 10px;
      border: none;
      background-color: #f5f5f5;
      border-radius: 5px;
      box-shadow: inset 0 2px 5px rgba(0, 0, 0, 0.1);
      font-size: 16px;
      color: #555;
    }
    
    /* Button Group */
    .button-group {
      display: flex;
      justify-content: space-between;
      align-items: center;
    }
    
    button[type="submit"],
    button.cancel-button {
      padding: 12px 24px;
      font-size: 18px;
      border-radius: 5px;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }
    
    button[type="submit"] {
      background-color: #00cc66;
      color: white;
      border: none;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
      animation: pulse 2s infinite;
    }
    
    button[type="submit"]:hover {
      background-color: #00b359;
    }
    
    button.cancel-button {
      background-color: #ff3333;
      color: white;
      border: none;
    }
    
    button.cancel-button:hover {
      background-color: #cc0000;
    }
    
    .button-group {
      justify-content: center;
    }

</style>

<script>
function confirmConfirm() {
    if (confirm("게시글을 업로드 하시겠습니까?")) {
        alert("성공적으로 업로드 되었습니다.");
        return true;  // 정지 처리 진행
    } else {
        alert("취소되었습니다.");
        return false; // 정지 처리 취소
    }
}

function confirmCancel() {
    if (confirm("취소 하시겠습니까?")) {
        alert("취소되었습니다.");
        window.history.back()
        return true;  // 삭제 처리 진행
    } else {
        alert("취소되었습니다.");
        return false; // 삭제 처리 취소
    }
}
</script>

<!-- 자바스크림트 끝 -->

</body>

</html>