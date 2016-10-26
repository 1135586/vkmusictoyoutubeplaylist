var application = angular.module('musicApp', []);/*, ['ngRoute']);

/*
application.config(['$routeProvider', function($routeProvider){
  $routeProvider
    .when('/', {
          controller: 'authController',
          templateUrl: 'views/auth.html'
      })
      .when('playlist', {
          controller: playlistController,
          templateUrl: 'playlist.html'
      })
      .otherwise({rediretTo: '/'});
}]);
      */
/*
application
  .config(function($httpProvider){
    delete $httpProvider.defaults.headers.common['X-Requested-With'];
});
*/
application.config(['$httpProvider', function($httpProvider) {
    $httpProvider.defaults.useXDomain = true;
    delete $httpProvider.defaults.headers.common['X-Requested-With'];
}
]);