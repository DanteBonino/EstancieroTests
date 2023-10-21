import excepciones.*

object estandar {
	method validarCompra(_unaPropiedad,_unJugador){
		/* No hace nada */
	}
	
	method validarCompraV2(_unaPropiedad,_unJugador){
		/* No hace nada */
	}
	
	/* Version actual */
	method esComprable(_unaPropiedad,_unJugador) = true
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
	
	/* Version actual */
	method esComprable(unaPropiedad, unJugador){
		return unaPropiedad.hayOtrosDueniosEnElRubro(unJugador)
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
	
	/* Version 	3 No funciona pq no te dice lo que queres */
	/*method esComprable(unaPropiedad, unJugador){
		return not (unaPropiedad.hayOtrosDueniosEnElRubro(unJugador))
	}*/
	
	/* Version actual */
	method esComprable (unaPropiedad, unJugador){
		return unaPropiedad.esComprablePor(unJugador, self)
	}
	
	method esComprableElCampo(unJugador, unaPropiedad){
		return unaPropiedad.elRubroEsMonopolioDelBanco() or unaPropiedad.elJugadorEsDuenioDeAlgunaPropiedadDelRubro(unJugador)
	}
	
	method esComprableLaEmpresa(unJugador, unaPropiedad){
		return unaPropiedad.elRubroEsMonopolioDelBanco()
	}
}
