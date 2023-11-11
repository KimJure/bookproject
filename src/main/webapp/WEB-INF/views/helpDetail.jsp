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
				
				
  <!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
<h1 class="h3 mb-2 text-gray-800"></h1>


                    <!-- Main content -->
                    <div class="container">
				    <h2>문의답변</h2>
				    <form action="${contextPath}/helpDetail?hno=${helpDetail.hno}">
				      <label for="id">아이디</label>
				      <input type="text" id="id" name="id" value="${helpDetail.id}" readonly="readonly">
				
				      <label for="title">제목</label>
				      <input type="text" id="title" name="title" value="${helpDetail.title}" readonly="readonly">
				
				      <label for="content">내용</label>
				      <textarea id="content" name="content" readonly="readonly">${helpDetail.content}</textarea>
				      
				       <label for="content">답변내용</label>
				      <textarea id="recomment" name="recomment" readonly="readonly">${helpDetail.recomment}</textarea>
				      <div class="btn-container">
				    <a href="${contextPath}/myHelplist" class="btn btn-primary">목록</a>
				    
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
      .container {
        max-width: 500px;
        margin: 0 auto;
        padding: 30px;
        background-color: #f8f8f8;
        border-radius: 10px;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        position: relative; /* 추가 */
      }
      
      h2 {
        text-align: center;
        color: #333;
        font-family: 'Arial', sans-serif;
        margin-bottom: 30px;
      }
      
      form {
        margin-top: 20px;
      }
      
      label {
        display: block;
        margin-bottom: 15px;
        color: #666;
        font-weight: bold;
        font-family: 'Arial', sans-serif;
      }
      
      input[type="text"],
      textarea {
        width: 100%;
        padding: 15px;
        border: 1px solid #ccc;
        border-radius: 6px;
        margin-bottom: 20px;
        font-family: 'Arial', sans-serif;
      }
      
      input[type="text"]::placeholder,
      textarea::placeholder {
        color: #999;
      }
      
      .container:before {
        content: "";
        position: absolute;
        top: -15px;
        left: 50%;
        transform: translateX(-50%);
        width: 30px;
        height: 30px;
        background-color: #ff4081;
        border-radius: 50%;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
      }
      
      .container:after {
        content: "";
        position: absolute;
        top: -8px;
        left: 50%;
        transform: translateX(-50%);
        width: 14px;
        height: 14px;
        background-color: #fff;
        border-radius: 50%;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
      }
      
      .btn-container {
  text-align: center;
  margin-top: 20px;
}

.btn-submit, .btn-primary {
  display: inline-block;
  padding: 10px 20px;
  font-size: 16px;
  font-weight: bold;
  text-align: center;
  text-decoration: none;
  background-image: linear-gradient(45deg, #FF4081, #E91E63, #2196F3);
  background-size: 200% auto;
  color: white;
  border: none;
  border-radius: 50px;
  cursor: pointer;
  box-shadow: 0px 6px 10px rgba(0, 0, 0, 0.3);
  transition: all 0.3s ease;
}

.btn-submit:hover, .btn-primary:hover {
  background-position: right center;
  box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.5);
  transform: translateY(-2px);
}

.btn-primary {
  background-image: linear-gradient(45deg, #E91E63, #2196F3, #4CAF50);
}

.btn-primary:hover {
  background-position: right center;
  box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.5);
  transform: translateY(-2px);
}


     
</style>
<!-- 자바스크림트 끝 -->

</body>

</html>