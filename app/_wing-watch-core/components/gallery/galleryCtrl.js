app.controller('galleryCtrl', function($scope, $http, $location) {

    $(window).load(function(){
        $('.flexslider').flexslider({
            animation: "slide",
            slideshow: true,
            start: function(slider){
              $('body').removeClass('loading');
            }
        });  
    });

    $scope.sessionBird = function(data) {
        sessionStorage.setItem("Bird" , true);
        console.log(data);
    }

    $scope.goHome = function() {
        $location.path('/home');
    }
    $http.get('_wing-watch-core/components/gallery/loadSlideBirds.php').success(function(data) { $scope.slideBirds = data; });
    $http.get('_wing-watch-core/components/gallery/loadBirds.php').success(function(data) { $scope.posts = data; });
});
