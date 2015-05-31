app.directive('loginTemplate', function() {
    // Runs during compile
    return {
        controller: 'loginCtrl',

        restrict: 'E', // E = Element, A = Attribute, C = Class, M = Comment

        templateUrl: '_wing-watch-core/components/login-registro/login/loginView.html',

    };
});
