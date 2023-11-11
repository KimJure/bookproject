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
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">회원 탈퇴 하시겠습니까?</h6>
                        </div>
                   
                        <div class="card-body">
                        
                         <div class="my-2"></div>
                          <a href="#" class="btn btn-danger btn-icon-split btn-lg">
                              <span class="icon text-white-50">
                                  <i class="fas fa-exclamation-triangle"></i>
                              </span>
                              <span class="text">회원탈퇴</span>
                          </a>
                            
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

						
						
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

<!-- 스크립트 추가 -->
    <script>
    $(function() {
    	  // 회원탈퇴 버튼을 눌렀을 때 처리
    	  $(".btn-danger").click(function() {
    	    $.ajax({
    	      url: "${pageContext.request.contextPath}/myDelete",
    	      type: "POST",
    	      complete: function(result) {
    	        // 요청 완료 후 항상 실행되는 코드
    	        
    	        // 로그아웃 처리
    	        $.ajax({
    	          url: "${pageContext.request.contextPath}/board/logOut",
    	          type: "GET",
    	          complete: function() {
    	            // 로그아웃 처리 완료 후 실행되는 코드
    	            alert("회원 탈퇴되었습니다.");
    	            location.href = "${contextPath}";  // 원하는 경로로 이동합니다.
    	          }
    	        });
    	      }
    	    });
    	  });
    	});
    </script>
</body>

</html>