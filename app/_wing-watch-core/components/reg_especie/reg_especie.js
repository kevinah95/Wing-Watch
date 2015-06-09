app.controller('reg_especieCtrl', ['$scope', '$http', '$location', function($scope, $http, $location) {
    $scope.especie = '';
    $scope.deshabilitar = function(deshabilitador, habilitador, isVacio) {
        if (isVacio.length != 0) {
            $scope[deshabilitador] = true;
            $scope[habilitador] = false;
        }
    };

    $scope.cargarEspecies = function() {
        var $promise = $http.get('_wing-watch-core/components/reg_especie/funciones_php/select_especies.php');
        $promise.then(function(msg) {
            $scope.catalogoEspecies = msg.data;
        });
    };
    $scope.continuarEspecie = function() {
        if ($scope.especie.length != 0) {
            var index = $scope.catalogoEspecies.map(function(d) {
                return d['ESPECIE'];
            }).indexOf($scope.especie);
            if (index === -1) {
				$scope.cargarTodoGeneros();
            } else {
                swal({   title: "Datos duplicados",   text: "La especie ya se encuentra en el sistema",    showConfirmButton: false });
                setInterval(function () {history.go(0); }, 2000);
                // $scope.FK_GENERO = $scope.catalogoEspecies[index].FK_GENERO;
                // $scope.cargarGenero();
            }

        };
    };
    $scope.cargarTodoGeneros = function() {
        var $promise = $http.get('_wing-watch-core/components/reg_especie/funciones_php/select_Todogeneros.php');
        $promise.then(function(msg) {
            $scope.catalogoGenero = msg.data;
        });
    };
    $scope.cargarGenero = function() {
        var $promise = $http.post('_wing-watch-core/components/reg_especie/funciones_php/select_genero.php', $scope.FK_GENERO);
        $promise.then(function(msg) {
            $scope.catalogoGenero = msg.data;
        });
    };
    $scope.continuarGenero = function() {
        if ($scope.genero.length != 0) {
            var index = $scope.catalogoGenero.map(function(d) {
                return d['GENERO'];
            }).indexOf($scope.genero);
            
            $scope.genero = $scope.catalogoGenero[index];
            // console.log($scope.genero);
            $scope.FK_FAMILIA = $scope.catalogoGenero[index].FK_FAMILIA;
            $scope.cargarFamilia();
        };
    };
    $scope.cargarFamilia = function() {
        var $promise = $http.post('_wing-watch-core/components/reg_especie/funciones_php/select_familia.php', $scope.FK_FAMILIA);
        $promise.then(function(msg) {
            $scope.catalogoFamilia = msg.data;
        });
    };
    $scope.continuarFamilia = function() {
        if ($scope.familia.length != 0) {
            var index = $scope.catalogoFamilia.map(function(d) {
                return d['FAMILIA'];
            }).indexOf($scope.familia);

            $scope.familia = $scope.catalogoFamilia[index];
            // console.log($scope.familia);
            $scope.FK_SUBORDEN = $scope.catalogoFamilia[index].FK_SUBORDEN;
            $scope.cargarSuborden();
        };
    };
    $scope.cargarSuborden = function() {
        var $promise = $http.post('_wing-watch-core/components/reg_especie/funciones_php/select_suborden.php', $scope.FK_SUBORDEN);
        $promise.then(function(msg) {
            $scope.catalogoSuborden = msg.data;
        });
    };
    $scope.continuarSuborden = function() {
        if ($scope.suborden.length != 0) {
            var index = $scope.catalogoSuborden.map(function(d) {
                return d['SUBORDEN'];
            }).indexOf($scope.suborden);

            $scope.suborden = $scope.catalogoSuborden[index];
            // console.log($scope.suborden);
            $scope.FK_ORDEN = $scope.catalogoSuborden[index].FK_ORDEN;
            $scope.cargarOrden();
        };
    };
    $scope.cargarOrden = function() {
        var $promise = $http.post('_wing-watch-core/components/reg_especie/funciones_php/select_orden.php', $scope.FK_ORDEN);
        $promise.then(function(msg) {
            $scope.catalogoOrden = msg.data;
        });
    };
    $scope.continuarOrden = function() {
        if ($scope.orden.length != 0) {
            var index = $scope.catalogoOrden.map(function(d) { return d['ORDEN']; }).indexOf($scope.orden);
            // $scope.FK_ORDEN = $scope.catalogoSuborden[index].FK_ORDEN;
            $scope.orden = $scope.catalogoOrden[index];
            // console.log($scope.orden);
            $scope.cargarPico();
        };
    };
    $scope.cargarPico = function() {
        var $promise = $http.get('_wing-watch-core/components/reg_especie/funciones_php/select_pico.php');
        $promise.then(function(msg) {
            $scope.catalogoPico = msg.data;
            // console.log($scope.catalogoOrden);
        });
    };
    $scope.continuarPico = function() {
        if ($scope.pico.length != 0) {
            $scope.cargarColor();
        };
    };
    $scope.cargarColor = function() {
        var $promise = $http.get('_wing-watch-core/components/reg_especie/funciones_php/select_color.php');
        $promise.then(function(msg) {
            $scope.catalogoColor = msg.data;
            // console.log($scope.catalogoOrden);
        });
    };
    $scope.continuarColor = function() {
        if ($scope.color.length != 0) {
            $scope.cargarZona();
        };
    };

    $scope.goHome = function() {
        $location.path('/home');
    }


    $scope.cargarZona = function() {
        var $promise = $http.get('_wing-watch-core/components/reg_especie/funciones_php/select_zona_vida.php');
        $promise.then(function(msg) {
            $scope.catalogoZona = msg.data;
            // console.log($scope.catalogoOrden);
        });
    };
    $scope.insertarEspecie = function(){
        var $form = $('.form.especie'),
            allFields = $form.form('get values');
        allFields.genero = $scope.genero;
        allFields.familia = $scope.familia;
        allFields.orden = $scope.orden;
        allFields.suborden = $scope.suborden;
        console.log(allFields);

    };
}]);
