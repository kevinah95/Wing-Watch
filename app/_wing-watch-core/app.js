var app = angular.module('WingWatchApp',['ngRoute','routeStyles','ngImgCrop']);

app.config(['$routeProvider', function($routeProvider) {
	$routeProvider.when('/login', {templateUrl: '_wing-watch-core/components/login-registro/login-registroView.html', controller:'login-registroCtrl', css: ['assets/css/login-registro.css','assets/css/registro.css']});
  	$routeProvider.when('/home', {templateUrl: '_wing-watch-core/components/home/homeView.html', controller:'homeCtrl', css: ['assets/css/home.css']});

  	$routeProvider.otherwise({redirectTo: '/login'});
}]);
