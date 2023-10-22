import excepciones.*

object libre {
	/* Punto 2 Parte 2 */
	method jugar(unJugador){
		try{
			unJugador.jugarHabiendoTirado(unJugador.tirarDadosException())
		}
		catch dobleDobleException : SacoDoblesException{
			unJugador.irPreso()
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
		catch quedoEnLibertad : ExcepcionesDeEstadoDelJugador {
			self.quedoEnLibertad(unJugador)
		}
	}
	
	method quedoEnLibertad(unJugador){
		unJugador.quedarEnLibertad()
		unJugador.jugar()
	}
	method turnosEnPrisionRestantes() = turnosEnPrisionRestantes
}