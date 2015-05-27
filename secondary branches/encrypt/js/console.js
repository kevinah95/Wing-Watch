//Escribe un string en la emulación de consola. 
function print(pString){
	var txtDiv = document.getElementById("textDiv");
	var newP = document.createElement("p");    
	newP.innerHTML += pString.toString();
	txtDiv.appendChild(newP);
}

//toString de la lista de palabras. 
function presentWordsList(pListToShow) {
	var txtDiv = document.getElementById("textDiv");
	var newP = document.createElement("p");    
	for (listIndex = 0; listIndex < pListToShow.length; listIndex++) {
		newP.innerHTML += pListToShow[listIndex].toString();
		newP.innerHTML += " | ";
	}
	txtDiv.appendChild(newP);
}
