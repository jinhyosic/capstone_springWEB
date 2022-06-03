<%--
  Created by IntelliJ IDEA.
  User: jimhyosic
  Date: 2022-06-02
  Time: 오후 5:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Raspberry Pi, Nas</title>
</head>
<body>
<!-- 폰트어썸 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<link rel="stylesheet" href="css/customcss.css">

<!-- 반응형 필수 -->
<meta name="viewport" content="width=device-width, user-scalable=no" />

<!-- 제이쿼리 불러오기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="js/customjs.js"></script>

<!-- 사이트 박스 시작 -->
<section class="site-box min-height-100vh flex flex-column">

  <!-- 탑 헤더 시작//로그인전 -->
  <section class="head-bar-section visible-md-up head-nav nav-down">
    <div class="head-bar con flex flex-jc-fe">
      <c:if test="${isLogined}">
        <div class="head-bar-button"><a href="customLogin.jsp">Home</a></div>
        <div class="head-bar-button"><a href="customLogin.jsp">Login</a></div>
        <div class="head-bar-button"><a href="signup.jsp">Sign Up</a></div>
      </c:if>
    </div>
  </section>
  <!-- 탑 헤더 끝 -->
  <!-- 탑바 시작 -->
  <div class="top-bar-padding visible-md-up head-nav nav-down">
  </div>
  <header class="top-bar visible-md-up head-nav nav-down">
    <div class="con height-100p flex flex-jc-sb flex-ai-c">
      <div class="title head-nav nav-down">
        <a href="../home/main">
           <span>Raspberry Pi, NAS</span>
        </a>
      </div>
      <!-- 메뉴바 시작-->
      <section class="menu-bar height-100p">
        <nav class="menu-bar_menu height-100p">
          <ul class="flex flex-ai-fe height-100p ">
            <li title="NOTICE">
              <a href="../article/list?boardId=1" class="block">
                <span>NOTICE</span>
              </a>
            </li>
            <li>
              <a class="block">
                <span>BOARD</span>
              </a>
              <ul>
                <li title="NEWS">
                  <a href="../article/list?boardId=2" class="block">
                    <span>NEWS</span>
                  </a>
                </li>
                <li title="FREE">
                  <a href="../article/list?boardId=3" class="block">
                    <span>FREE</span>
                  </a>
                </li>
              </ul>
            </li>
            <li title="SEARCH">
              <a href="search.html" class="block">
                <span>SEARCH</span>
              </a>
            </li>
            <li>
              <a class="block">
                <span>LINK</span>
              </a>
              <ul>
                <li title="T-STORY">
                  <a href="https://cjy324.tistory.com/" target="_blank" class="block">
                    <span>T-STORY</span>
                  </a>
                </li>
                <li title="GITHUB">
                  <a href="https://github.com/cjy324/TIL_Jooyoung#til_jooyoung" target="_blank" class="block">
                    <span>GITHUB</span>
                  </a>
                </li>
              </ul>
            </li>
          </ul>
        </nav>
      </section>
      <!-- 메뉴바 끝 -->
    </div>
  </header>
  <!-- 탑바 끝 -->

  <!-- 모바일 탑바 시작 -->
  <section class="mobile-top-bar-padding flex flex-ai-c visible-sm-down">
    <div class="mobile-top-bar_btn-toggle-side-bar flex-as-c visible-sm-down">
      <div></div>
      <div></div>
      <div></div>
    </div>
  </section>
  <header class="mobile-top-bar flex visible-sm-down">
    <div class="flex-1-0-0 flex flex-jc-c flex-ai-c">
      <div class="mobile-title">
        <a href="../home/main">
           <span>Raspberry Pi, NAS</span>
        </a>
      </div>
    </div>
  </header>
  <!-- 모바일 탑바 끝 -->
  <!-- 모바일 사이드메뉴바 시작-->
  <aside class="mobile-side-bar flex flex-column flex-jc-c visible-sm-down">
    <span>MENU</span>
    <nav class="mobile-side-bar_menu flex flex-jc-c">
      <ul class="">
        <li title="NOTICE">
          <a href="../article/list?boardId=1" class="block">
            <span>NOTICE</span>
          </a>
        </li>
        <li>
          <a class="block">
            <span>BOARD</span>
          </a>
          <ul class="hide">
            <li title="NEWS">
              <a href="../article/list?boardId=2" class="block">
                <span>NEWS</span>
              </a>
            </li>
            <li title="FREE">
              <a href="../article/list?boardId=3" class="block">
                <span>FREE</span>
              </a>
            </li>
          </ul>
        </li>
        <li title="SEARCH">
          <a href="search.html" class="block">
            <span>SEARCH</span>
          </a>
        </li>
        <li>
          <a class="block">
            <span>LINK</span>
          </a>
          <ul class="hide">
            <li title="T-STORY">
              <a href="https://cjy324.tistory.com/" target="_blank" class="block">
                <span>T-STORY</span>
              </a>
            </li>
            <li title="GITHUB">
              <a href="https://github.com/cjy324/TIL_Jooyoung#til_jooyoung" target="_blank" class="block">
                <span>GITHUB</span>
              </a>
            </li>
          </ul>
        </li>
      </ul>
    </nav>
    <div class="mobile-side-bar_menu flex flex-jc-c">
      <!--로그인시 메뉴-->
      <c:if test="${isLogined}">
        <div class="mobile-side-bar-button"><a href="../home/main"><i class="fas fa-home"></i>Home</a></div>
        <!--<div class="mobile-side-bar-button"><a href="../member/showMyPage"><i class="fas fa-user-cog"></i></a></div>-->
        <div class="mobile-side-bar-button"><a href="../member/doLogout"><i class="fas fa-sign-out-alt"></i>Logout</a></div>
      </c:if>
    </div>
  </aside>
  <!-- 모바일 사이드메뉴바 끝 -->

  <!-- 메인 컨텐츠 박스 시작 -->
  <main class="main-box flex-grow-1 visible-md-up">
    <section class="main-box-section con">
      <!-- 로그인 페이지 시작 -->
      <div class="section-login min-height-50vh flex flex-jc-c flex-ai-c">
        <form name="form" onsubmit="check(this); return false;" action="loginAction.jsp" method="POST">
          <input type="hidden" name="loginPwReal">
          <div class="login-title">
            LOGIN
          </div>
          <div class="login_cell__title">
            <span>ID</span>
          </div>
          <div class="login_cell__body">
            <input type="text" name="loginId" maxlength="50" placeholder="ID">
          </div>
          <div class="login_cell__title">
            <span>PW</span>
          </div>
          <div class="login_cell__body">
            <input type="password" name="loginPw" maxlength="50" placeholder="Password">
          </div>
          <div class="loginInput_cell">
            <div>
              <button class="btn btn-go" type="submit"><i class="fas fa-sign-in-alt"></i> Login</button>
              <button class="btn btn-back" type="button" onclick="history.back();"><i class="fas fa-undo"></i> Sign Up</button>
            </div>

          </div>
        </form>
      </div>
      <!-- 로그인 페이지 끝 -->
    </section>
  </main>
  <!-- 메인 컨텐츠 박스 끝 -->


  <!-- 모바일-메인 컨텐츠 박스 시작 -->
  <main class="main-box flex-grow-1 visible-sm-down">
    <section class="main-box-section con">
      <!-- 모바일-로그인 페이지 시작 -->
      <div class="mobile-section-login min-height-50vh flex flex-jc-c flex-ai-c">

        <form name="form" onsubmit="check(this); return false;" action="loginAction.jsp" method="POST">
          <input type="hidden" name="loginPwReal">
          <div class="mobile-login-title">
            LOGIN
          </div>
          <div class="mobile-login_cell__title">
            <span>ID</span>
          </div>
          <div class="mobile-login_cell__body">
            <input type="text" name="loginId" maxlength="50" placeholder="ID">
          </div>
          <div class="mobile-login_cell__title">
            <span>PW</span>
          </div>
          <div class="mobile-login_cell__body">
            <input type="password" name="loginPw" maxlength="50" placeholder="Password">
          </div>
          <div class="mobile-loginInput_cell">
            <div>
              <button class="btn btn-go" type="submit"><i class="fas fa-sign-in-alt"></i>Login</button>
              <button class="btn btn-back" type="button" onclick="history.back();"><i class="fas fa-undo"></i>Sign Up</button>
            </div>

          </div>
        </form>
      </div>
      <!-- 모바일-로그인 페이지 끝 -->
    </section>
  </main>
  <!-- 모바일-메인 컨텐츠 박스 끝 -->


  <!-- 맨 위 버튼 시작 -->
  <nav class="top-button btn flex flex-jc-c flex-ai-c">
    <div class="">
      <a href="#header"><i class="fas fa-chevron-up"></i></a>
    </div>
  </nav>
  <!-- 맨 위 버튼 끝 -->


  <!-- 맨 아래 버튼 시작 -->
  <nav class="bottom-button btn flex flex-jc-c flex-ai-c">
    <div class="">
      <a href="#bottom"><i class="fas fa-chevron-down"></i></a>
    </div>
  </nav>
  <!-- 맨 아래 버튼 끝 -->


  <!-- 푸터 시작 -->
  <footer id="bottom" class="bottom-bar con-min-width visible-md-up">
    <div class="con flex flex-ai-c">
      <div class="bottom-bar__site-info">
        <span><i class="far fa-envelope"></i> juy32400@gmail.com</span>
        <br>
        <br>
        <span>COPYRIGHT 2020. Dev_J. All rights reserved.</span>
      </div>
    </div>
  </footer>
  <!-- 푸터 끝 -->
  <!-- 모바일-푸터 시작 -->
  <footer class="mobile-bottom-bar con-min-width visible-sm-down">
    <div class="con flex flex-ai-c">
      <div class="bottom-bar__site-info">
        <span><i class="far fa-envelope"></i> juy32400@gmail.com</span>
        <br>
        <br>
        <span>COPYRIGHT 2020. Dev_J. All rights reserved.</span>
      </div>
    </div>
  </footer>
  <!-- 모바일-푸터 끝 -->
</section>
<!-- 사이트 박스 끝 -->
</body>
</html>
