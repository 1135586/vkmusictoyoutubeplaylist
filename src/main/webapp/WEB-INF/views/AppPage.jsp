<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%request.setCharacterEncoding("UTF-8");%>
<html ng-app="musicApp" class="ng-cloak">

<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0" />
    <title>VkMusicToYoutubePlaylist</title>

    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
    <link rel="stylesheet" href="<c:url value='/static/css/example.css'/>">
    <link rel="stylesheet" href="<c:url value='/static/lib/sweet-alert.css'/>">
    <link rel="script" href="<c:url value='/static/lib/sweet-alert.js'/>">

</head>
<body ng-controller="AuthController">
<style>
    .tablecontainer {
        overflow-x: hidden;
        height: 300px;
        overflow-y: visible;
    }
    #title::after{
        content: normal;
    }
    #title{
        margin-top: 40px !important;
    }

    @media (max-width: 740px){
        h3::after {
            width: auto;
            left: 20px;
            right: 20px;
            margin-left: 0;
            content: none;
        }
    }
</style>
  <h3 id="title">Аудиозаписи вконтакте в плейлист на ютубе!</h3>
  <h3>1. Пройди аутентификацию на сервисах vkontakte и youtube</h3>
  <p>Нажми кнопку <strong>авторизации вконтакте</strong>, а затем <strong>авторизации на ютубе</strong>, чтобы позволить приложению получить необходимую информацию о аудиозаписях в VK и доступных плейлистах на ютубе</p>

  <div class="showcase normal">
      <h4 style="margin-bottom: 35px">Войти вконтакте</h4>
      <a class="button" style="color:white" ng-href="https://oauth.vk.com/authorize?client_id=5634355&scope=audio,offline&redirect_uri=http://test.handmug.ru/vkmusictoyoutubeplaylist/redirectVk&display=page&response_type=code&v=5.53" class="btn btn-default">Авторизовать в vkontakte</a>
      <h5 style="margin-top: 35px">Список аудиозаписей vk.com:</h5>
  <pre>
  <div class="tablecontainer">
          <table class="table table-hover">
              <tbody>
              <c:forEach items="${lists}" var="item">
                  <tr><td>${item}</td></tr>
              </c:forEach>
              </tbody>
          </table>
  </div>
  </pre>

      <div class="vs-icon"></div>
  </div>

  <div class="showcase normal">
      <h4 style="margin-bottom: 35px">Войти на ютуб</h4>
      <a class="button" style="color:white" ng-href="https://accounts.google.com/o/oauth2/auth?client_id=784371443604-5rn2l7bamsqj4necdjv0v4vll3icoimh.apps.googleusercontent.com&redirect_uri=http://test.handmug.ru/vkmusictoyoutubeplaylist/redirectYou&response_type=code&scope=https://www.googleapis.com/auth/youtube&access_type=offline" class="btn btn-default">Авторизовать в youtube</a>
      <h5 style="margin-top: 35px">Список плейлистов youtube.com:</h5>
  <pre>
  <div class="tablecontainer">
          <table class="table table-hover">
              <tbody>
              <c:forEach items="${playlists}" var="play">
                  <tr><td>${play.toString()}</td></tr>
              </c:forEach>
              </tbody>
          </table>
  </div>
  </pre>


  </div>

  <h3 id="download-section">2. Введи название нового плейлиста (ENG)</h3>

  <div style="margin-top: 0px; margin-bottom: 50px;"class="center-container">
      <p class="center"><b>Подсказка: </b> новый <strong>приватный</strong> плейлист будет содержать ролики по песням из вконтакте (можно сделать публичным на ютубе в настройках плейлиста)</p>
      <pre  class="center"><input type="text" id="address" class="form-control input-sm" placeholder="Название писать сюда..." name="playlistname" ng-model="playlistname"/></pre>
  </div>
  <a class="button" id="convert_angular" ng-href="http://test.handmug.ru/vkmusictoyoutubeplaylist/convert/{{playlistname}}">Сконвертировать!</a>
  <div></div>
  <footer>
      Добра тебе :) 2016
  </footer>
    <script>
            document.getElementById("address")
.addEventListener("keyup", function(event) {
event.preventDefault();
if (event.keyCode == 13) {
document.getElementById("convert_angular").click();
}
});
        </script>
  <script src="<c:url value="/static/js/application.js"/>"></script>
  <script src="<c:url value="/static/js/service/AuthFactory.js"/>"></script>
  <script src="<c:url value="/static/js/controller/AuthController.js"/>"></script>
</body>
</html>
