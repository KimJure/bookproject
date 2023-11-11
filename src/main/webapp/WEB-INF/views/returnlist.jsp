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
                            <h6 class="m-0 font-weight-bold text-primary">반납내역</h6>
                        </div>
				       
					        <div class="input-group">
					    <form id="sortForm" action="returnlist" method="post">
					        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="sortDropdown">
					           <a class="dropdown-item" href="#" onclick="handleSortBySelection('default')">기본값</a>
					            <a class="dropdown-item" href="#" onclick="handleSortBySelection('rentalnum')">대여번호↑</a>
					            <a class="dropdown-item" href="#" onclick="handleSortBySelection('rentalnumDesc')">대여번호↓</a>
					            <a class="dropdown-item" href="#" onclick="handleSortBySelection('booknum')">책번호↑</a>
					            <a class="dropdown-item" href="#" onclick="handleSortBySelection('booknumDesc')">책번호↓</a>
					            <a class="dropdown-item" href="#" onclick="handleSortBySelection('rentalday')">대여일↑</a>
					            <a class="dropdown-item" href="#" onclick="handleSortBySelection('rentaldayDesc')">대여일↓</a>
					            <a class="dropdown-item" href="#" onclick="handleSortBySelection('returnday')">반납일↑</a>     
					            <a class="dropdown-item" href="#" onclick="handleSortBySelection('returndayDesc')">반납일↓</a>
					        </div>
					        <button class="btn dropdown-toggle" type="button" id="sortDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					            정렬 기준
					        </button>
					        <input type="hidden" name="sortBy" id="sortByInput" value="">
					    </form>
					</div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <colgroup>
								        <col style="width: 10%;" />
								        <col style="width: 8%;" /> 
								        <col style="width: 40%;" />
								         <col style="width: 18%;" />
								        <col style="width: 18%;" />
								       
								    </colgroup>
                                    <thead>
                                        <tr>
                                            <th>대여번호</th>
                                            <th>책번호</th>
                                            <th>책이름</th>
                                            <th>대여일</th>
                                            <th>반납일</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="mypage_book" items="${returnlist}">
                                        <tr>
                                            <td>${mypage_book.rentalnum}</td>
                                            <td>${mypage_book.booknum}</td>
                                            <td><a href="${contextPath}/book/bookdetail?booknum=${mypage_book.booknum}">${mypage_book.bookname}</td>
                                            <td>${mypage_book.rentalday}</td>
                                            <td>${mypage_book.returnday}</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
                
                <!-- 페이징 처리 -->
				<div class="pagination">
				    <c:choose>
				        <c:when test="${currentPage > 1}">
				            <a href="${contextPath}/returnlist?page=${currentPage - 1}&pageSize=${pageSize}">&laquo; 이전</a>
				        </c:when>
				        <c:otherwise>
				            <span class="disabled">&laquo; 이전</span>
				        </c:otherwise>
				    </c:choose>
				    <c:forEach var="pageNum" begin="1" end="${totalPages}">
				        <c:choose>
				            <c:when test="${pageNum == currentPage}">
				                <span class="active">${pageNum}</span>
				            </c:when>
				            <c:otherwise>
				                <a href="${contextPath}/returnlist?page=${pageNum}&pageSize=${pageSize}">${pageNum}</a>
				            </c:otherwise>
				        </c:choose>
				    </c:forEach>
				    <c:choose>
				        <c:when test="${currentPage < totalPages}">
				            <a href="${contextPath}/returnlist?page=${currentPage + 1}&pageSize=${pageSize}">다음 &raquo;</a>
				        </c:when>
				        <c:otherwise>
				            <span class="disabled">다음 &raquo;</span>
				        </c:otherwise>
				    </c:choose>
				</div>
				<!-- 페이징 처리 끝 -->
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

<script>
    // 드롭다운 메뉴에서 항목을 선택했을 때 처리하는 함수
    function handleSortBySelection(sortBy) {
        document.getElementById("sortByInput").value = sortBy;
        document.getElementById("sortForm").submit();
    }
</script>

<script>
  function goToNextPage() {
    document.getElementById("nextPageForm").submit();
  }
</script>
<style>
    /* 페이징 스타일 */
    .pagination {
        display: flex;
        justify-content: center;
        margin-top: 20px;
    }
    .pagination a,
    .pagination span {
        padding: 8px 12px;
        margin-right: 5px;
        text-decoration: none;
        color: #333;
        background-color: #f2f2f2;
        border: 1px solid #ccc;
        border-radius: 4px;
    }
    .pagination a:hover {
        background-color: #e0e0e0;
    }
    .pagination .active {
        background-color: #007bff;
        color: #fff;
    }
    .pagination .disabled {
        pointer-events: none;
        cursor: default;
        background-color: #f2f2f2;
        color: #ccc;
    }
    
    
  /* 폰트 아이콘 스타일링 */
    .fa-hand-point-right {
        color: #4e73df;
    }
    
    /* 테이블 스타일링 */
     .card-body {
        padding: 0;
    }
    .table {
        width: 100%;
        border-collapse: collapse;
    }
    .table th,
    .table td {
        padding: 12px 15px;
        text-align: center;
        border: 1px solid #e3e6f0;
    }
    .table th {
        background-color: #f8f9fc;
        font-weight: bold;
        text-transform: uppercase;
    }
    .table tr:nth-child(even) {
        background-color: #f8f9fc;
    }
    
    /* 정렬 스타일링 */
    

   .dropdown-menu {
     right: 0;
     left: auto;
   }
    
    .input-group {
        display: flex;
        align-items: center;
        justify-content: flex-end;
    }

    .dropdown-menu {
        min-width: 100px;
        border: none;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .dropdown-item {
        padding: 8px 12px;
        font-size: 14px;
        color: #333;
        transition: background-color 0.3s ease;
    }

    .dropdown-item:hover {
        background-color: #f2f2f2;
    }

    .btn {
        background-color: #007bff;
        color: #fff;
        border: none;
        border-radius: 4px;
        padding: 8px 12px;
        font-size: 14px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .btn:hover {
        background-color: #0056b3;
    }
</style>
    
<!-- 자바스크림트 끝 -->

</body>

</html>