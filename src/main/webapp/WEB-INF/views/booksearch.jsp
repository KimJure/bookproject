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
$(document)
.ready(
		function() {
			document.getElementById("searchbtn").onclick = function() {

				let searchtype = document
						.getElementsByName("searchtype")[0].value;
				let keyword = document.getElementsByName("keyword")[0].value;

				location.href = "${contextPath}/book/booksearch?num=1"
						+ "&searchtype="
						+ searchtype
						+ "&keyword="
						+ keyword;

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
						도서검색
						<hr>
					</h4>

					<!-- Background Gradient Utilities -->
					<div class="card shadow mb-4">
						<div class="card-body">
							<div class="table-responsive">
								<table id="booktable" class="table table-bordered"
									id="dataTable" width="100%" cellspacing="0"
									style="border: none;">
									<tr>
										<th colspan="6" style="border: none;"></th>
										<th style="border: none;"><select id="searchtype"
											name="searchtype" class="form-control form-control-sm">
												<option value="bookname"
													<c:if test="${searchtype eq 'bookname' ? 'selected':''}"/>>책제목</option>
												<option value="publishr"
													<c:if test="${searchtype eq 'publishr' ? 'selected':''}"/>>출판사</option>
												<option value="author"
													<c:if test="${searchtype eq 'author' ? 'selected':''}"/>>저자</option>
												<option value="genre"
													<c:if test="${searchtype eq 'genre' ? 'selected':''}"/>>장르</option>
										</select></th>
										<th style="border: none;">
											<button class="btn btn-info" type="button"
												onclick="location.href='${contextPath}/book/booksearch?num=1'">
												<i class="fas fa-rotate-right fm-sm"></i>
											</button>
										</th>
										<th colspan="2" style="border: none;">
											<!---->
											<div class="input-group">
												<input type="text"
													class="form-control bg-light border-1 small"
													placeholder="검색" aria-label="Search"
													aria-describedby="basic-addon2" id="keyword" name="keyword"
													value="${page.keyword}">
												<div class="input-group-append">
													<button class="btn btn-primary" type="button"
														id="searchbtn" name="searchbtn" onclick="">
														<i class="fas fa-search fa-sm"></i>
													</button>
												</div>
											</div>
										</th>
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
										<th>대여여부</th>
									</tr>
									<c:forEach var="book" items="${alllist}">
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
											href="${contextPath}/book/booksearch?num=${page.startPageNum - 1}${page.searchtypekeyword}">이전</a>
										</li>

									</c:if>

									<c:forEach begin="${page.startPageNum}"
										end="${page.endPageNum}" var="num">
										<span> <c:if test="${select != num}">
												<li class="paginate_button page-item "><a
													class="page-link"
													href="${contextPath}/book/booksearch?num=${num}${page.searchtypekeyword}">${num}</a></li>
											</c:if> <c:if test="${select == num}">
												<li class="paginate_button page-item active"><a
													class="page-link">${num}</a></li>
											</c:if>
										</span>
									</c:forEach>

									<c:if test="${page.next}">
										<li class="paginate_button page-item next"><a
											class="page-link"
											href="${contextPath}/book/booksearch?num=${page.endPageNum + 1}${page.searchtypekeyword}">다음</a>
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