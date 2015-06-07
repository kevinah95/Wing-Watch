'use strict'
app.controller('usersCtrl', ['$scope','$http', function($scope, $http) {
    $http.get('_wing-watch-core/components/users/loadUsers.php').success(function(data) { $scope.users = data;  console.log($scope.users);});
    $scope.getTipo = function(tipo) {
        if(tipo == "1") {
            return "Aficionado"
        }
        return "Ornitólogo";
    } 
}]);
