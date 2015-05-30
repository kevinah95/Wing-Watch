'use strict'
app.controller('loginCtrl', function($scope, $http) {
        $scope.login = function() {
            var $form = $('.form.login'),
                allFields = $form.form('get values');

            $form.form('validate form'); //verificar formulario validado
        };
        //Login Form    
        $('.ui.form.login')
            .form({
                email: {
                    identifier: 'email',
                    rules: [{
                        type: 'empty',
                        prompt: 'Por favor, ingrese su correo electrónico'
                    }, {
                        type: 'email',
                        prompt: 'Por favor, ingrese un correo electrónico válido'
                    }]
                },
                password: {
                    identifier: 'password',
                    rules: [{
                        type: 'empty',
                        prompt: 'Por favor, ingrese su contraseña'
                    }]
                }

            }, {
                keyboardShortcuts: false,
                // inline: true,
                on: 'blur',
                transition: 'fade down'
            });
        //
    });