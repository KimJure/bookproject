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


                    <!-- Main content -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">로그인</h6>
                        </div>
                        
                        <div class="card-body">
                        <section class="content container-fluid">
					       <div class="box-header with-border">
					         <c:if test="${user==null }">
					         <a href="${contextPath}/login"> <h3 class="box-title">로그인</h3></a>
					         </c:if>
					         <c:if test="${user!=null }">
					         ${user.name }님 환영합니다. <br />
					         <a href="${contextPath}/logOut"> <h3 class="box-title">로그아웃</h3></a>
					         </c:if>
					      </div>
					      <div>${msg}</div>
					         <!--------------------------
					           | Your Page Content Here |
					           -------------------------->
					        <form method="post">
					            아이디 : <input type="text" name="id"><br>
					            비밀번호 : <input type="text" name="pw"><br>
					            <input type="submit" value="로그인">
					        </form>
					    </section>
					    <!-- /.content -->
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

</body>

</html>