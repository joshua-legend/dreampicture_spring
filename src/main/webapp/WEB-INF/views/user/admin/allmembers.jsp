<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/dreampicturesytle.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.13/semantic.min.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        html,body,h1,h2,h3,h4,h5 {font-family: "Raleway", sans-serif}
    </style><meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        html,body,h1,h2,h3,h4,h5 {font-family: "Raleway", sans-serif}
    </style>
    <script src="https://kit.fontawesome.com/b14e6f064f.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
            integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"
            integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.13/semantic.js"></script>
    <script>
        //a태그 마우스오버1
        function mouseOver() {
            document.getElementById('noticeLink').style.backgroundColor = "gray";
            document.getElementById('menuFont').style.color = "white";
            document.getElementById('menuIcon').style.color = "white";
        }

        //a태그 마우스오버
        function mouseOver2() {
            document.getElementById('noticeLink2').style.backgroundColor = "gray";
            document.getElementById('menuFont2').style.color = "white";
            document.getElementById('menuIcon2').style.color = "white";
        }

        //a태그 마우스아웃
        function mouseOut() {
            document.getElementById('noticeLink').style.backgroundColor = "rgba(255,255,255,0)";
            document.getElementById('menuFont').style.color = "var(--color-river-bed)";
            document.getElementById('menuIcon').style.color = "var(--color-river-bed)";
        }

        //a태그 마우스아웃2
        function mouseOut2() {
            document.getElementById('noticeLink2').style.backgroundColor = "rgba(255,255,255,0)";
            document.getElementById('menuFont2').style.color = "var(--color-river-bed)";
            document.getElementById('menuIcon2').style.color = "var(--color-river-bed)";
        }

        function modal() {
            document.getElementById("modaldiv")
        }
    </script>
    <script type="text/javascript">
        showModal = function () {
            $('.ui.modal').modal('show');
        };
        requestQA = function () {
            $(() => {
                let question = document.getElementById("question").value;
                let status = 0; //0~4 까지 질문 종류
                $.ajax({
                    url: "/ajax_request_QA",
                    data: "question=" + question + "&status=" + status,
                    success: function (result) {
                        document.location.href = "/notice";
                    }
                });
            });
        };
    </script>

</head>
<body class="w3-light-grey">

<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
    <div class="w3-container w3-row">
        <div class="w3-col s8 w3-bar" style="text-align: center;margin-left: 50px">
            <span>Welcome, <strong>Master</strong></span><br>
            <button class="ui secondary button" style="height:35px;font-family: 'BMHANNAPro';">
                로그아웃
            </button>
        </div>
    </div>
    <hr>
    <div class="w3-container">
    </div>
    <div class="w3-bar-block">
        <a href="#" class="w3-bar-item w3-button w3-padding-16 w3-hide-large w3-dark-grey w3-hover-black" onclick="w3_close()" title="close menu"><i class="fa fa-remove fa-fw"></i>  Close Menu</a>
        <a href="/admin/main" class="w3-bar-item w3-button w3-padding"><i class="fa fa-bullseye fa-fw"></i>  관리자 메인으로</a>
        <a href="/admin/notice" class="w3-bar-item w3-button w3-padding"><i class="fa fa-bullseye fa-fw"></i>  공지사항</a>
        <a href="/admin/qa" class="w3-bar-item w3-button w3-padding"><i class="fa fa-bullseye fa-fw"></i>  질문사항</a>
        <a href="/admin/salesHistory" class="w3-bar-item w3-button w3-padding"><i class="fa fa-bullseye fa-fw"></i>  판매현황</a>
        <a href="/admin/report" class="w3-bar-item w3-button w3-padding"><i class="fa fa-bullseye fa-fw"></i>  신고내역</a>
        <a href="/admin/blacklist" class="w3-bar-item w3-button w3-padding"><i class="fa fa-bullseye fa-fw"></i>  블랙리스트</a>
        <a href="/admin/allmembers" class="w3-bar-item w3-button w3-padding w3-blue"><i class="fa fa-bullseye fa-fw"></i>  회원현황</a><br><br>
    </div>
