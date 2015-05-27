function main () {
	print("Testing encryption");

	var str = "Aloha";
	print("I will encrypt the string: " + str);
	print("MD5 encryption: " + encrypt(str));

}


//Requiere el javascript de CryptoJS
function encrypt(pString){
    var hash = CryptoJS.MD5(pString);
    return hash;
}
