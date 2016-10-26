application.factory('AuthFactory', ['$http', function($http){
        var urlBase = 'TODO: path';
        var authFactory = {};

        // implement REST controller on the server side
        //
        authFactory.getVkUserData = function(){

            // TODO: NEED TO PROTECT OF DECOMPILATION SECRET TO ENV!!!
            //return $http.get("https://oauth.vk.com/authorize?client_id=5434840&scope=audio,offline&redirect_uri=http://localhost:8080/redirectVk/&display=page&v=5&response_type=token");
            
            
            //return $http.get("https://oauth.vk.com/authorize?client_id=5608148&scope=audio,offline&redirect_uri=http://floating-badlands-66714.herokuapp.com/redirectVk/&display=page&v=5&response_type=code$v=5.53");
            return $http.get("https://oauth.vk.com/authorize?client_id=5608148&scope=audio,offline&redirect_uri=http://localhost:8080/redirectVk/&display=page&v=5&response_type=code$v=5.53");
        };


        var url = "https://oauth.vk.com/authorize?client_id=5608148&scope=audio,offline&redirect_uri=http://127.0.0.1:8080/redirectVk/&display=page&v=5&response_type=token&callback=JSON_CALLBACK";

        $http.jsonp(url)
            .success(function(data){
                console.log(data);
            });

        authFactory.getYouUserData = function(userCredentional){
              return $http.get(urlBase + '/')
        };

        return authFactory;
}]);

