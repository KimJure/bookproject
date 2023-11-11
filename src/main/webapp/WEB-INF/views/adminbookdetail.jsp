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
            
             <title>책 상세조회</title>
 
    <h1>책 상세조회</h1>
    <table>
        <tr>
            <th>책 번호</th>
            <td>${bookDetail.booknum}</td>
        </tr>
          <tr>
            <th>책 이름</th>
           <td>${bookDetail.bookname}</td>
        </tr>
        <tr>
            <th>출판사</th>
            <td>${bookDetail.publishr}</td>
        </tr>
        <tr>
            <th>가격</th>
            <td>${bookDetail.pay}</td>
        </tr>
        <tr>
            <th>장르</th>
            <td>${bookDetail.genre}</td>
        </tr>
        
        <tr>
            <th>총대여횟수</th>
            <td>${bookDetail.bookrentalcnt}</td>
        </tr>
        <tr>
            <th>현재갯수</th>
            <td>${bookDetail.bookcnt}</td>
        </tr>
        <tr>
            <th>총 책갯수</th>
            <td>${bookDetail.bookmax}</td>
            </tr>
        <tr>
            <th>쪽수</th>
            <td>${bookDetail.bookpage}</td>
        </tr>
        <tr>
            <th>줄거리</th>
            <td>${bookDetail.bookcomment}</td>
        </tr>
        <tr>
            <th>국내/국외</th>
            <td>
            <c:choose>
                    <c:when test="${bookDetail.bookorigin == 1}">국내</c:when>
                    <c:when test="${bookDetail.bookorigin == 2}">국외</c:when>
                    <c:otherwise>알 수 없음</c:otherwise>
                </c:choose>
                </td>
        </tr>
        <tr>
            <th>발행지</th>
            <td>${bookDetail.country}</td>
        </tr>
        <tr>
            <th>저자</th>
            <td>${bookDetail.author}</td>
        </tr>
        <tr>
            <th>등록일</th>
            <td>${bookDetail.regdate}</td>
        </tr>
        
    </table>
     <div class="button-container">
    <a href="${contextPath}/board/bookUpdateview?booknum=${bookDetail.booknum}" class="btn update">수정</a>
    
    <form method="post" action="${contextPath}/board/bookDelete?booknum=${bookDetail.booknum}" style="display: inline;" onsubmit="return confirmDelete();">
            <button type="submit" class="btn delete">도서삭제</button>
    </form>
    
    <a href="${contextPath}/board/adminBook" class="btn confirm">확인</a>
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
body {
  font-family: Arial, sans-serif;
  background-color: #f5f5f5;
  margin: 0;
  padding: 20px;
}

h1 {
  color: #333;
  text-align: center;
}

table {
  margin: 20px auto;
  border-collapse: collapse;
  width: 70%;
  max-width: 800px;
  background-color: #fff;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

th,
td {
  padding: 12px;
  text-align: left;
  border-bottom: 1px solid #ddd;
}

th {
  background-color: #f2f2f2;
  font-weight: bold;
  color: #555;
  
}

.button-container {
  text-align: center;
  margin-top: 20px;
}

.btn {
  display: inline-block;
  padding: 10px 20px;
  font-size: 16px;
  border-radius: 4px;
  text-decoration: none;
  margin-right: 10px;
}

.btn.update {
  background-color: #4caf50;
  color: #fff;
}

.btn.delete {
  background-color: #f44336;
  color: #fff;
}

.btn.confirm {
  background-color: #2196f3;
  color: #fff;
}

.btn:hover {
  cursor: pointer;
}

.btn.update:hover {
  background-color: #45a049;
}

.btn.delete:hover {
  background-color: #f32f21;
}

.btn.confirm:hover {
  background-color: #1e87db;
}
    </style>
<script>
function confirmDelete() {
    if (confirm("삭제처리 하시겠습니까?")) {
        alert("해당 도서가 삭제처리되었습니다.");
        return true;  // 정지 처리 진행
    } else {
        alert("취소되었습니다.");
        return false; // 정지 처리 취소
    }
}
</script>

<!-- 자바스크림트 끝 -->

</body>

</html>