app.controller('gallerySimpleCtrl', function($scope, $http) {
    //Carga los datos de la base. 
    $scope.posts = {};
    $scope.datos = sessionStorage.getItem("Bird");
    console.log($scope.datos);
    $scope.taxonomia = {};
    $scope.color = {};
    $scope.zona = {};
    $scope.pico = {};
    $scope.fotos = {};

    $scope.iniciarDatos = function(){
        var $promise = $http.post('_wing-watch-core/components/gallery/php/cargarDatos.php',$scope.datos.especie);
        $promise.then(function(msg){
            console.log(msg.data);
             $scope.taxonomia= msg.data[0];
        });
        var $promise1 = $http.post('_wing-watch-core/components/gallery/php/color.php',$scope.datos.Id);
        $promise1.then(function(msg){
            console.log(msg.data);
             $scope.color= msg.data[0];
        });
        var $promise2 = $http.post('_wing-watch-core/components/gallery/php/pico.php',$scope.datos.Id);
        $promise2.then(function(msg){
            console.log(msg.data);
             $scope.pico= msg.data[0];
        });
        var $promise3 = $http.post('_wing-watch-core/components/gallery/php/zona_vida.php',$scope.datos.Id);
        $promise3.then(function(msg){
            console.log(msg.data);
             $scope.zona= msg.data[0];
        });
    }
    $scope.goHome = function() {
        $location.path('/home');
    } 
    $scope.cargarFotos = function(){
        var $promise4 = $http.post('_wing-watch-core/components/gallery/php/cargarFotos.php',$scope.datos);
        $promise4.then(function(msg){
            console.log(msg.data);
             $scope.fotos= msg.data;
        }); 
    };
   
});