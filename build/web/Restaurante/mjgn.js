// JavaScript Document
function cargaSimple (id_objeto, page_url, forma) {
		forma = (typeof forma === "undefined") ? "none" : forma;
		var n=page_url.indexOf("?");
		if (n==-1) {
			page_url+="?cargaSimple=true";
		}
		var paginaInterna = new  XMLHttpRequest();
		if (forma!="none") {
		   var parametros = $("#"+forma).serialize();
		   page_url+="&"+parametros;
		}
		paginaInterna.open("GET",page_url);
		paginaInterna.id_objeto = new String(id_objeto);
		paginaInterna.onreadystatechange = function () {
			if (this.readyState==3 || this.readyState==2) {
				document.getElementById(this.id_objeto).innerHTML="Cargando Contenido...";
			}
			if (this.readyState!=4) {
				return false;
			} else  {
				document.getElementById(this.id_objeto).innerHTML=this.responseText;
				if (cargaJS(document.getElementById(this.id_objeto))) {
					getReady();
				}
			}
		}
		paginaInterna.send();
}

function cargaJS(objeto) {
	cnodos=objeto.childNodes.length;
	conjs=false;
	for (cuentaNodos=0;cuentaNodos<cnodos;cuentaNodos++) {
		if (objeto.childNodes[cuentaNodos].nodeName=="SCRIPT") {
			window.eval(objeto.childNodes[cuentaNodos].childNodes[0].nodeValue);
			conjs=true;
		}
	}
	return conjs;
}
