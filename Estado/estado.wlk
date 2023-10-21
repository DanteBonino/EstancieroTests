import excepciones.*

object libre {
	/* Punto 2 Parte 2 */
	method jugar(unJugador){
		try{
			const cantidadObtenida = unJugador.tirarDadosUnaVez()
			unJugador.jugarHabiendoTirado(cantidadObtenida)
		}
		catch primerTiroException : SacoDoblesException {
    		try {
      			unJugador.jugarHabiendoTirado(unJugador.tirarDadosUnaVez() + primerTiroException.valorDelTiro())
    		}
    		catch segundoTiroException : SacoDoblesException {
      			unJugador.irPreso()
    		}
		}
	
	}
	method turnosEnPrisionRestantes() = 0
}


class Preso {
	/* Punto 2 Parte 2 */
	var turnosEnPrisionRestantes = 3
	method jugar(unJugador){
		try{
			if(turnosEnPrisionRestantes == 0) throw new EsLibre()
			turnosEnPrisionRestantes --
			unJugador.tirarDadosUnaVez()
		}
		catch primerTiroException : SacoDoblesException {
			self.quedoEnLibertad(unJugador)
		}
		catch quedoEnLibertad     : EsLibre {
			self.quedoEnLibertad(unJugador)
		}	
	}
	
	method quedoEnLibertad(unJugador){
		unJugador.quedarEnLibertad()
		unJugador.jugar()
	}
	method turnosEnPrisionRestantes() = turnosEnPrisionRestantes
}
