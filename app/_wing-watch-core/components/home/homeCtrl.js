app.controller('homeCtrl', function($scope, $http, $location) {
    
    var models = [  "assets/models/eagle.json", "assets/models/condor.json", "assets/models/goose.json", 
            "assets/models/gull.json", "assets/models/hummingbird.json", "assets/models/cardinal1.json", 
            "assets/models/cardinal2.json", "assets/models/swan.json","assets/models/falcon.json", 
            "assets/models/bluejay.json", "assets/models/dove.json",  "assets/models/chickadee.json", 
            "assets/models/duck.json",  "assets/models/crow.json",  "assets/models/eagle2.json",
            /*"assets/models/penguin.json"*/
        ];

    $scope.islogged= function(){
        var logeado = sessionStorage.getItem("islogged"); 
        return (logeado === null || logeado === "null") ? false : true;
    };
    
    if (!$scope.islogged()){
        swal({title: "No ha iniciado sesión", text: "Será redirigido al log in", type:"error"}, 
            function(){
                $scope.$apply($location.path('/login'));
            });
    }
    else {
        $scope.usuarioInfo = JSON.parse(sessionStorage.user);     
    }

    window.onload = function(){

        if (!$scope.islogged()){
            swal({title: "No ha iniciado sesión", text: "Será redirigido al log in", type:"error"}, 
                function(){
                    $scope.$apply($location.path('/login'));
                });
        }
        else {
            $scope.usuarioInfo = JSON.parse(sessionStorage.user);     
        }
            
        $('.ui.sidebar').sidebar('attach events', '.uiside', 'toggle');
        $('.dropdown').dropdown({transition: 'drop'});


        $('.dropdown.config').popup({
            position: 'bottom left',
            title   : 'Configuración',
            target   : '.ui.icon.asd',
            content : 'Haga cambios en la configuración o vea la documentación'
            });

        $('.dropdown.newBird').popup({
            position: 'bottom left',
            title   : 'Cambiar ave',
            target   : '.ui.icon.asd',
            content : 'Reinicia el modelo tridimensional'
            });

        $('.dropdown.login').popup({
            position: 'bottom left',
            title   : 'Cerrar sesión',
            target   : '.ui.icon.asd',
            content : 'Le enviará a la página de inicio de sesión'
            });

        $('.dropdown.migrate').popup({
            position: 'bottom left',
            title   : 'Exportar/Importar datos',
            target   : '.ui.icon.asd',
            content : 'En construcción'
            });

        $('.dropdown.users').popup({
            position: 'bottom left',
            title   : 'Usuarios',
            target   : '.ui.icon.asd',
            content : 'Le llevará a la página de usuarios'
            });

        $('.dropdown.gallery').popup({
            position: 'bottom left',
            title   : 'Galería',
            target   : '.ui.icon.asd',
            content : 'Vea las aves que nuestros usuarios han encontrado'
            });

        $('.dropdown.addBird').popup({
            position: 'bottom left',
            title   : 'Nuevo álbum',
            target   : '.ui.icon.asd',
            content : '¿Le tomaste foto a un ave? ¡Compártelo!'
            });
        
        $('.dropdown.regNewSpecie').popup({
            position: 'bottom left',
            title   : 'Insertar nueva especie',
            target   : '.ui.icon.asd',
            content : '¿Viste una especie que no manejamos? ¡Agrégala!'
            });

        loadThreeJSModel();
        $scope.usuarioInfo = JSON.parse(sessionStorage.user);
    }

    $scope.abrirEditarPerfil = function() {
        $location.path('/editarUsuario');
    };
    
    function loadThreeJSModel() {
        document.getElementById("TJS").innerHTML = "";
        
        var container = document.getElementById("TJS");
        var 
            model = getRandomInt(0,models.length - 1);
            camera = new THREE.PerspectiveCamera( 12, window.innerWidth / window.innerHeight, 1, 10000000),
            camControl = new THREE.OrbitControls( camera ),
            shapeObjectUrl = models[model],
            scene = new THREE.Scene(),
            renderer = new THREE.WebGLRenderer({ antialias: false }),
            loader = new THREE.JSONLoader();

        renderer.setSize(container.clientWidth, container.clientHeight );
        renderer.setClearColor( 0xF7F7F7, 1);
        container.appendChild(renderer.domElement);
        window.addEventListener( 'resize', onWindowResize, false );
        camControl.autoRotate = true;
        
        loader.load( shapeObjectUrl, 
            function ( geometry, materials ) {
                var mesh = new THREE.Mesh( geometry, new THREE.MeshBasicMaterial({color: 0x000000}) );
                var bb = new THREE.Box3()
                bb.setFromObject(mesh);
                bb.center(camControl.target);

                camera.position.z = 8 * bb.size().z;
                camera.position.y = 1;
                scene.add( mesh );
                render();
        });
        
        camera.position.z = 5;
        var render = function () {
            requestAnimationFrame(render);
            renderer.render(scene, camera);
        };
        animate();
        
        function animate() {
            requestAnimationFrame(animate);
            camControl.update();
        }


        function getRandomInt(pMin, pMax) {
            return Math.floor(Math.random() * (pMax - pMin + 1)) + pMin;
        }

        function onWindowResize() {
            camera.aspect = window.innerWidth / window.innerHeight;
            camera.updateProjectionMatrix();
            renderer.setSize( window.innerWidth, window.innerHeight );
            render();
        }
    }
    
    $scope.transit = function(){
        $('.homeDiv').transition('vertical flip');
        loadThreeJSModel();
        $('.homeDiv').transition('horizontal flip');
    }

    $scope.login = function(){
        sessionStorage.removeItem('user');
        sessionStorage.removeItem('islogged');
        $location.path('/login');
        history.go(0);
    }

    $scope.users = function(){
        $scope.$apply($location.path('/users'));
    }

    $scope.gallery = function(){
        $scope.$apply($location.path('/birds'));
    }

    $scope.addBird = function(){
        $scope.$apply($location.path('/registerBird'));
    }

    $scope.newSpecie = function(){
        $scope.$apply($location.path('/reg_especie'));
    }

    $scope.migration = function(){
        swal({title: "No es posible migrar aún", 
            text: "Esta funcionalidad aún está en construcción, sin embargo es posible exportar", 
            type:"error"},function(){
                $scope.$apply($location.path('/migracion'));
            });

    }

    window.onhashchange = function(){
        history.go(0);
    }    
});
