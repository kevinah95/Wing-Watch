'use strict';

app.controller('login-registroCtrl', ['$scope', function($scope) {
    $scope.clear = function() {
        $('.ui.form.registro').form('reset');

        // $('.ui.form.error').removeClass( "error" );
        // $('.ui.form.registro').form('set value', 'tipo', 'checked');
    };

    window.onhashchange = function(){
        history.go(0);
    }
}]);
