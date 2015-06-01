app.controller('notificacionesCtrl', function($scope,$location,$http){

	//Carga los datos de la base. 
	$scope.inicializar = function(){
		$scope.varUser = JSON.parse(sessionStorage.user);
		$http.post('php/cargarAves.php')
		.success(function(data) { 
		$scope.posts = data; })
	}	
});
