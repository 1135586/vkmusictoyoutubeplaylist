<!-- JAVA
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
-->
<html ng-app="musicApp" class="ng-cloak">

<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0" />
    <title>VkMusicToYoutubePlaylist</title>

    <!-- JSROLL PANE -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jScrollPane/2.0.23/script/jquery.jscrollpane.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jScrollPane/2.0.23/script/jquery.jscrollpane.min.js"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jScrollPane/2.0.23/style/jquery.jscrollpane.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jScrollPane/2.0.23/style/jquery.jscrollpane.min.css">

    <link rel="stylesheet" href="<c:url value='/static/css/example.css'/>">
    <link rel="stylesheet" href="<c:url value='/static/lib/sweet-alert.css'/>">
    <link rel="script" href="<c:url value='/static/lib/sweet-alert.js'/>">

</head>

<body ng-controller="AuthController">
<style>
    .tablecontainer {
        overflow-x: hidden;
        height: 300px;
        overflow-y: overlay;
    }
</style>
<script>
    $(document).ready(function() {
        $('.tablecontainer').jScrollPane();
    });
</script>
<!--
  <script>
      var script = document.createElement('SCRIPT');

      script.src = "https://oauth.vk.com/authorize?client_id=5608148&scope=audio,offline&redirect_uri=http://127.0.0.1:8080/redirectVk/&display=page&v=5&response_type=token&callback=callbackFunc";
      document.getElementsByTagName("head")[0].appendChild(script);

      function callbackFunc(result) {
          console.log(result);
      }
  </script>
-->
<!--
        OLD APPLICATION CREDENTIONALS ON VKONTAKTE COM
        API CALL

  <h1>Logo</h1>
  <h1>vk auth</h1>
  <a ng-href="https://oauth.vk.com/authorize?client_id=5608148&scope=audio,offline&redirect_uri=http://floating-badlands-66714.herokuapp.com/redirectVk&display=page&response_type=code&v=5.53">AUTH</a>
  <a ng-href="https://oauth.vk.com/authorize?client_id=5608148&scope=audio,offline&redirect_uri=localhost:8080/redirectVk&display=page&response_type=code&v=5.53">AUTH_localhost</a>
  </br>
  <h1>youtube auth</h1>
  <a ng-href="https://oauth.vk.com/authorize?client_id=5608148&scope=audio,offline&redirect_uri=http://floating-badlands-66714.herokuapp.com/redirectVk&display=page&response_type=code&v=5.53">AUTH</a>
  <a ng-href="https://oauth.vk.com/authorize?client_id=5608148&scope=audio,offline&redirect_uri=localhost:8080/redirectVk&display=page&response_type=code&v=5.53">AUTH_localhost</a>
  </br>

-->











<!--
  <h1>Logo</h1>
  <h1>vk auth</h1>
  <a ng-href="https://oauth.vk.com/authorize?client_id=5634355&scope=audio,offline&redirect_uri=http://floating-badlands-66714.herokuapp.com/redirectVk&display=page&response_type=code&v=5.53">AUTH Vk</a>
  <a ng-href="https://oauth.vk.com/authorize?client_id=5634355&scope=audio,offline&redirect_uri=localhost:8080/redirectVk&display=page&response_type=code&v=5.53">AUTH_localhost Vk</a>
  </br>
  <h1>youtube auth</h1>
<a ng-href="https://accounts.google.com/o/oauth2/auth?client_id=784371443604-5rn2l7bamsqj4necdjv0v4vll3icoimh.apps.googleusercontent.com&redirect_uri=http://floating-badlands-66714.herokuapp.com/redirectYou&response_type=code&scope=https://www.googleapis.com/auth/youtube&access_type=offline"/>AUTH youtube</a>
<a ng-href="https://accounts.google.com/o/oauth2/auth?client_id=784371443604-5rn2l7bamsqj4necdjv0v4vll3icoimh.apps.googleusercontent.com&redirect_uri=http://localhost:8080/redirectYou&response_type=code&scope=https://www.googleapis.com/auth/youtube&access_type=offline"/>AUTH localhost YOU</a>
</br>
</br>
<a ng-href="http://floating-badlands-66714.herokuapp.com/convert/{{playlistname}}"/>Convert</a>
<a ng-href="http://localhost:8080/convert/{{playlistname}}"/>Convert localhost</a>
<input type="text" name="playlistname" ng-model="playlistname">
</br>
</br>
  <h2>Convert you VK music to show on Smart TV as youtube playlist</h2>


<H2>
ok/ add button enable/disable corresponding to the state of turnOn field after success AUTH

    next Beautify list of stuff

    and then... one thing - easy man... add Converter service... may be.. microserv.. why not?

    FIX Jscroll panel
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
</br>
    <c:forEach items="${lists}" var="item">
        ${item}</br>
    </c:forEach>
    <c:forEach items="${playlists}" var="play">
        ${play.toString()}</br>
    </c:forEach>
