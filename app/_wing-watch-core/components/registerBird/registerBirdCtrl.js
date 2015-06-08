'use strict';
app.controller('registerBirdCtrl', function($scope, $http) {
    $scope.myImage = '';
    $scope.myCroppedImage = '';
    $scope.eggAmount = 0;
    $scope.imgInsert = {};
    $scope.eggAmount2 = 0;
    $scope.photoAlbum = [];
    $scope.idSeleccionada = 0;
    $scope.nombreComunSeleccionada = 'Nombre Común';
    $scope.nombreInglesSeleccionada = 'Nombre en Inglés';
    $scope.especieSeleccionada = 'Especie';
    $scope.generoSeleccionada = 'Género';
    $scope.familiaSeleccionada = 'Familia';
    $scope.subordenSeleccionada = 'Suborden';
    $scope.ordenSeleccionada = 'Orden';
    $scope.claseSeleccionada = 'Clase';
    $scope.colorSeleccionado = 'Color Principal';
    $scope.zonaSeleccionado = 'Zona de Vida';
    $scope.picoSeleccionado = 'Tipo de Pico';
    $scope.listaPicos = [];
    $scope.estaApretado = false;

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
            $scope.eggAmount2 -= 1;}        
    }
    $scope.cargarEspecies = function(){
        $scope.especies = {};
        $http.get('_wing-watch-core/components/registerBird/php/cargarEspecies.php').success(function(data) { $scope.especies = data; });
    }
    $scope.cargarZonas = function(){
        $scope.zonas = {};
        $http.get('_wing-watch-core/components/registerBird/php/cargarZonas.php').success(function(datos) { $scope.zonas = datos;});
    }
    $scope.cargarColores = function(){
        $scope.colores = {};
        $http.get('_wing-watch-core/components/registerBird/php/cargarColores.php').success(function(data) { $scope.colores = data; });
    }
    $scope.cargarPicos = function(){
        $scope.picos = {};
        $http.get('_wing-watch-core/components/registerBird/php/cargarPicos.php').success(function(data) { $scope.picos = data; });
    }
    $scope.setearEspecie = function(id,especie,nombreC,nombreI,genero,familia,suborden,orden,clase){
        $scope.idSeleccionada = id;
        $scope.nombreComunSeleccionada = nombreC;
        $scope.nombreInglesSeleccionada = nombreI;
        $scope.especieSeleccionada = especie;
        $scope.generoSeleccionada = genero;
        $scope.familiaSeleccionada = familia;
        $scope.subordenSeleccionada = suborden;
        $scope.ordenSeleccionada = orden;
        $scope.claseSeleccionada = clase;
    }
    $scope.setearColor = function(color){
        $scope.colorSeleccionado = color;
    }
    $scope.setearPico = function(pico){
        $scope.picoSeleccionado = pico;
    }
    $scope.setearZona = function(zona){
        $scope.zonaSeleccionado = zona;
    }

    $scope.eliminarImagen = function(pImage) {
        var deleteIndex = $scope.photoAlbum.indexOf(pImage);
        $scope.photoAlbum.splice(deleteIndex, 1);
    }
    $scope.guardarPicos = function(picoN){
        $scope.listaPicos.push(picoN);
    }

    $scope.registrarAve = function(){
        var $form = $('.registro.form'),
        allFields = $form.form('get values');
        allFields.especie = $scope.idSeleccionada;
        allFields.cantHuevosMin = $scope.eggAmount;
        allFields.cantHuevosMax = $scope.eggAmount2;
        allFields.pico = $scope.picoSeleccionado;
        allFields.zona = $scope.zonaSeleccionado;
        allFields.colorA = $scope.colorSeleccionado;
        allFields.imagenes = $scope.photoAlbum;
        allFields.cedula = JSON.parse(sessionStorage.user.Cedula);
        allFields.Id_Usuario = JSON.parse(sessionStorage.user.Id_Usuario);
        console.log(allFields);
        $http.post('_wing-watch-core/components/registerBird/php/registrarAve.php', allFields).success(function(message) {
        console.log(message);
        $scope.idAve = message;
        $scope.insertarImagenes();})
    }
    $scope.insertarImagenes = function(){
        for (i = 0; i < $scope.photoAlbum.length; i++) { 
            console.log(i);
            $scope.imgInsert.URL = $scope.photoAlbum[i];
            $scope.imgInsert.NOMBRE = 'NOMBRE_FOTO';
            $scope.imgInsert.ID = $scope.idAve;
            $http.post('_wing-watch-core/components/registerBird/php/registrarImagen.php', $scope.imgInsert).success(function(message) {
        console.log(message); })
        }
    }

    $scope.servi = function(data,value) {
        if($scope.estaApretado) {
            console.log(data);
        }
        else {
            console.log("Ya no esta apretado");
        }
        console.log($scope.picos[value]);
    }

    $scope.activar = function() {
        $scope.estaApretado = true;
    }

    $scope.desActivar = function() {
        $scope.estaApretado = false;
    }
});

window.onload = function () {
    //$('.test.radio.checkbox').checkbox();
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

function act() {
    var scope = angular.element(document.getElementById("mainWrap")).scope();
    scope.activar();
    scope.desActivar();
}