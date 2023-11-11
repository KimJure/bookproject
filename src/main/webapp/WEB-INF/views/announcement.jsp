<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ page session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<!-- 헤더 시작 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

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
            
            
    <div class="card shadow mb-4">
    <div class="card-header py-3 d-flex justify-content-between flex-grow-1">
        <h6 class="m-0 font-weight-bold text-primary">공지사항</h6>
        <form method="post" id="keyword" name="keyword" action="announcement">
            <table class="pull-right">
               <tr>
                  <td><select class="form-control" name="sortBy">
                        <option value="0">선택</option>
                        <option value="id">아이디</option>
                        <option value="name">제목</option>
                        <option value="state">유형</option>
                        <option value="authority">작성일</option>
                  </select></td>
                  <td><input type="text" class="form-control"
                     placeholder="검색어 입력" name="keyword" maxlength="100"></td>
                  <td><button type="submit" class="btn btn-success">검색</button></td>
                   <td><a href="${contextPath}/board/boardInsertview" class="btn btn-primary mx-auto" onclick="return loginCheck()">글쓰기</a></td>
                   <c:set var="user" value="${sessionScope.user}" />
               </tr>

            </table>
         </form>
        
        </div>
        <div class="input-group">
    <form id="sortForm" action="announcement" method="post">
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="sortDropdown">
            <a class="dropdown-item" href="#" onclick="handleSortBySelection('defalut')">기본값</a>
            <a class="dropdown-item" href="#" onclick="handleSortBySelection('id')">아이디↑</a>
            <a class="dropdown-item" href="#" onclick="handleSortBySelection('idDesc')">아이디↓</a>
            <a class="dropdown-item" href="#" onclick="handleSortBySelection('title')">제목↑</a>
            <a class="dropdown-item" href="#" onclick="handleSortBySelection('titleDesc')">제목↓</a>
            <a class="dropdown-item" href="#" onclick="handleSortBySelection('regdate')">작성일↑</a>     
            <a class="dropdown-item" href="#" onclick="handleSortBySelection('regdateDesc')">작성일↓</a>
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
               <col style="width: 10%;" />
        <col style="width: 10%;" /> 
        <col style="width: 40%;" />
         <col style="width: 10%;" />
        <col style="width: 10%;" />
        <col style="width: 17%;" />
                <thead>
                    <tr>
                        <th>유형</th>
                        <th>아이디</th>
                        <th>제목</th>
                        <th>조회수</th>
                        <th>좋아요</th>
                        <th>작성일</th>
                    </tr>
                    <c:forEach var="board" items="${announcement}">
                        <tr>
                            <td>
                                <c:choose>
                                    <c:when test="${board.type == 1}">공지</c:when>
                                    <c:when test="${board.type == 2}">자유</c:when>
                                    <c:when test="${board.type == 3}">리뷰</c:when>
                                    <c:otherwise>알 수 없음</c:otherwise>
                                </c:choose>
                            </td>
                            <td>${board.id}</td>
                            <td><a href="boardDetail?bno=${board.bno}" class="button">${board.title}</a></td>
                            <td>${board.viewcnt}</td>
                            <td>${board.likecnt}</td>
                            <td>${board.regdate}</td>
                          
                        </tr>
                    </c:forEach>
                </thead>
            </table>
        </div>
    </div>
     <div class="btn-group">
        <a href="${contextPath}" class="btn btn-primary btn-md">Home</a>
    </div>
</div>
    <!-- 페이징 처리 -->
<div class="pagination">
    <c:choose>
        <c:when test="${currentPage > 1}">
            <a href="${contextPath}/board/announcement?page=${currentPage - 1}&pageSize=${pageSize}">&laquo; 이전</a>
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
                <a href="${contextPath}/board/announcement?page=${pageNum}&pageSize=${pageSize}">${pageNum}</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>
    <c:choose>
        <c:when test="${currentPage < totalPages}">
            <a href="${contextPath}/board/announcement?page=${currentPage + 1}&pageSize=${pageSize}">다음 &raquo;</a>
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
<%-- user 값 사용 --%>
<c:if test="${not empty user}">
  <script>
    function loginCheck() {
    }
  </script>
</c:if>
<c:if test="${empty user}">
  <script>
    function loginCheck() {
      alert("로그인 후 사용 가능합니다.");
      return false;
    }
  </script>
</c:if>
<!-- 자바스크림트 끝 -->

</body>

</html>