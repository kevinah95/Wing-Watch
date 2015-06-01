app.controller('homeCtrl', function($scope, $http) {
    $('.ui.sidebar').sidebar('attach events', '.uiside', 'toggle');
    $('.dropdown').dropdown({transition: 'drop'});

    window.onload = function(){
        var container = document.getElementById("TJS");
        var 
            model = getRandomInt(0,models.length - 1);
            camera = new THREE.PerspectiveCamera( 12, window.innerWidth / window.innerHeight, 1, 10000000);
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
    
    var models = [  "assets/models/eagle.json", "assets/models/condor.json", "assets/models/goose.json", 
            "assets/models/gull.json", "assets/models/hummingbird.json", 
            /*"assets/models/cardinal1.json", //Más grande
            "assets/models/cardinal2.json", //Más grande
            "assets/models/swan.json", //Más pequeño
            "assets/models/falcon.json", //Más grande
            "assets/models/bluejay.json", //Más grande
            "assets/models/dove.json",  //Más grande
            "assets/models/chickadee.json", //Más grande
            "assets/models/penguin.json", //Más pequeño
            "assets/models/duck.json",  //Un poco más grande
            "assets/models/crow.json",  //Más grande
            "assets/models/eagle2.json", //Más grande
            /**/
        ];
});
