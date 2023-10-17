import excepciones.*

object libre {
	method jugar(unJugador){
		try{
			return unJugador.tirarDadosUnaVez()
		}
		catch primerTiroException : SacoDoblesException {
    		try {
      			return unJugador.tirarDadosUnaVez() + primerTiroException.valorDelTiro()
    		}
    		catch segundoTiroException : SacoDoblesException {
      			throw new VaPreso()
    		}
		}
	
	}
	method turnosEnPrisionRestantes() = 0
}


class Preso {
	var turnosEnPrisionRestantes = 3
	method jugar(unJugador){
		try{
			if(turnosEnPrisionRestantes == 0) throw new EsLibre()
			turnosEnPrisionRestantes --
			unJugador.tirarDadosUnaVez()
		}
		catch primerTiroException : SacoDoblesException {
			throw new EsLibre()
		}	
	}
	method turnosEnPrisionRestantes() = turnosEnPrisionRestantes
}
