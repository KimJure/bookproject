<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="user" value="${sessionScope.user}" />
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
<%-- user 값 사용 --%>
<c:if test="${not empty user}">
</c:if>
<!-- 오른쪽 상단 아이콘들 시작 -->
<div id="content-wrapper" class="d-flex flex-column">

   <!-- Main Content -->
   <div id="content">

      <!-- Topbar -->
      <nav
         class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

         <!-- Sidebar Toggle (Topbar) -->
         <button id="sidebarToggleTop"
            class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
         </button>
         <!-- 오른쪽 상단 아이콘들 끝 -->

         <!-- 상단 검색창 시작 -->
         <select id="searchtype" name="searchtype"
            class="form-control form-control-sm" style="width: 140px">
            <option value="bookname"
               <c:if test="${searchtype eq 'bookname' ? 'selected':''}"/>>책제목</option>
            <option value="publishr"
               <c:if test="${searchtype eq 'publishr' ? 'selected':''}"/>>출판사</option>
            <option value="author"
               <c:if test="${searchtype eq 'author' ? 'selected':''}"/>>저자</option>
            <option value="genre"
               <c:if test="${searchtype eq 'genre' ? 'selected':''}"/>>장르</option>
         </select>
         <div class="input-group" style="width: 400px">
            <input type="text" class="form-control bg-light border-1 small"
               placeholder="검색" aria-label="Search"
               aria-describedby="basic-addon2" id="keyword" name="keyword"
               value="${page.keyword}">
            <div class="input-group-append">
               <button class="btn btn-primary" type="button" id="searchbtn"
                  name="searchbtn" onclick="">
                  <i class="fas fa-search fa-sm"></i>
               </button>
            </div>
         </div>
         <!-- 상단 검색창 끝 -->

         <!-- 상단 오른쪽 버튼툴 시작 -->
         <!-- Topbar Navbar -->
         <ul class="navbar-nav ml-auto">

            <!-- Nav Item - Search Dropdown (Visible Only XS) -->
            <li class="nav-item dropdown no-arrow d-sm-none"><a
               class="nav-link dropdown-toggle" href="#" id="searchDropdown"
               role="button" data-toggle="dropdown" aria-haspopup="true"
               aria-expanded="false"> <i class="fas fa-search fa-fw"></i>
            </a> <!-- Dropdown - Messages -->
               <div
                  class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                  aria-labelledby="searchDropdown">
                  <form class="form-inline mr-auto w-100 navbar-search">
                     <div class="input-group">
                        <input type="text" class="form-control bg-light border-0 small"
                           placeholder="Search for..." aria-label="Search"
                           aria-describedby="basic-addon2">
                        <div class="input-group-append">
                           <button class="btn btn-primary" type="button">
                              <i class="fas fa-search fa-sm"></i>
                           </button>
                        </div>
                     </div>
                  </form>
               </div></li>
            <!-- 상단 오른쪽 버튼툴 끝 -->

            <!-- 오른쪽 상단 종모양 시작 -->
            <!-- Nav Item - Alerts -->
            <li class="nav-item dropdown no-arrow mx-1"><a
               class="nav-link dropdown-toggle" href="#" id="alertsDropdown"
               role="button" data-toggle="dropdown" aria-haspopup="true"
               aria-expanded="false"> <i class="fas fa-bell fa-fw"></i> <!-- Counter - Alerts -->
                  <span class="badge badge-danger badge-counter">3+</span>
            </a> <!-- Dropdown - Alerts -->
               <div
                  class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                  aria-labelledby="alertsDropdown">
                  <h6 class="dropdown-header">Alerts Center</h6>
                  <a class="dropdown-item d-flex align-items-center" href="#">
                     <div class="mr-3">
                        <div class="icon-circle bg-primary">
                           <i class="fas fa-file-alt text-white"></i>
                        </div>
                     </div>
                     <div>
                        <div class="small text-gray-500">December 12, 2019</div>
                        <span class="font-weight-bold">A new monthly report is
                           ready to download!</span>
                     </div>
                  </a> <a class="dropdown-item d-flex align-items-center" href="#">
                     <div class="mr-3">
                        <div class="icon-circle bg-success">
                           <i class="fas fa-donate text-white"></i>
                        </div>
                     </div>
                     <div>
                        <div class="small text-gray-500">December 7, 2019</div>
                        $290.29 has been deposited into your account!
                     </div>
                  </a> <a class="dropdown-item d-flex align-items-center" href="#">
                     <div class="mr-3">
                        <div class="icon-circle bg-warning">
                           <i class="fas fa-exclamation-triangle text-white"></i>
                        </div>
                     </div>
                     <div>
                        <div class="small text-gray-500">December 2, 2019</div>
                        Spending Alert: We've noticed unusually high spending for your
                        account.
                     </div>
                  </a> <a class="dropdown-item text-center small text-gray-500" href="#">Show
                     All Alerts</a>
               </div></li>
            <!-- 오른쪽 상단 종모양 끝 -->

            <!-- 오른쪽 상단 메세지모양 시작 -->
            <!-- Nav Item - Messages -->
            <li class="nav-item dropdown no-arrow mx-1"><a
               class="nav-link dropdown-toggle" href="#" id="messagesDropdown"
               role="button" data-toggle="dropdown" aria-haspopup="true"
               aria-expanded="false"> <i class="fas fa-envelope fa-fw"></i> <!-- Counter - Messages -->
                  <span class="badge badge-danger badge-counter">7</span>
            </a> <!-- Dropdown - Messages -->
               <div
                  class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                  aria-labelledby="messagesDropdown">
                  <h6 class="dropdown-header">Message Center</h6>
                  <a class="dropdown-item d-flex align-items-center" href="#">
                     <div class="dropdown-list-image mr-3">
                        alt="...">
                        <div class="status-indicator bg-success"></div>
                     </div>
                     <div class="font-weight-bold">
                        <div class="text-truncate">Hi there! I am wondering if you
                           can help me with a problem I've been having.</div>
                        <div class="small text-gray-500">Emily Fowler · 58m</div>
                     </div>
                  </a> <a class="dropdown-item d-flex align-items-center" href="#">
                     <div class="dropdown-list-image mr-3">
                        alt="...">
                        <div class="status-indicator"></div>
                     </div>
                     <div>
                        <div class="text-truncate">I have the photos that you
                           ordered last month, how would you like them sent to you?</div>
                        <div class="small text-gray-500">Jae Chun · 1d</div>
                     </div>
                  </a> <a class="dropdown-item d-flex align-items-center" href="#">
                     <div class="dropdown-list-image mr-3">
                        alt="...">
                        <div class="status-indicator bg-warning"></div>
                     </div>
                     <div>
                        <div class="text-truncate">Last month's report looks
                           great, I am very happy with the progress so far, keep up the
                           good work!</div>
                        <div class="small text-gray-500">Morgan Alvarez · 2d</div>
                     </div>
                  </a> <a class="dropdown-item d-flex align-items-center" href="#">
                     <div class="dropdown-list-image mr-3">
                        <img class="rounded-circle"
                           src="https://source.unsplash.com/Mv9hjnEUHR4/60x60" alt="...">
                        <div class="status-indicator bg-success"></div>
                     </div>
                     <div>
                        <div class="text-truncate">Am I a good boy? The reason I
                           ask is because someone told me that people say this to all
                           dogs, even if they aren't good...</div>
                        <div class="small text-gray-500">Chicken the Dog · 2w</div>
                     </div>
                  </a> <a class="dropdown-item text-center small text-gray-500" href="#">Read
                     More Messages</a>
               </div></li>

            <div class="topbar-divider d-none d-sm-block"></div>

            <!-- 오른쪽 상단 메세지 모양 끝 -->

            <!-- 오른쪽 상단 프로필 시작 -->
            <!-- Nav Item - User Information 
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">Douglas McGee</span>
                                <img class="img-profile rounded-circle"
                                    src="${contextPath}/resources/bootstrap/img/undraw_profile.svg">
                            </a>
                            
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Profile
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Settings
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Activity Log
                                </a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Logout
                                </a>
                            </div>
                        </li>

                    </ul>-->
            <li class="nav-item dropdown no-arrow">
               <div class="nav-link dropdown-toggle" id="userDropdown">
                  <span class="mr-2 d-none d-lg-inline text-gray-600 small">
                     <c:choose>
                        <c:when test="${not empty user}">
                           <a href="#">${user.id}</a>&nbsp;<br />
                           <a href="${contextPath}/board/logOut">로그아웃</a>
                        </c:when>
                        <c:otherwise>
                           <a href="${contextPath}/board/loginForm">로그인</a>
                        </c:otherwise>
                     </c:choose>
                  </span> <img class="img-profile rounded-circle"
                     src="${contextPath}/resources/bootstrap/img/undraw_profile.svg">
               </div>
            </li>
            <!-- Dropdown - User Information -->
            </li>
      </nav>
      <!-- 오른쪽 상단 사람모양 끝 -->

      <!-- End of Topbar -->