</br>
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    </br>
</H2>>
  <button class="download">Playlist {{name}} has been created!</button>
  <!-- What does it do? -->





  <h3>1. Create youtube playlist from VK music... And so! How to use it?</h3>
  <p>First of all hit auth button on Vk and Youtube to allow application get you <strong>public </strong>information. Then set the name of new youtube playlist that been created from all your Vk music. And press <strong>create playlist button</strong>.</p>

  <div class="showcase normal">
      <!--<h4>{{vkUserData ? "Hello, " + vkUserData.name : "Click on the button below see you music below"}}</h4>-->
      <h4>Hello, vk user!</h4>
      <button><a ng-href="https://oauth.vk.com/authorize?client_id=5634355&scope=audio,offline&redirect_uri=http://floating-badlands-66714.herokuapp.com/redirectVk&display=page&response_type=code&v=5.53" class="btn btn-default">Authenticate Vk (when auth commpleted show user name)</a></button>
      <!--<button ng-click="getVkUser()">Authenticate Vk (when auth commpleted show user name)</button>-->

<!--
      <button><a href="https://oauth.vk.com/authorize?client_id=5634355&scope=audio,offline&redirect_uri=http://floating-badlands-66714.herokuapp.com/redirectVk&display=page&response_type=code&v=5.53" class="btn btn-default">Authenticate Youtube (when auth commpleted show user name)</a></button>
      <button><a href="https://oauth.vk.com/authorize?client_id=5634355&scope=audio,offline&redirect_uri=http://floating-badlands-66714.herokuapp.com/redirectVk&display=page&response_type=code&v=5.53" class="btn btn-default">Authenticate Youtube (when auth commpleted show user name)</a></button>

      <a ng-href="https://accounts.google.com/o/oauth2/auth?client_id=784371443604-5rn2l7bamsqj4necdjv0v4vll3icoimh.apps.googleusercontent.com&redirect_uri=http://floating-badlands-66714.herokuapp.com/redirectYou&response_type=code&scope=https://www.googleapis.com/auth/youtube&access_type=offline"/>AUTH youtube</a>
      <a ng-href="https://accounts.google.com/o/oauth2/auth?client_id=784371443604-5rn2l7bamsqj4necdjv0v4vll3icoimh.apps.googleusercontent.com&redirect_uri=http://localhost:8080/redirectYou&response_type=code&scope=https://www.googleapis.com/auth/youtube&access_type=offline"/>AUTH localhost YOU</a>
      -->
      <h5>List of you music:</h5>
      <!--
  <pre>vk music ul li</pre>
  -->
  <pre>
  <div class="tablecontainer">
      <div id="scrollpane">
          <table class="table table-hover">
              <tbody>
              <c:forEach items="${lists}" var="item">
                  <tr><td>${item}</td></tr>
              </c:forEach>
              <tr ng-repeat="m in vkUserData.songs">
                  <td><span ng-bind="m"></span>{{m}}</td>
                  <!--<td><button type="button" ng-click="ctrl.edit(u.id)" class="btn btn-success custom-width"></butto></td>-->
              </tbody>
          </table>
      </div>
  </div>
  </pre>

      <div class="vs-icon"></div>
  </div>

  <div class="showcase sweet">
      <h4>{{crtl.youUserData ? "Hello, " +  youUserData.name : "Click on the button below"}}</h4>
      <button><a ng-href="https://accounts.google.com/o/oauth2/auth?client_id=784371443604-5rn2l7bamsqj4necdjv0v4vll3icoimh.apps.googleusercontent.com&redirect_uri=http://floating-badlands-66714.herokuapp.com/redirectYou&response_type=code&scope=https://www.googleapis.com/auth/youtube&access_type=offline" class="btn btn-default">Authenticate Youtube (when auth commpleted show user name)</a></button>


      <!--
      <button><a href="https://accounts.google.com/o/oauth2/auth?client_id=784371443604-5rn2l7bamsqj4necdjv0v4vll3icoimh.apps.googleusercontent.com&redirect_uri=http://localhost:8080/redirectYou&response_type=code&scope=https://www.googleapis.com/auth/youtube&access_type=offline" class="btn btn-default">Authenticate Youtube (when auth commpleted show user name)</a></button>

      <a ng-href="https://accounts.google.com/o/oauth2/auth?client_id=784371443604-5rn2l7bamsqj4necdjv0v4vll3icoimh.apps.googleusercontent.com&redirect_uri=http://floating-badlands-66714.herokuapp.com/redirectYou&response_type=code&scope=https://www.googleapis.com/auth/youtube&access_type=offline"/>AUTH youtube</a>
      <a ng-href="https://accounts.google.com/o/oauth2/auth?client_id=784371443604-5rn2l7bamsqj4necdjv0v4vll3icoimh.apps.googleusercontent.com&redirect_uri=http://localhost:8080/redirectYou&response_type=code&scope=https://www.googleapis.com/auth/youtube&access_type=offline"/>AUTH localhost YOU</a>


      -->
      <h5>Available playlists:</h5>
      <!--
  <pre>youtube ul li list</pre>
      -->
  <pre>
  <div class="tablecontainer">
      <div class="tablecontainer">
          <table class="table table-hover">
              <tbody>
              <c:forEach items="${playlists}" var="play">
                  <tr><td>${play.toString()}</td></tr>
              </c:forEach>
              <tr ng-repeat="y in youUserData.playlists">
                  <td><span ng-bind="y"></span>{{y}}</td>
              <tr ng-repeat="m in vkUserData.songs">
                  <td><span ng-bind="m"></span>{{m}}</td>
                  <!--<td><button type="button" ng-click="ctrl.edit(u.id)" class="btn btn-success custom-width"></button></td>-->
              </tbody>
          </table>
      </div>
  </div>
  </pre>


  </div>
  <!-- Download & Install -->
  <h3 id="download-section">2. Set playlist name & Create it!</h3>

  <div style="margin-top: 0px; margin-bottom: 50px;"class="center-container">
      <p class="center"><b>Hint: </b> chose your new playlist name</p>
      <pre  class="center"><input type="text" id="address" class="form-control input-sm" placeholder="Type here playlist name" name="playlistname" ng-model="playlistname"/></pre>
