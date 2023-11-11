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


    <div class="container">
    <h6 class="m-0 font-weight-bold text-primary">도서추가</h6>
    <form action="${contextPath}/board/bookInsert" method="post">
        <div class="form-row">
            <div class="form-group">
                <label for="bookname">도서 이름</label>
                <input type="text" id="bookname" name="bookname" required placeholder="도서이름을 입력하세요">
            </div>
            <div class="form-group">
                <label for="publishr">출판사</label>
                <input type="text" id="publishr" name="publishr" required placeholder="출판사를 입력하세요">
            </div>
        </div>
        <div class="form-row">
            <div class="form-group">
                <label for="pay">가격</label>
                <input type="number" id="pay" name="pay" required placeholder="가격을 입력하세요">
            </div>
            <div class="form-group">
                <label for="genre">장르</label>
                <select id="genre" name="genre" required>
                    <option value="" disabled selected>장르 선택</option>
                    <option value="comic">만화책</option>
                    <option value="fairy">동화책</option>
                    <option value="novel">소설</option>
                </select>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group">
                <label for="author">저자</label>
                <input type="text" id="author" name="author" required placeholder="저자를 입력하세요">
            </div>
            <div class="form-group">
                <label for="bookmax">책 갯수</label>
                <input type="number" id="bookmax" name="bookmax" required placeholder="책 갯수를 입력하세요">
            </div>
        </div>
        <div class="form-row">
            <div class="form-group">
                <label for="bookorigin">출판지</label>
                <select id="bookorigin" name="bookorigin" required>
                    <option value="" disabled selected>출판지 선택</option>
                    <option value="1">국내</option>
                    <option value="2">국외</option>
                </select>
            </div>
            <div class="form-group">
                <label for="country">나라</label>
                <input type="text" id="country" name="country" disabled placeholder="국외 선택시 입력가능">
            </div>
        </div>
        <div class="form-row">
            <div class="form-group">
                <label for="bookpage">책 페이지</label>
                <input type="number" id="bookpage" name="bookpage" required placeholder="페이지를 입력하세요">
            </div>
            <div class="form-group">
                <label for="bookcomment">줄거리</label>
                <textarea id="bookcomment" name="bookcomment" rows="4" required class="textbox" placeholder="줄거리를 입력하세요"></textarea>
            </div>
        </div>
        <div class="text-center">
                <button type="submit" class="btn btn-primary" onclick="confirmConfirm()">추가</button>
                <a href="${contextPath}/board/adminBook" class="btn btn-secondary" onclick="confirmCancel()">취소</a>
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
        body {
            background-color: #f2f2f2;
            font-family: Arial, sans-serif;
        }

        .container {
            max-width: 700px;
            margin: 0 auto;
            padding: 40px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
        }

        h6 {
            margin-top: 0;
            font-size: 28px;
            color: #333;
            text-align: center;
            margin-bottom: 30px;
        }

        label {
            font-weight: bold;
            color: #555;
            font-size: 18px;
        }

        input[type="text"],
        input[type="number"],
        textarea,
        select {
            width: 100%;
            padding: 14px;
            border: 2px solid #ccc;
            border-radius: 6px;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
            font-size: 16px;
            background-color: #f9f9f9;
            color: #333;
            transition: border-color 0.3s;
        }

        input[type="text"]:focus,
        input[type="number"]:focus,
        textarea:focus,
        select:focus {
            outline: none;
            border-color: #4e6bff;
        }

        select option {
            color: #333;
        }

        .form-group {
            margin-bottom: 30px;
        }

        .form-row {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }

        button[type="submit"],
        .btn {
            background-color: #4e6bff;
            color: #fff;
            border: none;
            border-radius: 6px;
            padding: 14px 28px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-family: Arial, sans-serif;
            font-size: 18px;
            transition-duration: 0.4s;
            cursor: pointer;
            margin-right: 10px;
            box-shadow: 0px 2px 6px rgba(0, 0, 0, 0.3);
        }

        .btn-primary {
            background-color: #ff8c00;
        }

        .btn-primary:hover {
            background-color: #ffac42;
        }

        .btn-secondary {
            background-color: #4e6bff;
        }

        .btn-secondary:hover {
            background-color: #618eff;
        }

        .float-right {
            float: right;
        }

        .text-center {
            text-align: center;
        }
    </style>

    <script>
        window.addEventListener('DOMContentLoaded', function() {
            var publishLocation = document.getElementById('bookorigin');
            var country = document.getElementById('country');
            
            publishLocation.addEventListener('change', function() {
                if (publishLocation.value === '2') {
                    country.disabled = false;
                } else {
                    country.disabled = true;
                    country.value = '';
                }
            });
        });
        
        function confirmConfirm() {
            if (confirm("도서 추가를 하시겠습니까?")) {
                alert("성공적으로 추가 되었습니다.");
                return true;  // 정지 처리 진행
            } else {
                alert("취소되었습니다.");
                return false; // 정지 처리 취소
            }
        }

        function confirmCancel() {
            if (confirm("취소 하시겠습니까?")) {
                alert("취소되었습니다.");
                window.history.back()
                return true;  // 삭제 처리 진행
            } else {
                alert("취소되었습니다.");
                return false; // 삭제 처리 취소
            }
        }
    </script>
<!-- 자바스크림트 끝 -->

</body>

</html>