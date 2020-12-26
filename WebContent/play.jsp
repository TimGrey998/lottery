<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>参与抽奖</title>
  <link rel="stylesheet" href="/lottery/playUI//style.css">
  <meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
</head>
<body>
<!-- partial:index.partial.html -->
<div class="page">
  <div class="container">
    <div class="left">
      <div class="login">Login</div>
      <div class="eula">请输入您的真实姓名参与抽奖</div>
    </div>
    <div class="right">
      <svg viewBox="0 0 320 300">
        <defs>
          <linearGradient
                          inkscape:collect="always"
                          id="linearGradient"
                          x1="13"
                          y1="193.49992"
                          x2="307"
                          y2="193.49992"
                          gradientUnits="userSpaceOnUse">
            <stop
                  style="stop-color:#ff00ff;"
                  offset="0"
                  id="stop876" />
            <stop
                  style="stop-color:#ff0000;"
                  offset="1"
                  id="stop878" />
          </linearGradient>
        </defs>
        <path d="m 40,120.00016 239.99984,-3.2e-4 c 0,0 24.99263,0.79932 25.00016,35.00016 0.008,34.20084 -25.00016,35 -25.00016,35 h -239.99984 c 0,-0.0205 -25,4.01348 -25,38.5 0,34.48652 25,38.5 25,38.5 h 215 c 0,0 20,-0.99604 20,-25 0,-24.00396 -20,-25 -20,-25 h -190 c 0,0 -20,1.71033 -20,25 0,24.00396 20,25 20,25 h 168.57143" />
      </svg>
      <div class="form">
        <form action="/lottery/play" method="POST">
             <label>姓名</label>
        <input name="name" type="text" id="email">
        <label>请确认</label>
        <input name="confirm" type="text" id="password">
        <input onclick="confirm()" type="submit" id="submit" value="Submit">
        </form>
      </div>
    </div>
  </div>
</div>
<!-- partial -->
  <script src='https://cdnjs.cloudflare.com/ajax/libs/animejs/2.2.0/anime.min.js'></script><script  src="/lottery/playUI/script.js"></script>
  <script>
    window.onload=function() {
        var submit = document.getElementById("submit");
        var name = document.getElementById("email");
        var confirm = document.getElementById("password");
        submit.onclick = function(event) {
            if(name.value!==confirm.value) {
                alert("两次输入不一致");
                return false;
            } else {
            	setTimeout(console.log("waiting"),1000);
                return true;
            }
        }
    }
  </script>
</body>
</html>
