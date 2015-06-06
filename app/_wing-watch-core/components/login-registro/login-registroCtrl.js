'use strict';

app.controller('login-registroCtrl', ['$scope', function($scope) {
    $scope.clear = function() {
        $('.ui.form.registro').form('reset');
	};

    window.onhashchange = function(){
        history.go(0);
    }
}]);
