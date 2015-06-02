var app = angular.module('MyApp', []);
app.controller('galleryCtrl', function($scope,$location,$http){
	//Carga los datos de la base. 
	$scope.inicializar = function(){
		$http.post('php/cargarAves.php')
		.success(function(data) { 
		$scope.posts = data; })
	}	
});
