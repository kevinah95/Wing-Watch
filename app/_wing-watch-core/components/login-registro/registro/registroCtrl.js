'use strict'
app.controller('registroCtrl', function($scope, $http) {
    $scope.myImage = '';
    $scope.myCroppedImage = '';
    $scope.miImagen = 'http://thesocietypages.org/socimages/files/2009/05/vimeo.jpg';
    var handleFileSelect = function(evt) {
        var file = evt.currentTarget.files[0];
        var reader = new FileReader();
        reader.onload = function(evt) {
            $scope.$apply(function($scope) {
                $scope.myImage = evt.target.result;
                console.log($scope.myCroppedImage);
            });
        };
        reader.readAsDataURL(file);
    };
    angular.element(document.querySelector('#file')).on('change', handleFileSelect);

    $scope.upload = function() {
        $http({
            method: 'POST',
            url: 'upload.php',
            data: $scope.myCroppedImage,
            headers: {
                'Content-Type': undefined
            }
        });
    };
    $scope.abrir = function() {
        $('.small.test.modal')
            .modal({
                onDeny: function() {
                    // window.alert('Wait not yet!');
                },
                onApprove: function() {
                    $scope.miImagen = $scope.myCroppedImage;
                    $scope.$apply();
                }
            })
            .modal('show');
    };
    $scope.registrarCuenta = function() {
        var $form = $('.form.registro'),
            allFields = $form.form('get values');

        allFields.foto = $scope.miImagen;
        var $validateResult = $form.form('validate form'); //verificar formulario validado
        if($validateResult) {
            var $dataBaseinsert = $http.post('_wing-watch-core/components/login-registro/registro/insertUsers.php',allFields);
            $dataBaseinsert.then(function(message){
                var msgFinal = message.data;
                if(msgFinal == "registrado") {
                    swal("Su registro ha sido exitoso","Felicidades, ahora forma parte de Wing Watch","success");
                    history.go(0);
                }
                else {
                    swal("Ha ocurrido un error en su registro", "Por favor, inténtelo de nuevo", "error");
                }
            })
        }
    };

    $('.menu .item').tab();
    $('.test.radio.checkbox').checkbox();
    $('.ui.form.registro')
        .form({
            nombre: {
                identifier: 'nombre',
                rules: [{
                    type: 'empty',
                    prompt: 'Por favor, ingrese su nombre'
                }]
            },
            pApellido: {
                identifier: 'pApellido',
                rules: [{
                    type: 'empty',
                    prompt: 'Por favor, ingrese su primer apellido'
                }]
            },
            sApellido: {
                identifier: 'sApellido',
                rules: [{
                    type: 'empty',
                    prompt: 'Por favor, ingrese su segundo apellido'
                }]
            },
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
            },
            tipo: {
                identifier: 'tipo',
                rules: [{
                    type: 'checked',
                    prompt: 'Seleccione el tipo de usuario'
                }]
            },

            apodo: {
                identifier: 'apodo',
                rules: [{
                    type: 'empty',
                    prompt: 'Ingrese un apodo para su usuario'
                }]
            },

            telefono: {
                identifier: 'telefono',
                rules: [{
                    type: 'integer',
                    prompt: 'Ingrese un número válido de teléfono. Debe incluir solo números'
                }]
            },

            cedula: {
                identifier: 'cedula',
                rules: [{
                    type: 'empty',
                    prompt: 'Ingrese una cédula'
                }]
            }

        }, {
            keyboardShortcuts: false,
            // inline: true,
            on: 'blur',
            transition: 'fade down'
        });

});
