var app = angular.module('WingWatchApp',['ngRoute','routeStyles']);

app.config(['$routeProvider', function($routeProvider) {
  $routeProvider.when('/login', {templateUrl: '_wing-watch-core/componentes/login/loginView.html', controller:'loginCtrl', css: 'assets/css/login.css'});
  $routeProvider.otherwise({redirectTo: '/inicio'});
}]);
