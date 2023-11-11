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
<script type="text/javascript">
$(document).ready(function(){
	
	document.getElementById
	document.getElementById("checksearch").onclick = function() {

		let category = document.getElementsByName("category")[0].value;
		let searchtype = document.getElementsByName("searchtype")[0].value;
		let keyword = document.getElementsByName("keyword")[0].value;
		location.href = "${contextPath}/book/genrelist?num=1"
				+ "&searchtype=" + searchtype + "&keyword=" + keyword;
		
		console.log(category)
		console.log(searchtype)
		console.log(keyword)
	};
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
						장르별
						<hr>
					</h4>

					<!-- Background Gradient Utilities -->
					<div class="card shadow mb-4">
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<tr>
										<th colspan="7" style="border: none;"></th>
										<th colspan="2" style="border: none;"><select
											id="keyword" name="keyword"
											class="form-control form-control-sm">
												<option value="동화책"
													<c:if test="${searchtype eq 'genre'}">selected</c:if>>동화책</option>
												<option value="만화책"
													<c:if test="${searchtype eq 'genre'}">selected</c:if>>만화책</option>
												<option value="소설"
													<c:if test="${searchtype eq 'genre'}">selected</c:if>>소설</option>
										</select><input type="hidden" id="searchtype" name="searchtype"
											value="genre"></th>
										<th style="border: none;"><button id="checksearch"
												name="checksearch" class="btn btn-success btn-circle btn-sm">
												<i class="fas fa-check"></i>
											</button></th>
									</tr>
									<tr>
										<th>책 번호</th>
										<th>책 제목</th>
										<th>출판사</th>
										<th>장르</th>
										<th>저자</th>
										<th>페이지수</th>
										<th>등록일</th>
										<th>대여수</th>
										<th>책갯수</th>
										<th align="center">대여여부</th>
									</tr>
									<c:forEach var="book" items="${genrelist}">
										<tr>
											<td>${book.booknum}</td>
											<td><a href="bookdetail?booknum=${book.booknum}">${book.bookname}</td>
											<td>${book.publishr}</td>
											<td>${book.genre}</td>
											<td>${book.author}</td>
											<td>${book.bookpage}</td>
											<td>${book.regdate}</td>
											<td>${book.bookrentalcnt}</td>
											<td>${book.bookcnt}/${book.bookmax}</td>
											<td><c:if test="${book.bookcnt ne 0}">
													<button id="rentalbtn" name="rentalbtn" type="button"
														class="btn btn-success"
														onclick="location.href='bookdetail?booknum=${book.booknum}'">대여가능</button>
												</c:if> <c:if test="${book.bookcnt eq 0}">
													<button class="btn btn-danger" onclick ="alert('책이 없습니다.')">대여불가</button>
												</c:if></td>
										</tr>
									</c:forEach>
								</table>
								<ul class="pagination">
									<c:if test="${page.prev}">
										<li class="paginate_button page-item previous"><a
											class="page-link" id="dataTable_previous"
											href="${contextPath}/book/genrelist?num=${page.startPageNum - 1}${page.searchtypekeyword}">이전</a>
										</li>

									</c:if>

									<c:forEach begin="${page.startPageNum}"
										end="${page.endPageNum}" var="num">
										<span> <c:if test="${select != num}">
												<li class="paginate_button page-item "><a
													class="page-link"
													href="${contextPath}/book/genrelist?num=${num}${page.searchtypekeyword}">${num}</a></li>
											</c:if> <c:if test="${select == num}">
												<li class="paginate_button page-item active"><a
													class="page-link">${num}</a></li>
											</c:if>
										</span>
									</c:forEach>

									<c:if test="${page.next}">
										<li class="paginate_button page-item next"><a
											class="page-link"
											href="${contextPath}/book/genrelist?num=${page.endPageNum + 1}${page.searchtypekeyword}">다음</a>
										</li>
									</c:if>
								</ul>
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