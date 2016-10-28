<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%request.setCharacterEncoding("UTF-8");%>
<html ng-app="" class="ng-cloak">
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0" />
    <title>Captcha</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jScrollPane/2.0.23/style/jquery.jscrollpane.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jScrollPane/2.0.23/style/jquery.jscrollpane.min.css">

    <link rel="stylesheet" href="<c:url value='/static/css/example.css'/>">
    <link rel="stylesheet" href="<c:url value='/static/lib/sweet-alert.css'/>">
    <link rel="script" href="<c:url value='/static/lib/sweet-alert.js'/>">
</head>
<body>
<h2>Подтверди что ты не бот :)</h2>
    <img src="${captcha_img}" style="height: 150px; width: auto" alt="c">

    <div style="margin-top: 0px; margin-bottom: 50px;"class="center-container">
        <p class="center"><b>Подсказка: </b> введите текст с картинки</p>
        <pre  class="center"><input type="text" id="captcha" class="form-control input-sm" placeholder="Type here playlist name" name="captcha" ng-model="captcha"/></pre>
    </div>

    <!--
    String urlForAccessToken = "https://oauth.vk.com/access_token?client_id=5634355&client_secret=s1ZC77w7NO9FidFOEnRK&redirect_uri=http://floating-badlands-66714.herokuapp.com/redirectVk&code=" + code;
    -->

    <a id="send_captcha" class="button" ng-href="<c:url value='/captcha'/>?sid=${captcha_sid}&key={{captcha}}">Отправить</a>
<!--
    <a class="button" ng-href="http://floating-badlands-66714.herokuapp.com/redirectVk?code=e10111a9bf3b872c22 ????? ???? ???? ">use this captcha in request</a>
    <a class="button" ng-href="https://oauth.vk.com/authorize?client_id=5634355&scope=audio,offline&redirect_uri=http://floating-badlands-66714.herokuapp.com/redirectVk&display=page&response_type=code&v=5.53" class="btn btn-default">Authenticate Vk (when auth commpleted show user name)</a>

https://api.vk.com/method/audio.get?access_token=67c4eb867f80509e104b6d946d3a52779af34b0b5028964e1f78c3e99610aa77bc9ba193c4d07fb54f652&captcha_sid=895365684433&captcha_key=dme8z2n

http://floating-badlands-66714.herokuapp.com/captchaHandler?captcha_key
call my server with params and then invoker controller to continue request
-->


<!--
</br>
    <input type="text"  ng-model="playlistname"/></pre>
    <a class="button" ng-href="http://floating-badlands-66714.herokuapp.com/convert/{{playlistname}}">Convert it!</a>
</br>
-->











<script>
    document.getElementById("captcha")
            .addEventListener("keyup", function(event) {
                event.preventDefault();
                if (event.keyCode == 13) {
                    document.getElementById("send_captcha").click();
                }
            });
</script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
    <script src="<c:url value="/static/js/captcha.js"/>"></script>
    <script src="<c:url value="/static/js/controller/captchaController.js"/>"></script>
</body>
</html>
