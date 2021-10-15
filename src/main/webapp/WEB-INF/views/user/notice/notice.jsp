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
    <script src="https://kit.fontawesome.com/b14e6f064f.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.13/semantic.js"></script>
</head>
<body>
<% if (session.getAttribute("logStatus") == "Y") { %>
<jsp:include page="../header_footer/header_login.jsp">
    <jsp:param name="user" value="${user}"/>
</jsp:include>
<% } %>
<% if (session.getAttribute("logStatus") == null) { %>
<jsp:include page="../header_footer/header_not_login.jsp"></jsp:include>
<% } %>
<main class="has_bg_harp" style="height: 100%;">
    <div class="container" style="height: 100%;">
        <div style="grid-column:1/3; display:flex;flex-direction: column; gap:40px; height: 100%; padding-top: 30px; background-color: #a2b0b36e">
            <a href="#" style="display: flex;justify-content: space-evenly; ">
                <span style=" color: var(--color-river-bed)"><i class="fas fa-bell fa-lg"></i></span>
                <div style=" display:flex;align-items: center; margin-left: 10px; color: var(--color-river-bed)">공지사항
                </div>
            </a>
            <a href="#" style="display: flex;justify-content: space-evenly;">
                <span style="color: var(--color-river-bed)"><i class="fas fa-question fa-lg"></i></span>
                <div style=" display:flex;align-items: center; margin-left: 15px; color: var(--color-river-bed)">질문사항
                </div>
            </a>
        </div>
        <div class="has_flex_end" style="grid-column: 3/13; flex-wrap: wrap; border:1px solid blue;">

            <button class="is_primary has_flex_center"
                    style=" margin-top: 20px;">
                <span style="color: var(--color-river-bed)"><i class="fas fa-pencil-alt fa-lg"></i></span>
                <div class="has_flex_center " style=" margin-left: 15px; color: var(--color-river-bed); font-size: 30px;">
                    질문하기
                </div>
            </button>
            <div class="manager_card"
                 style="display: grid;grid-template-columns:repeat(3,1fr);grid-gap:1rem;border:1px solid gray;width: 100%; ">
                <div class="ui card" style="height: 100%; margin: 0 auto;border:1px solid red; ">
                    <div class="content">
                        <div class="right floated meta">14h</div>
                        <img src="${cardVOlist.avatarimg}"
                             style="border-radius: 50%; width: 3em;height: 3em;object-fit: cover;">
                    </div>
                    <div class="image">
                        <img src="/resources/user/qwer/paintingimg/bitcamp/0.jpg" style="object-fit: cover; height: 250px"></a>
                    </div>
                    <div class="content">
                    <span class="right floated">
                      <i class="heart outline like icon"></i>
                      17 likes
                    </span>
                        <i class="comment icon"></i>
                        3 comments
                    </div>
                    <div class="extra content">
                        <div class="ui large transparent left icon input">
                            <i class="heart outline icon"></i>
                            <input type="text" placeholder="Add Comment...">
                        </div>
                    </div>
                </div>
                <div class="ui card" style="height: 100%; margin: 0 auto;border:1px solid red; ">
                    <div class="content">
                        <div class="right floated meta">14h</div>
                        <img src="${cardVOlist.avatarimg}"
                             style="border-radius: 50%; width: 3em;height: 3em;object-fit: cover;">
                    </div>
                    <div class="image">
                        <img src="/resources/user/qwer/paintingimg/bitcamp/0.jpg" style="object-fit: cover; height: 250px"></a>
                    </div>
                    <div class="content">
                    <span class="right floated">
                      <i class="heart outline like icon"></i>
                      17 likes
                    </span>
                        <i class="comment icon"></i>
                        3 comments
                    </div>
                    <div class="extra content">
                        <div class="ui large transparent left icon input">
                            <i class="heart outline icon"></i>
                            <input type="text" placeholder="Add Comment...">
                        </div>
                    </div>
                </div>
                <div class="ui card" style="height: 100%; margin: 0 auto;border:1px solid red; ">
                    <div class="content">
                        <div class="right floated meta">14h</div>
                        <img src="${cardVOlist.avatarimg}"
                             style="border-radius: 50%; width: 3em;height: 3em;object-fit: cover;">
                    </div>
                    <div class="image">
                        <img src="/resources/user/qwer/paintingimg/bitcamp/0.jpg" style="object-fit: cover; height: 250px"></a>
                    </div>
                    <div class="content">
                    <span class="right floated">
                      <i class="heart outline like icon"></i>
                      17 likes
                    </span>
                        <i class="comment icon"></i>
                        3 comments
                    </div>
                    <div class="extra content">
                        <div class="ui large transparent left icon input">
                            <i class="heart outline icon"></i>
                            <input type="text" placeholder="Add Comment...">
                        </div>
                    </div>
                </div>
                <div class="ui card" style="height: 100%; margin: 0 auto;border:1px solid red; ">
                    <div class="content">
                        <div class="right floated meta">14h</div>
                        <img src="${cardVOlist.avatarimg}"
                             style="border-radius: 50%; width: 3em;height: 3em;object-fit: cover;">
                    </div>
                    <div class="image">
                        <img src="/resources/user/qwer/paintingimg/bitcamp/0.jpg" style="object-fit: cover; height: 250px"></a>
                    </div>
                    <div class="content">
                    <span class="right floated">
                      <i class="heart outline like icon"></i>
                      17 likes
                    </span>
                        <i class="comment icon"></i>
                        3 comments
                    </div>
                    <div class="extra content">
                        <div class="ui large transparent left icon input">
                            <i class="heart outline icon"></i>
                            <input type="text" placeholder="Add Comment...">
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</main>
<jsp:include page="../header_footer/footer.jsp"></jsp:include>
</body>
</html>