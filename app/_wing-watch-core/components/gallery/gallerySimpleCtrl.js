app.controller('gallerySimpleCtrl', function($scope, $http) {
    //Carga los datos de la base. 
    $scope.posts = {};
    $scope.datos = {};
    $scope.datos.ID = 1;
    $scope.taxonomia = {};

    $scope.iniciarDatos = function(){
        $http.post('_wing-watch-core/components/gallery/php/cargarDatos.php',$scope.datos).success(function(data) {
        $scope.taxonomia = data;
        console.log($scope.taxonomia); });
    }
   
});