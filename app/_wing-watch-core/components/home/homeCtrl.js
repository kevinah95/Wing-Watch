app.controller('homeCtrl', function($scope, $http, $location) {
    
    var models = [  "assets/models/eagle.json", "assets/models/condor.json", "assets/models/goose.json", 
            "assets/models/gull.json", "assets/models/hummingbird.json", "assets/models/cardinal1.json", 
            "assets/models/cardinal2.json", "assets/models/swan.json","assets/models/falcon.json", 
            "assets/models/bluejay.json", "assets/models/dove.json",  "assets/models/chickadee.json", 
            "assets/models/duck.json",  "assets/models/crow.json",  "assets/models/eagle2.json",
            /*"assets/models/penguin.json"*/
        ];
            
    window.onload = function(){
        $('.ui.sidebar').sidebar('attach events', '.uiside', 'toggle');
        $('.dropdown').dropdown({transition: 'drop'});

        loadThreeJSModel();
    }

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
        console.clear();
    }

    
    $scope.transit = function(){
        $('.homeDiv').transition('vertical flip');
        loadThreeJSModel();
        $('.homeDiv').transition('horizontal flip');
    }

    $scope.login = function(){
        $location.path('/login');
        history.go(0);
    }

    window.onhashchange = function(){
        history.go(0);
    }
});
