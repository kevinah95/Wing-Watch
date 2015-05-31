var models = ["bird models/eagle.json", 
                "bird models/condor.json", 
                "bird models/goose.json",
                "bird models/gull.json",
                "bird models/hummingbird.json",
                /*
                "bird models/cardinal1.json", //Más grande
                "bird models/cardinal2.json", //Más grande
                "bird models/swan.json", //Más pequeño
                "bird models/falcon.json", //Más grande
                "bird models/bluejay.json", //Más grande
                "bird models/dove.json",  //Más grande
                "bird models/chickadee.json", //Más grande
                "bird models/penguin.json", //Más pequeño
                "bird models/duck.json",  //Un poco más grande
                "bird models/crow.json",  //Más grande
                "bird models/eagle2.json", //Más grande
                /**/
              ];

/*OK
CONDOR
GULL
GOOSE
EAGLE1
HUMMING BIRD
*/

window.onload = function() {
    var container = document.getElementById("TJS");
    var 
        model = getRandomInt(0,models.length - 1);
        print(models[model]);
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
            var     
                mesh = new THREE.Mesh( geometry, new THREE.MeshBasicMaterial({color: 0x000000}) );
            scene.add( mesh );
            render();
    });
    
    camera.position.z = 5;

    var render = function () {
        requestAnimationFrame(render);
        renderer.render(scene, camera);
    };
    animate();
    

$('.dropdown').hover(function(){ 
  $('.dropdown-toggle', this).trigger('click'); 
});
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