<!--
      <a ng-href="http://floating-badlands-66714.herokuapp.com/convert/{{playlistname}}"/>Convert</a>
      <a ng-href="http://localhost:8080/convert/{{playlistname}}"/>Convert localhost</a>
      <input type="text" name="playlistname" ng-model="playlistname">
      -->
  </div>

  <a class="button" ng-href="http://floating-badlands-66714.herokuapp.com/convert/{{playlistname}}">Convert it!</a>
<!--Download files TODO: button grey not allowed when pressed and gradient effect while processing and text Waiting... and make validation - when first world added its ok in input field -->
<!-- when convertation is finished SHOW LINK OF NEW PLAYLIST -->
  <div></div>
  <footer>
      dmitry ? 2016
  </footer>


  <script>
  /*
      document.querySelector('button.download').onclick = function(){
          $("html, body").animate({ scrollTop: $("#download-section").offset().top }, 1000);
      };

      document.querySelector('.showcase.normal button').onclick = function(){
          alert("1Oops... Something went wrong!");
      };
  /*
      document.querySelector('.showcase.sweet button').onclick = function(){
          swal("2Oops...", "Something went wrong!", "error");
      };
      /*
       document.querySelector('ul.examples li.message button').onclick = function(){
       swal("Here's a message!");
       };
       */
      /*
       document.querySelector('ul.examples li.timer button').onclick = function(){
       swal({
       title: "Auto close alert!",
       text: "I will close in 2 seconds.",
       timer: 2000
       });
       };

       document.querySelector('ul.examples li.title-text button').onclick = function(){
       swal("Here's a message!", "It's pretty, isn't it?")
       };

       document.querySelector('ul.examples li.success button').onclick = function(){
       swal("Good job!", "You clicked the button!", "success");
       };

       document.querySelector('ul.examples li.warning.confirm button').onclick = function(){
       swal({
       title: "Are you sure?",
       text: "You will not be able to recover this imaginary file!",
       type: "warning",
       showCancelButton: true,
       confirmButtonColor: '#DD6B55',
       confirmButtonText: 'Yes, delete it!',
       closeOnConfirm: false,
       //closeOnCancel: false
       },
       function(){
       swal("Deleted!", "Your imaginary file has been deleted!", "success");
       });
       };

       document.querySelector('ul.examples li.warning.cancel button').onclick = function(){
       swal({
       title: "Are you sure?",
       text: "You will not be able to recover this imaginary file!",
       type: "warning",
       showCancelButton: true,
       confirmButtonColor: '#DD6B55',
       confirmButtonText: 'Yes, delete it!',
       cancelButtonText: "No, cancel plx!",
       closeOnConfirm: false,
       closeOnCancel: false
       },
       function(isConfirm){
       if (isConfirm){
       swal("Deleted!", "Your imaginary file has been deleted!", "success");
       } else {
       swal("Cancelled", "Your imaginary file is safe :)", "error");
       }
       });
       };

       document.querySelector('ul.examples li.custom-icon button').onclick = function(){
       swal({
       title: "Sweet!",
       text: "Here's a custom image.",
       imageUrl: 'images/thumbs-up.jpg'
       });
       };
       */

  </script>
  <!--
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
  <script src="../static/js/application.js' />"></script>
  <script src="../static/js/service/AuthFactory.js' />"></script>
  <script src="../static/js/controller/AuthController.js' />"></script>
  -->

  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
  <script src="../../static/js/application.js"></script>
  <script src="../../static/js/service/AuthFactory.js"></script>
  <script src="../../static/js/controller/AuthController.js"></script>
</body>
</html>
