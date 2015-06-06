'use strict';
app.controller('registerBirdCtrl', function($scope, $http) {
    $scope.myImage = '';
    $scope.myCroppedImage = '';
    $scope.eggAmount = 0;
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

    $scope.eliminarImagen = function(pImage) {
        var deleteIndex = $scope.photoAlbum.indexOf(pImage);
        $scope.photoAlbum.splice(deleteIndex, 1);
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
        orden: {
            identifier: 'orden',
            rules: [{
                type: 'empty',
                prompt: 'Por favor, ingrese un orden'
            }]
        },
        geoZone: {
            identifier: 'geoZone',
            rules: [{
                type: 'empty',
                prompt: 'Por favor, ingrese una zona geográfica'
            }]
        },
        nomComun: {
            identifier: 'nomComun',
            rules: [{
                type: 'empty',
                prompt: 'Por favor, ingrese un nombre común'
            }]
        },
        nomIngles: {
            identifier: 'nomIngles',
            rules: [{
                type: 'empty',
                prompt: 'Por favor, ingrese un nombre en inglés'
            }]
        },
        suborden: {
            identifier: 'suborden',
            rules: [{
                type: 'empty',
                prompt: 'Por favor, ingrese un suborden'
            }]
        },
        familia: {
            identifier: 'familia',
            rules: [{
                type: 'empty',
                prompt: 'Por favor, ingrese una familia'
            }]
        },
        especie: {
            identifier: 'especie',
            rules: [{
                type: 'empty',
                prompt: 'Por favor, ingrese una especie'
            }]
        },
        genero: {
            identifier: 'genero',
            rules: [{
                type: 'empty',
                prompt: 'Por favor, ingrese un género'
            }]
        },
        pico: {
            identifier: 'pico',
            rules: [{
                type: 'empty',
                prompt: 'Por favor, seleccione un tipo de pico'
            }]
        },
        tamanio: {
            identifier: 'tamanio',
            rules: [{
                type: 'empty',
                prompt: 'Por favor, seleccione un tamaño'
            }]
        },
        color: {
            identifier: 'color',
            rules: [{
                type: 'checked',
                prompt: 'Seleccione al menos un color'
            }]
        }

    }, {
        keyboardShortcuts: false,
        inline: true,
        on: 'submit',
        transition: 'fade down'
    });
}

window.onhashchange = function() {
    history.go(0);
}