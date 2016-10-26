<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%request.setCharacterEncoding("UTF-8");%>
<html ng-app="" class="ng-cloak">
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0" />
    <title>Done</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jScrollPane/2.0.23/style/jquery.jscrollpane.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jScrollPane/2.0.23/style/jquery.jscrollpane.min.css">

    <link rel="stylesheet" href="<c:url value='/static/css/example.css'/>">
    <link rel="stylesheet" href="<c:url value='/static/lib/sweet-alert.css'/>">
    <link rel="script" href="<c:url value='/static/lib/sweet-alert.js'/>">
</head>
<body>
<br/><br/>
<h2>В ближайшее время все сконвертируется</h2>
<p class="center">В зависимости от количества песен процесс конвертирования может занять до нескольких минут</p>
<p class="center"><b>Disclaimer: </b> конвертирование осуществлялось путем подбора первого попавшегося в выдаче поиска youtube видеоролика на запрос по названию из аудиозаписи в vkontakte</p>
<script src="../../static/js/captcha.js"></script>
<script src="../../static/js/controller/captchaController.js"></script>
</body>
</html>

