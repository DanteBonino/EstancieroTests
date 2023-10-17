import excepciones.*

object estandar {
	method validarCompra(_unaPropiedad,_unJugador){
		/* No hace nada */
	}
	
	method validarCompraV2(_unaPropiedad,_unJugador){
		/* No hace nada */
	}
}

object garca {
	/* Version 1 */
	method validarCompra(unaPropiedad, unJugador){
		unaPropiedad.validarSiLoCompraElGarca(unJugador)
	}
	
	/* Version 2 */
	method validarCompraV2(unaPropiedad, unJugador){
		unaPropiedad.validarSiLaCompra(unJugador,self)
	}
	
	method validarSiLaEmpresaCumpleLosRequisitos(unJugador, elJuego){
		if(!elJuego.algunOtroJugadorTieneAlgunaEmpresa(unJugador)) throw ningunOtroJugadorTieneUnaEmpresa
	}
	
	method validarSiElCampoCumpleLosRequisitos(unJugador, unaProvincia, elBanco){
		if(not (unaProvincia.algunOtroJugadorTieneAlgunCampo(unJugador))) throw ningunOtroJuegadorTieneUnCampoEnLaProvincia
	}
}

object imperialista {
	/* Version 1 */
	method validarCompra(unaPropiedad, unJugador){
		unaPropiedad.validarSiLoCompraElImperialista(unJugador)
	}
	
	/* Version 2 */
	method validarCompraV2(unaPropiedad, unJugador){
		unaPropiedad.validarSiLaCompra(unJugador,self)
	}
	
	method validarSiLaEmpresaCumpleLosRequisitos(unJugador, elJuego){
    	if(not(elJuego.ningunJugadorTieneEmpresa())) throw lasEmpresasNoSonUnMonopolioDelBanco
    }
    
    method validarSiElCampoCumpleLosRequisitos(unJugador, unaProvincia, elBanco){
		if(not(unaProvincia.esMonopolioDe(elBanco) or unaProvincia.tieneAlgunCampo(unJugador))) throw elImperialistaNoCompraLaPropiedad
	}
}

