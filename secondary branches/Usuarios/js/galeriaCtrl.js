var app = angular.module('MyApp', []);
app.controller('galleryCtrl', function($scope, $http) {
    //Carga los datos de la base. 
    $scope.posts = {};
    
    $http.get('php/cargarAves.php').success(function(data) { $scope.posts = data; });
});