</nav>


<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px;margin-top:43px;">

    <!-- Header -->


    <main class="has_bg_harp" style="height: auto;">

        <div class="container" style="height: 100%;margin-left: 200px">

            <div class="has_flex_end" style="grid-column: 1/13; flex-wrap: wrap; margin-top: 20px;margin-bottom: 20px;">

                <div style="text-align: center;margin-right: 420px;font-family: 'BMHANNAPro';font-size: var(--font-size-xlll);color:var(--color-chathams-blue) ">전체 회원현황</div>

                <div class="manager_card" style="display: grid;grid-template-columns:repeat(4,1fr);grid-gap:1rem;width: 100%;">
                    <div class="ui card">
                        <div class="image">
                            <img src="/images/avatar2/large/kristy.png">
                        </div>
                        <div class="content">
                            <a class="header"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">크리스티</font></font></a>
                            <div class="meta">
                                <span class="date"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">2013년에 합류</font></font></span>
                            </div>
                            <div class="description"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                                Kristy는 뉴욕에 거주하는 아트 디렉터입니다.
                            </font></font></div>
                        </div>
                        <div class="extra content">
                            <a>
                                <i class="user icon"></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                                22 친구
                            </font></font></a>
                        </div>
                    </div>
                    <div class="ui card">
                        <div class="image">
                            <img src="/images/avatar2/large/kristy.png">
                        </div>
                        <div class="content">
                            <a class="header"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">크리스티</font></font></a>
                            <div class="meta">
                                <span class="date"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">2013년에 합류</font></font></span>
                            </div>
                            <div class="description"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                                Kristy는 뉴욕에 거주하는 아트 디렉터입니다.
                            </font></font></div>
                        </div>
                        <div class="extra content">
                            <a>
                                <i class="user icon"></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                                22 친구
                            </font></font></a>
                        </div>
                    </div>
                    <div class="ui card">
                        <div class="image">
                            <img src="/images/avatar2/large/kristy.png">
                        </div>
                        <div class="content">
                            <a class="header"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">크리스티</font></font></a>
                            <div class="meta">
                                <span class="date"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">2013년에 합류</font></font></span>
                            </div>
                            <div class="description"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                                Kristy는 뉴욕에 거주하는 아트 디렉터입니다.
                            </font></font></div>
                        </div>
                        <div class="extra content">
                            <a>
                                <i class="user icon"></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                                22 친구
                            </font></font></a>
                        </div>
                    </div>
                    <div class="ui card">
                        <div class="image">
                            <img src="/images/avatar2/large/kristy.png">
                        </div>
                        <div class="content">
                            <a class="header"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">크리스티</font></font></a>
                            <div class="meta">
                                <span class="date"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">2013년에 합류</font></font></span>
                            </div>
                            <div class="description"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                                Kristy는 뉴욕에 거주하는 아트 디렉터입니다.
                            </font></font></div>
                        </div>
                        <div class="extra content">
                            <a>
                                <i class="user icon"></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                                22 친구
                            </font></font></a>
                        </div>
                    </div>

                    </div>
                </div>
            </div>
        </div>
    </main>


    <!-- End page content -->

</div>

<script>
    // Get the Sidebar
    var mySidebar = document.getElementById("mySidebar");

    // Get the DIV with overlay effect
    var overlayBg = document.getElementById("myOverlay");

    // Toggle between showing and hiding the sidebar, and add overlay effect
    function w3_open() {
        if (mySidebar.style.display === 'block') {
            mySidebar.style.display = 'none';
            overlayBg.style.display = "none";
        } else {
            mySidebar.style.display = 'block';
            overlayBg.style.display = "block";
        }
    }

    // Close the sidebar with the close button
    function w3_close() {
        mySidebar.style.display = "none";
        overlayBg.style.display = "none";
    }
</script>

</body>
</html>