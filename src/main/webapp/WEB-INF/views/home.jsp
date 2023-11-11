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
				
						<section class="ftco-section ftco-no-pt">
    	<div class="container-fluid px-md-4">
    		<div class="row justify-content-center pb-5 mb-3">
          <div class="col-md-7 heading-section text-center ftco-animate">
          	<span class="subheading">Books</span>
            <h2>New Release</h2>
          </div>
        </div>
    		<div class="row">
    			<div class="col-md-6 col-lg-4 d-flex">
    				<div class="book-wrap d-lg-flex">
    					<div class="img d-flex justify-content-end" style="background-image: url(${contextPath}/resources/bootstrap/images1/book-1.jpg); width:350px; height:300px;">
    						
    					</div>
    					<div class="text p-4">
    						<h2><a href="${contextPath}/book/bookdetail?booknum=1">역행자</a></h2>
    						<span class="position">By 자청</span>
    					</div>
    				</div>
    			</div>
    			<div class="col-md-6 col-lg-4 d-flex">
    				<div class="book-wrap d-lg-flex">
    					<div class="img d-flex justify-content-end" style="background-image: url(${contextPath}/resources/bootstrap/images1/book-2.jpg); width:350px; height:300px;">
    						
    					</div>
    					<div class="text p-4">
    						<h2><a href="${contextPath}/book/bookdetail?booknum=2">누가 내머리에 똥 쌌어?</a></h2>
    						<span class="position">By 베르너 홀츠바르트 글/볼프 예를브루흐 그림</span>
    					</div>
    				</div>
    			</div>
    			<div class="col-md-6 col-lg-4 d-flex">
    				<div class="book-wrap d-lg-flex">
    					<div class="img d-flex justify-content-end" style="background-image: url(${contextPath}/resources/bootstrap/images1/book-3.jpg); width:350px; height:300px;">
    						
    					</div>
    					<div class="text p-4">
    						<h2><a href="${contextPath}/book/bookdetail?booknum=3">Hopper</a></h2>
    						<span class="position">By Renner, Rolf G</span>
    					</div>
    				</div>
    			</div>

    			<div class="col-md-6 col-lg-4 d-flex">
    				<div class="book-wrap d-lg-flex">
    					<div class="img d-flex justify-content-end" style="background-image: url(${contextPath}/resources/bootstrap/images1/book-4.jpg); width:350px; height:300px;">
    						
    					</div>
    					<div class="text p-4 order-md-first">
    						<h2><a href="${contextPath}/book/bookdetail?booknum=4">아기돼지삼형제</a></h2>
    						<span class="position">By 제이콥스원작/정재은 글/이용선 그림</span>
    					</div>
    				</div>
    			</div>
    			<div class="col-md-6 col-lg-4 d-flex">
    				<div class="book-wrap d-lg-flex">
    					<div class="img d-flex justify-content-end" style="background-image: url(${contextPath}/resources/bootstrap/images1/book-5.jpg); width:350px; height:300px;">
    						
    					</div>
    					<div class="text p-4 order-md-first">
    						<h2><a href="${contextPath}/book/bookdetail?booknum=5">귀멸의 칼날1</a></h2>
    						<span class="position">By 코토게 고요하루 글/그림</span>
    					</div>
    				</div>
    			</div>
    			<div class="col-md-6 col-lg-4 d-flex">
    				<div class="book-wrap d-lg-flex">
    					<div class="img d-flex justify-content-end" style="background-image: url(${contextPath}/resources/bootstrap/images1/book-6.jpg); width:350px; height:300px;">
    						
    					</div>
    					<div class="text p-4 order-md-first">
    						<h2><a href="${contextPath}/book/bookdetail?booknum=6">우리들의 일그러진 영웅</a></h2>
    						<span class="position">By 이문열</span>
    					</div>
    				</div>
    			</div>
    		</div>
    	</div>
    </section>
             <!-- 책 갯수 -->
            <section class="ftco-counter ftco-section ftco-no-pt ftco-no-pb img bg-light" id="section-counter">
       <div class="container">
          <div class="row">
          <div class="col-md-6 col-lg-3 justify-content-center counter-wrap ftco-animate">
            <div class="block-18 py-4 mb-4">
              <div class="text align-items-center">
                <strong class="number" data-number="${totalBookCount}">0</strong>
                <span>책 갯수</span>
              </div>
            </div>
          </div>
          <div class="col-md-6 col-lg-3 justify-content-center counter-wrap ftco-animate">
            <div class="block-18 py-4 mb-4">
              <div class="text align-items-center">
                <strong class="number" data-number="${rentalCount}">0</strong>
                <span>대여중</span>
              </div>
            </div>
          </div>
          <div class="col-md-6 col-lg-3 justify-content-center counter-wrap ftco-animate">
            <div class="block-18 py-4 mb-4">
              <div class="text align-items-center">
                <strong class="number" data-number="${totalBookCount-rentalCount}">0</strong>
                <span>대여가능</span>
              </div>
            </div>
          </div>
          <div class="col-md-6 col-lg-3 justify-content-center counter-wrap ftco-animate">
            <div class="block-18 py-4 mb-4">
              <div class="text align-items-center">
                <strong class="number" data-number="${totalMemberCount}">0</strong>
                <span>회원 수</span>
              </div>
            </div>
          </div>
        </div>
       </div>
    </section>

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