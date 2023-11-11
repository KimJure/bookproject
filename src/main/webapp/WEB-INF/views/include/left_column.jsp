<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ page session="true"%>
<c:set var="user" value="${sessionScope.user}" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Map" %>
<!-- Nav Item - Pages Collapse Menu -->
<aside class="main-sidebar">
   <!-- Sidebar -->
   <ul
      class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
      id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a
         class="sidebar-brand d-flex align-items-center justify-content-center"
         href="${contextPath}">
         <div class="sidebar-brand-icon rotate-n-15">
            <i class="fas fa-laugh-wink"></i>
         </div>
         <div class="sidebar-brand-text mx-3">
            Woori Books
         </div>
      </a>


      <!-- Nav Item - Dashboard -->
      <li class="nav-item active"><a class="nav-link"
         href="${contextPath}"> <i class="fas fa-fw fa-home"></i>
            <span>Home</span></a></li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">Menu</div>

      <!-- Nav Item - Pages Collapse Menu -->

      <li class="nav-item"><a class="nav-link collapsed" href="#"
         data-toggle="collapse" data-target="#collapseTwo"
         aria-expanded="false" aria-controls="collapseTwo"> <i
            class="fas fa-fw fa-book"></i> <span>도서</span>
      </a>
         <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
            data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
               <h6 class="collapse-header">Books</h6>
               <a href="${contextPath}/book/bestlist" class="collapse-item"
                  href="buttons.html"> 인기도서</a> <a
                  href="${contextPath}/book/newlist" class="collapse-item"
                  href="cards.html">신간도서</a> <a
                  href="${contextPath}/book/origin1list?num=1" class="collapse-item"
                  href="cards.html">국내도서</a> <a
                  href="${contextPath}/book/origin2list?num=1" class="collapse-item"
                  href="cards.html">국외도서</a> <a
                  href="${contextPath}/book/genrelist?num=1" class="collapse-item"
                  href="cards.html">장르별</a>

            </div></li>
      </li>

      <!-- Nav Item - Utilities Collapse Menu -->
      <li class="nav-item"><a class="nav-link collapsed" href="#"
         data-toggle="collapse" data-target="#collapseUtilities"
         aria-expanded="true" aria-controls="collapseUtilities"> <i
            class="fas fa-fw fa-list-alt"></i> <span>게시판</span>
      </a>
         <div id="collapseUtilities" class="collapse"
            aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
               <h6 class="collapse-header">Board</h6>
               <form action="${contextPath}/board/boardList" method="post">
                    <a class="collapse-item" href="${contextPath}/board/boardList">전체게시판</a>
                  </form>
                        <form action="${contextPath}/board/announcement" method="post">
                    <a class="collapse-item" href="${contextPath}/board/announcement">공지사항</a>
                  </form>
                        <a class="collapse-item" href="${contextPath}/board/freeBoard">자유게시판</a>
                        <a class="collapse-item" href="${contextPath}/board/reviewBoard">리뷰게시판</a>


            </div>
         </div></li>
      
      <%
          if(session.getAttribute("user") != null) {
      %>
      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item"><a class="nav-link collapsed" href="#"
         data-toggle="collapse" data-target="#collapsePages"
         aria-expanded="true" aria-controls="collapsePages"> <i
            class="fas fa-fw fa-user"></i> <span>MyPages</span>
      </a>
         <div id="collapsePages" class="collapse"
            aria-labelledby="headingPages" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
               <h6 class="collapse-header">내활동</h6>
               <a class="collapse-item" href="${contextPath}/rental">대여</a> <a
                  class="collapse-item" href="${contextPath}/returnlist">반납</a> <a
                  class="collapse-item" href="${contextPath}/myBoard">내게시글</a> <a
                  class="collapse-item" href="${contextPath}/myReply">내댓글</a>
               <div class="collapse-divider"></div>
               <h6 class="collapse-header">내정보</h6>
               <a class="collapse-item" href="${contextPath}/myUpdate">내정보수정</a> <a
                  class="collapse-item" href="${contextPath}/myHelplist">내문의내역</a> <a
                  class="collapse-item" href="${contextPath}/myDelete">회원탈퇴</a>
            </div>
         </div></li>
            <%
             }
            %>
         
      <li class="nav-item"><a class="nav-link"
         href="${contextPath}/book/booksearch?num=1"> <i
            class="fas fa-fw fa fa-search"></i> <span>도서검색</span>
      </a></li>

       <li class="nav-item">
                <a class="nav-link" href="${contextPath}/board/joinMemberview">
                    <i class="fas fa-fw fa-user-plus"></i>
                    <span>회원가입</span></a>
            </li>
      
      <!-- Nav Item - Tables -->
      <li class="nav-item"><a class="nav-link"
         href="${contextPath}/board/helpBoard"> <i
            class="fas fa-fw fa-question-circle"></i> <span>문의사항</span></a></li>
   
      <!-- Nav Item - Charts -->
            <li class="nav-item">
             <c:if test="${sessionScope.user.authority eq 2}">
                 <a class="nav-link" href="${contextPath}/board/adminHome">
                     <i class="fas fa-fw fa-gear"></i>
                     <span>관리자페이지</span>
                 </a>
             </c:if>
         </li>
      <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">

      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
         <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>


   </ul>

   <script>
      
   </script>
   <!-- End of Sidebar -->
</aside>