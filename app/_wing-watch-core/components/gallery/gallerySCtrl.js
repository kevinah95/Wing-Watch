app.controller('gallerySingleCtrl', function($scope, $http) {
    //Carga los datos de la base. 
    $scope.posts = {};

    $(window).load(function(){
        $('.flexslider').flexslider({
            animation: "slide",
            slideshow: true,
            start: function(slider){
              $('body').removeClass('loading');
            }
        });  
    });
    $http.get('_wing-watch-core/components/gallery/loadBirds.php').success(function(data) { $scope.posts = data; });
});
