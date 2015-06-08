app.controller('editarUsuarioCtrl', function($scope, $http, $location) {
    function encrypt(pString) {
        var hash = CryptoJS.MD5(pString).toString();
        return hash;
    }

    $scope.myImage = '';
    $scope.myCroppedImage = '';
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

    $scope.abrirEditarPerfil = function() {
        $('.editar.modal').modal({
            closable: false
        })

        .modal('show');

    };
    $scope.abrir = function() {
        $('.small.test.modal')
            .modal({
                closable: false,
                onDeny: function() {
                    // window.alert('Wait not yet!');
                    $('.editar.modal').modal('show');
                }
            })
            .modal('show');
    };

    $scope.guardarCambioFoto = function() {
        $scope.miImagen = $scope.myCroppedImage;
        $('.editar.modal').modal('show');
    }

    $scope.editarCuenta = function() {
        var $form = $('.form.editarPerfil'),
            allFields = $form.form('get values');
        //----------------
        var pEncrypt = $scope.usuario.Apodo + allFields.Password_old;
        $scope.temp = encrypt(pEncrypt);

        if (angular.equals($scope.temp, $scope.usuario.Hash)) {
            if (!angular.equals("", allFields.Password_new)) {
                pEncrypt = allFields.Apodo + allFields.Password_new;
                $scope.temp = encrypt(pEncrypt);
            } else {
                allFields.Password_new = allFields.Password_old;
                pEncrypt = allFields.Apodo + allFields.Password_old;
                $scope.temp = encrypt(pEncrypt);
            }

            allFields.Hash = $scope.temp;
            allFields.Foto = $scope.miImagen;
            allFields.Id = $scope.usuario.Id_Usuario;
            $http.post('_wing-watch-core/components/editarUsuario/editarUsuario.php', allFields)
                .success(function(data) {
                    if (data === 'actualizado') {
                        $scope.actualizarStorage(allFields.Apodo);
                    }
                });
        } else {
            swal('Ingrese la contraseña', 'Por favor ingrese la contraseña de usuario para editar su perfil', 'error');
        }


    };

    $scope.goHome = function() {
        $location.path('/home');
    }

    $scope.actualizarStorage = function(apodo) {
        var user = {};
        user.apodo = apodo;
        console.log(user.apodo);
        $promise = $http.post('_wing-watch-core/components/login-registro/login/getUser.php', user)
            .success(function(msg) {
                var masterUser = null;
                masterUser = msg[0];

                sessionStorage.user = JSON.stringify(masterUser);
                swal({
                    title: "¡Listo!",
                    type: "success",
                    timer: 2000,
                    showConfirmButton: false
                });
            });
        $location.path('/home');
        history.go(0);

    };


    $('.test.radio.checkbox').checkbox();

    /**
     * Setear Usuario Original
     * 
     */

    $scope.usuario = JSON.parse(sessionStorage.user);
    $scope.miImagen = $scope.usuario.Foto;
    $('.ui.form.editarPerfil')
        .form('set values', $scope.usuario);
    //---------
    $('.ui.form.editarPerfil')
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
                    type: 'integer',
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
