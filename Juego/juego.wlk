import tablero.*
import casillerosEspeciales.*
import excepciones.*

class Juego {
	const property jugadores = []
	var property estaTerminado = false
	const tablero = new Tablero()
	method empezar() {
		if (not self.estaTerminado()) {
			jugadores.forEach { jugador => self.queJuegue(jugador) }
		}
	}
	method queJuegue(unJugador) {
		try{
			const numeroDeCasilleros = unJugador.tirarDados()
			self.hacerJugarTirando(unJugador, numeroDeCasilleros)
		}
		catch fuePresoException : VaPresoException{
			unJugador.irPreso()
		}
	}
	
	
	method hacerJugarTirando(unJugador, unValorDeDados){//Esto se hizo para testear qué pasa con un número de dados particular
		const casillerosQueRecorre = tablero.casillerosDesdeHasta(unJugador.posicionActual(), unValorDeDados)//Devuelve una lista donde el último casillero es al que tiene que ir
		unJugador.moverseSobre(casillerosQueRecorre)
	}
	
	
	
	method agregarJugador(unJugador){
		jugadores.add(unJugador)
	}
}