application.controller('captchaController', ['$scope', 'AuthFactory', function($scope, authFactory){
    $scope.captcha;
    $scope.playlistname;
    $scope.status;
    $scope.ooo;
    $scope.vkUserData = {"name": "DIMA", "songs": ['a', 'b', 'c']};
    $scope.youUserData;
    $scope.getVkUser = getVkUser;

    function getVkUser(){
        authFactory.getVkUserData()
            .then(
                function(vkUserData){
                    console.log(vkUserData);
                    $scope.vkUserData = vkUserData;
                },
                function(err){
                    $scope.status = 'Unable to load Vk user data' + err;
                }
            );
    };

    function getYoUser(){
        authFactory.getYouUserData()
            .then(
                function(youUserData){
                    $scope.youUserData = youUserData;
                },
                function(err){
                    $scope.status = 'Unable to load Vk user data' + err;
                }
            );
    };
}]);
