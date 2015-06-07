'use strict'
app.controller('loginCtrl', function($scope,$http,$location) {
    function encrypt(pString){
        var hash = CryptoJS.MD5(pString).toString();
        return hash;
    }

    $scope.login = function() {
        var $form = $('.form.login'),
            allFields = $form.form('get values');

        $form.form('validate form'); //verificar formulario validado

        allFields.hashpass = allFields.apodo + allFields.password;
        allFields.hashpass = encrypt(allFields.hashpass);

        //console.log(allFields.apodo);
        //console.log(allFields.hashpass);

        var $promise=$http.post('_wing-watch-core/components/login-registro/login/logIn.php',allFields); 
        $promise.then(function(msg){
            var uid=msg.data;
            console.log(uid)
            if(uid === "Not Found"){
                swal({title: "Información Incorrecta", text: "Su apodo o contraseña no coinciden con nuestros clientes", type:"error"}, function(){history.go(0);});
                $location.path('/login');
            }          
            else  {                    
                sessionStorage.setItem("islogged" , true);

                $promise = $http.post('_wing-watch-core/components/login-registro/login/getUser.php', allFields)
                    .success(function(msg) {
                        var masterUser = null;    
                        masterUser = msg[0];

                        sessionStorage.user = JSON.stringify(masterUser);             
                });
            $location.path('/home');
            history.go(0);
            }                  
        });


    };

    //Destruye la variable que valida si el usuario está logueado y devuelve a la página de inicio. 
    $scope.logout = function(){
        sessionService.destroy('user');
        sessionService.destroy('islogged');
        $location.path('/inicio');
    };

    //Booleano que valida si hay un usuario logueado. 
    $scope.islogged= function(){
        var logeado = sessionStorage.getItem("islogged"); 
        return (logeado === null || logeado === "null") ? false : true;
    };

    //Login Form    
    $('.ui.form.login')
        .form({
            apodo: {
                identifier: 'apodo',
                rules: [{
                    type: 'empty',
                    prompt: 'Por favor, ingrese su correo electrónico'
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
    });