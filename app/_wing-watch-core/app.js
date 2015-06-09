var app = angular.module('WingWatchApp',['ngRoute','routeStyles','ngImgCrop','angularify.semantic.dropdown','checklist-model']);
app.config(['$routeProvider', function($routeProvider) {
	$routeProvider.when('/login', {templateUrl: '_wing-watch-core/components/login-registro/login-registroView.html', controller:'login-registroCtrl', css: ['assets/css/login-registro.css','assets/css/registro.css']});
  	$routeProvider.when('/home', {templateUrl: '_wing-watch-core/components/home/homeView.html', controller:'homeCtrl', css: ['assets/css/home.css']});
  	$routeProvider.when('/registerBird', {templateUrl: '_wing-watch-core/components/registerBird/registerBirdView.html', controller:'registerBirdCtrl', css: ['assets/css/registerBird.css']});
  	$routeProvider.when('/editarUsuario', {templateUrl: '_wing-watch-core/components/editarUsuario/editarUsuarioView.html', controller:'editarUsuarioCtrl', css: ['assets/css/editarUsuario.css']});
  	$routeProvider.when('/users', {templateUrl: '_wing-watch-core/components/users/usersView.html', controller:'usersCtrl', css: ['assets/css/Usuarios.css']});
  	$routeProvider.when('/reg_especie', {templateUrl: '_wing-watch-core/components/reg_especie/reg_especieView.html', controller:'reg_especieCtrl', css: ['assets/css/Reg_Especies.css']});
  	$routeProvider.when('/birds', {templateUrl: '_wing-watch-core/components/gallery/galleryView.htm', controller:'galleryCtrl', css: ['assets/css/gallery.css', 'assets/css/flexslider.css'] });
    $routeProvider.when('/sbird', {templateUrl: '_wing-watch-core/components/gallery/gallery-single.htm', controller:'gallerySimpleCtrl',  css: ['assets/css/gallery.css', 'assets/css/flexslider.css']});
    $routeProvider.when('/migracion', {templateUrl: '_wing-watch-core/components/migracion/migracionView.html', controller:'migracionCtrl',  css: ['assets/css/migracion.css']});
  	$routeProvider.otherwise({redirectTo: '/login'});
}]);
