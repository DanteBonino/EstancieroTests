import tablero.*
import casillerosEspeciales.*
import excepciones.*
import banco.*
import jugador.*

class Juego {
	const property jugadores = []
	var property estaTerminado = false
	const property tablero = new Tablero(juego = self)
	const property banco = new Banco()

	method empezar() {
		if (not self.estaTerminado()) {
			jugadores.forEach { jugador => self.queJuegue(jugador) }
		}
	}

	/* Punto 9 */
	method queJuegue(unJugador){
		unJugador.jugar()
	}

	method casillerosARecorrer(unJugador, unValor) = tablero.casillerosDesdeHasta(unJugador.posicionActual(), unValor)
		
	/* Punto 2 Parte 2 */
	method algunOtroJugadorTieneAlgunaEmpresa(unJugador){
		return jugadores.any{jugador => jugador.esDistintoAYTieneAlgunaEmpresa(unJugador)}
	}
	
	method ningunJugadorTieneEmpresa(){
		return jugadores.all{jugador => not (jugador.tieneAlgunaEmpresa())}
	}
	
	
	/* Metodos Para Inicializar */
	
	method setearPropiedadesParaEmpezar(){
		const propiedadesDelTablero = tablero.casillerosPropiedades()
		propiedadesDelTablero.forEach{unaPropiedad => banco.agregarPropiedad(unaPropiedad)}
		
	}
	
	method agregarJugadores(unosJugadores){//Recibe mockJugadores, los crea y los agrega
		unosJugadores.forEach{jugador => self.crearYAgregarJugador(jugador)}
	}
	
	method crearYAgregarJugador(mockJugador){
		self.agregarJugador(mockJugador.crearJugador())
	}
	
	/* Metodos extras */
	method salida(){
		return tablero.salida()
	}
	
	method agregarJugador(unJugador){//Agrega un Jugador ya creado
		jugadores.add(unJugador)
	}
	
	method prision() = tablero.prision()
}


/*
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


 */