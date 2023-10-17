import excepciones.*
import acreedor.*
import estado.*
import estrategiasDeCompra.*

class Jugador inherits Acreedor{
	const juego
	var posicionActual     = juego.salida()
	const banco            = juego.banco()
	var property estado    = libre
	const prision	       = juego.prision()
	var estrategiaDeCompra = estandar
	

	/* Punto 1 b */ 
	method pagarEstancia(costoDeConstruccionEstancia){
		self.pagarA(banco, costoDeConstruccionEstancia)
	}

	/* Punto 2b */
	method cantidadEmpresasPropias(){
		return self.propiedades().count{unaPropiedad => unaPropiedad.sosEmpresa()}
	}

	/* Punto 3 */
	method tirarDados(){
		return self.tirarUnDado() + self.tirarUnDado()
	}

	method tirarUnDado() = 1.randomUpTo(6).truncate(0)

	/* Punto 7 */
	override method accionDeTitularidadSobrePropiedad (unJugador, unaPropiedad){
		if(not (self === unJugador)){
			self.cobrarRentaA(unJugador, unaPropiedad)
		}
	}

	method cobrarRentaA(otroJugador, unaPropiedad){
		const rentaAPagar = unaPropiedad.rentaPara(otroJugador)
		otroJugador.pagarA(self, rentaAPagar)
	}

	method comprar(unaPropiedad){
		self.pagarA(banco, unaPropiedad.valorDeCompra())// Por ahora siempre se compra al banco, si no se puede hacer unaPropiedad.duenio()
		self.agregarPropiedad(unaPropiedad)
	}

	/* Punto 8 */
	method moverseSobre(unosCasilleros){
		const ultimoCasillero = unosCasilleros.last()
		self.pasarPor(unosCasilleros)
		self.cayoEn(ultimoCasillero)
	}

	method pasarPor(unosCasilleros){
		unosCasilleros.forEach{unCasillero => unCasillero.paso(self)}
	}

	method cayoEn(unCasillero){
		unCasillero.cayo(self)
	}
	
	method cambiarPosicionActualPor(unCasillero){
		posicionActual = unCasillero
	}
	
	/* Punto 9 */
	method jugar(){
		try{
			const valorDeDadosObtenidos = estado.jugar(self)
			self.jugarHabiendoTirado(valorDeDadosObtenidos)
		}
		catch fuePreso : VaPreso{
			self.irPreso()
		}
		/*catch quedoLibre : EsLibre{
			self.quedarEnLibertad()
			self.jugar()
		}*/
		
	}
	
	method posicionActual() = posicionActual
	
	method jugarHabiendoTirado(unValorDeDados){
		self.moverseSobre(juego.casillerosARecorrer(self, unValorDeDados))
	}
	
	/* Punto 1 Parte 2 */
	method tirarDadosUnaVez(){
		const dado1 = self.tirarUnDado()
  		const dado2 = self.tirarUnDado()
  		if (dado1 == dado2)	throw new SacoDoblesException(valorDelTiro = dado1 + dado2)
		return dado1 + dado2
	}
	
	method irPreso(){
		self.cayoEn(prision)
		self.estado(new Preso())
	}
	
	method quedarEnLibertad(){
		self.estado(libre)
	}
	
	/* Punto 2 Parte 2 */
	method comprarV2(unaPropiedad){
		estrategiaDeCompra.validarCompraV2(unaPropiedad, self)
		self.comprar(unaPropiedad)
	}
	
	method tieneAlgunaEmpresa(){
		return self.cantidadEmpresasPropias() > 0
	}
	
	method esDistintoAYTieneAlgunaEmpresa(otroJugador){
		return self.tieneAlgunaEmpresa() and self !== otroJugador
	}
	
	override method esJugador () = true
	
	/* Metodos surgidos por tests */

	method esSuPosicionActual(unCasillero)   = posicionActual === unCasillero
	method turnosRestantesEnPrision()	     = estado.turnosEnPrisionRestantes()
	method estrategiaDeCompra(unaEstrategia){
		estrategiaDeCompra = unaEstrategia
	}
}

/*
    var property posicionActual = salida
	var turnosRestantesPreso    = 0
    method tirarDados() {
		try {
    		return self.tirarDadosUnaVez()
  		}
  		catch primerTiroException : SacoDoblesException {
    		try {
      			return self.tirarDadosUnaVez() + primerTiroException.valorDelTiro()
    		}
    		catch segundoTiroException : SacoDoblesException {
      			throw new VaPresoException()
    		}
  		}
	}
	
	method tirarDadosUnaVez() {
  		const dado1 = self.tirarUnDado()
  		const dado2 = self.tirarUnDado()
  		
		if (dado1 == dado2){
			self.dejarDeEstarPreso()
			throw new SacoDoblesException(valorDelTiro = dado1 + dado2)
		}
		return dado1 + dado2
		}
	
	method tirarUnDado(){//Unico
		return 1.randomUpTo(6).truncate(0)
	}
	
	method dejarDeEstarPreso(){
		turnosRestantesPreso = 0
	}

    method moverseSobre(unosCasilleros){
		if(not self.estaPreso()){
			unosCasilleros.forEach{unCasillero => unCasillero.paso(self)}
			const ultimoCasillero = unosCasilleros.last()
			ultimoCasillero.cayo(self)
		}
		else self.perderTurno()
		
	}
	
	method esSuPosicionActual(unCasillero){
		return self.posicionActual() === unCasillero
	}
	
	method irPreso(){
		turnosRestantesPreso = 3
		self.posicionActual(prision)
	}

    method turnosRestantesPreso() = turnosRestantesPreso
	
	method estaPreso()= self.esSuPosicionActual(prision) and self.turnosRestantesPreso() > 0
	
	method perderTurno(){
		turnosRestantesPreso --
	}


*/