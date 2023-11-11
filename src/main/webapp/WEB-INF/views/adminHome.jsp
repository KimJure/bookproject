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
				
<style>
    html, body {
        align-items: center;
        justify-content: center;
    }

    /* 박스 컨테이너 스타일 */
    .box-container {
        display: flex;
        justify-content: center;
        margin-top: 20px;
        flex-wrap: wrap;
        max-width: 800px;
        margin: 0 auto;
    }

    .box {
        width: 180px;
        text-align: center;
        margin-bottom: 20px;
        background-color: #f5f5f5;
        border-radius: 10px;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        transition: transform 0.3s ease;
    }

    .box:hover {
        transform: translateY(-15px);
    }

    .box a {
        display: block;
        text-decoration: none;
        color: #333;
        margin-top: 10px;
    }

    .box img {
        width: 100%;
        height: auto;
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
    }

    .box p {
        margin: 0;
        padding: 10px;
        background-color: #fff;
        font-size: 14px;
        font-weight: bold;
        border-bottom-left-radius: 10px;
        border-bottom-right-radius: 10px;
    }
</style>
<style>
.box-container {
  display: flex;
  justify-content: space-around;
  align-items: center;
  flex-wrap: wrap;
  max-width: 1000px;
  margin: 0 auto;
}

.box {
  width: 180px;
  text-align: center;
  margin-bottom: 20px;
  background-color: #f5f5f5;
  border-radius: 10px;
  box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
  transition: transform 0.3s ease;
}

.box:hover {
  transform: translateY(-15px);
}

.box a {
  display: block;
  text-decoration: none;
  color: #333;
  margin-top: 10px;
}

.box img {
  width: 100%;
  height: auto;
  border-top-left-radius: 10px;
  border-top-right-radius: 10px;
}

.box p {
  margin: 0;
  padding: 10px;
  background-color: #fff;
  font-size: 14px;
  font-weight: bold;
  border-bottom-left-radius: 10px;
  border-bottom-right-radius: 10px;
}
</style>
	
	<table>
      <div class="box-container">
  <div class="box">
  <form id="userSerch" action="userSerch" method="post">
    <a href="#" onclick="document.getElementById('userSerch').submit(); return false;">
      <img src="${contextPath}/resources/bootstrap/img/userList.jpg" alt="userList">
      <p>회원관리</p>
    </a>
    <noscript>
      <input type="submit" value="전체회원조회">
    </noscript>
  </form>
</div>

  <div class="box">
  <form id="adminBoard" action="adminBoard" method="POST">
    <a href="#" onclick="document.getElementById('adminBoard').submit(); return false;">
      <img src="${contextPath}/resources/bootstrap/img/adminBoard.png" alt="userSerch">
      <p>게시판관리</p>
    </a>
    <noscript>
      <input type="submit" value="게시판관리">
    </noscript>
  </form>
</div>
  
  
  <div class="box">
  <form id="adminBook" action="adminBook" method="POST">
    <a href="#" onclick="document.getElementById('adminBook').submit(); return false;">
      <img src="${contextPath}/resources/bootstrap/img/adminBook.png" alt="adminBook">
      <p>도서관리</p>
    </a>
    <noscript>
      <input type="submit" value="도서관리">
    </noscript>
  </form>
</div>
  
  
  <div class="box">
  <form id="adminHelp" action="adminHelp" method="POST">
    <a href="#" onclick="document.getElementById('adminHelp').submit(); return false;">
      <img src="${contextPath}/resources/bootstrap/img/FAQ.png" alt="adminHelp">
      <p>문의사항</p>
    </a>
    <noscript>
      <input type="submit" value="문의사항">
    </noscript>
  </form>
</div>
</div>
</table>

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

<!-- 자바스크림트 끝 -->

</body>

</html>