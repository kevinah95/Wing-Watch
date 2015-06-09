app.controller('migracionCtrl', function($scope, $http, $location) {
    $scope.goHome = function() {
        $location.path('/home');
    }
    $scope.iniciar = function() {
        $scope.tablas = ['catalogo_cantidad_huevos', 'catalogo_clase', 'catalogo_color', 'catalogo_especie', 'catalogo_familia', 'catalogo_genero', 'catalogo_orden', 'catalogo_suborden', 'catalogo_tipo_pico', 'catalogo_zona_vida', 'colores_x_pajaro', 'correo', 'email', 'fotos', 'pajaro_x_persona', 'persona', 'picos_x_pajaro', 'telefono', 'tipo_usuario', 'usuario', 'zonas_x_pajaro'];
    }
    $scope.exportar = function(tabla) {


        $http({
            method: 'POST',
            url: '_wing-watch-core/components/migracion/migracion.php',
            data: tabla
        }).
        success(function(data, status, headers, config) {
            var anchor = angular.element('<a/>');
            anchor.attr({
                href: 'data:attachment/csv;charset=utf-8,' + encodeURI(data),
                target: '_blank',
                download: tabla + '.csv'
            })[0].click();

        }).
        error(function(data, status, headers, config) {
            // if there's an error you should see it here
        });
    }
});
