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
						신간도서 TOP 3
						<hr>
					</h4>
					<c:forEach var="book" items="${newlist}">
						<c:set var="i" value="${i+1}" />
						<div class="row">
							<div class="col-lg-12">

								<!-- Background Gradient Utilities -->
								<div class="card shadow mb-4">
									<div class="card-header py-3">
										<h6 class="m-0 font-weight-bold text-primary">최신 ${i} 번</h6>
									</div>
									<div class="card-body">
										<div class="table-responsive">
											<table class="table table-bordered" id="dataTable"
												width="100%" cellspacing="0" border="1">
												<thead>
													<tr>
														<th>책제목</th>
														<th>등록일</th>
														<th>출판사</th>
														<th>장르</th>
														<th>저자</th>
														<th>페이지수</th>
														<th>책갯수</th>
														<th>책출판지</th>
														<th>대여여부</th>
													<tr>
												</thead>
												<tbody>
													<tr>
														<td><a href="bookdetail?booknum=${book.booknum}">${book.bookname}</td>
														<td>${book.regdate}</td>
														<td>${book.publishr}</td>
														<td>${book.genre}</td>
														<td>${book.author}</td>
														<td>${book.bookpage}</td>
														<td>${book.bookcnt}/${book.bookmax}</td>
														<td>${book.country}</td>
														<td><c:if test="${book.bookcnt ne 0}">
																<button id="rentalbtn" name="rentalbtn" type="button"
																	class="btn btn-success"
																	onclick="location.href='bookdetail?booknum=${book.booknum}'">대여가능</button>
															</c:if>
															<c:if test="${book.bookcnt eq 0}">
																<button class="btn btn-danger" onclick ="alert('책이 없습니다.')">대여불가</button>
															</c:if></td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
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