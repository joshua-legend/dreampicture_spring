<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
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
    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
            integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script>
        let emailChecked = false;
        let telChecked = false;

        $(()=>{
            $("#email_btn").click(function(){
                let email = document.getElementById("email").value;
                $.ajax({
                    url:"/ajax_email_check",
                    data: "email="+email,
                    success:function(result){
                        if(result =='Y'){
                            document.getElementById("email_btn").innerText = "인증완료";
                            document.getElementById("email").setAttribute("disabled",true);
                            document.getElementById("email_btn").setAttribute("disabled",true);
                            document.getElementById("email_btn").style="background-color:gray";
                            emailChecked=true;
                            if(emailChecked && telChecked) document.getElementById("next_btn").removeAttribute("disabled");
                        }
                    }
                });
            });
        });
        $(()=>{
            $("#tel_btn").click(function(){
            let tel = document.getElementById("tel").value;
            $.ajax({
                url:"/ajax_tel_check",
                data: "tel="+tel,
                success:function(result){
                    if(result =='Y'){
                        document.getElementById("tel_btn").innerText = "인증완료";
                        document.getElementById("tel").setAttribute("disabled",true);
                        document.getElementById("tel_btn").setAttribute("disabled",true);
                        document.getElementById("tel_btn").style="background-color:gray";
                        telChecked=true;
                        if(emailChecked && telChecked) document.getElementById("next_btn").removeAttribute("disabled");
                    }
                }
            });
        });
        });
    </script>
</head>
<body>
<jsp:include page="../header_footer/header_not_login.jsp"></jsp:include>
<main class="has_bg_harp">
    <div class="container">
        <div class="contents" style="grid-column: 5/9; margin-top: 50px; gap:30px; ">
            <form action="<%=conPath%>/register2" method="post">
                <div style="display: flex;user-select: auto;flex-direction: column;align-items: center;justify-content: space-evenly;height: 650px;">
                    <div class="title">회원 가입</div>
                        <div class="has_flex_left">
                            이메일*
                            <input type="text" class="is_login_input  has_width_full" name="email" id="email" required="required" placeholder="이메일" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2, 4}$"/>
                        </div>
                        <button id="email_btn" class='button is_primary'>인증하기</button>
                        <div class="has_flex_left">
                        <div>비밀번호 *<span class="has_chathams-blue">(6~20 영문 대소문자, 숫자, 특수문자 꼭포함하여  6~20자)</span></div>
                        <input type="password" class="is_login_input has_width_full" name="pw" placeholder="비밀번호" required="required" pattern="^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&*()_-+=[]{}~?:;`|/]).{6,20}$"/>
                    </div>
                        <div class="has_flex_left">
                        비밀번호 확인 *
                        <input type="password" class="is_login_input  has_width_full" name="pwcheck" placeholder="비밀번호 확인" required="required" pattern="^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&*()_-+=[]{}~?:;`|/]).{6,20}$"/>
                    </div>
                    <div class="has_flex_left">
                        <div>연락처 *<span class="has_chathams-blue">(- 하이픈 포함)</span></div>
                        <input type="text" class="is_login_input  has_width_full" name="tel" id="tel" required="required" placeholder="핸드폰 번호" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}"/>
                    </div>
                        <button id="tel_btn" class='button is_primary'>인증하기</button>
                        <input type="submit" class='button is_login has_shadow has_flex_center has_width_full' value="다음 단계" disabled>
                    </div>
            </form>
        </div>
    </div>
</main>
<jsp:include page="../header_footer/footer.jsp"></jsp:include>
</body>
</html>