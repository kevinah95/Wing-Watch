app.directive('homeTemplate', function() {
    // Runs during compile
    return {
        controller: 'homeCtrl',
        restrict: 'E', // E = Element, A = Attribute, C = Class, M = Comment
        templateUrl: '_wing-watch-core/components/home/homeView.html',
    };
});
