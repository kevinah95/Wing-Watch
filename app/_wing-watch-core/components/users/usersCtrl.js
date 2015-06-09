'use strict'
app.controller('usersCtrl', ['$scope','$http', '$location', function($scope, $http, $location) {
    $http.get('_wing-watch-core/components/users/loadUsers.php').success(function(data) { $scope.users = data;  console.log($scope.users);});
    $scope.getTipo = function(tipo) {
        if(tipo == "1") {
            return "Aficionado"
        }
        return "Ornitólogo";
    }

    $scope.goHome = function() {
        $location.path('/home');
    } 
}]);
