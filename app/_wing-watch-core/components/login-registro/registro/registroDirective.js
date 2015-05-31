app.directive('registroTemplate', function() {
    // Runs during compile
    return {
        controller: 'registroCtrl',

        restrict: 'E', // E = Element, A = Attribute, C = Class, M = Comment

        templateUrl: '_wing-watch-core/components/login-registro/registro/registroView.html',

    };
});
