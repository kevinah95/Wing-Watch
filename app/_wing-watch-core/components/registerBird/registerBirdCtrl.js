'use strict';
app.controller('registerBirdCtrl', function($scope, $http) {
    $scope.myImage = '';
    $scope.myCroppedImage = '';
    $scope.eggAmount = 0;
    $scope.eggAmount2 = 0;
    $scope.photoAlbum = [];
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

    $scope.abrir = function() {
        $('.small.test.modal')
            .modal({
                onDeny: function() {
                    // window.alert('Wait not yet!');
                },
                onApprove: function() {
                    $scope.photoAlbum.unshift($scope.myCroppedImage);
                    $scope.$apply();
                }
            })
            .modal('show');
    };

    $scope.subtractEgg = function() {
        if($scope.eggAmount != 0) {
            $scope.eggAmount -= 1;
        }
    }
    $scope.subtractEgg2 = function() {
        if($scope.eggAmount2 != 0) {
            $scope.eggAmount2 -= 1;
        }
    }

    $scope.eliminarImagen = function(pImage) {
        var deleteIndex = $scope.photoAlbum.indexOf(pImage);
        $scope.photoAlbum.splice(deleteIndex, 1);
    }
    $scope.registrarAve = function(){
    //$scope.insertarAve = {};
    var $form = $('.registro.form'),
    allFields = $form.form('get values');
    allFields.cantHuevosMin = $scope.eggAmount;
    allFields.cantHuevosMax = $scope.eggAmount;
    console.log(allFields);
    console.log(allFields.color.length);
    console.log(allFields.zona.length);
    console.log(allFields.pico.length);
    //$scope.insertarAve.idPersona = $SessionStoragge.user.ID;
    //$scope.insertarAve.cedula = $SessionStorage.user.cedula;

    //$http.post('php/registrarAve.php', $scope.insertarAve).success(function(message) {
    //console.log(message.data);
    //$scope.pajaroActual = message.data;    
  //})
    }
});

window.onload = function () {
    $('.test.radio.checkbox').checkbox();
    $('.help.circle.icon').popup({
        position: 'right center',
        title: '¿Qué es la taxonomía?',
        content: 'Es la ciencia de la clasificación de la biología para la ordenación sistemática de animales y vegetales. Aquí debe poner cómo se clasifica científicamente el ave que quiere ingresar. Si no sabe algún campo, entonces elija Incertae Sedis.'
    });
    $('.ui.selection.dropdown').dropdown();
    $('.ui.accordion').accordion();
    $('.ui.accordion .ui.checkbox').checkbox();
    $('.ui.form.registro')
    .form({
    }, {
        keyboardShortcuts: false,
        inline: true,
        on: 'blur',
        transition: 'fade down'
    });
}


window.onhashchange = function() {
    history.go(0);
}