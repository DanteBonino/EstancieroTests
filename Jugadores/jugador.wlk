import excepciones.*
import acreedor.*
import estado.*
import estrategiasDeCompra.*

class Jugador inherits Acreedor{
	const property juego   //Conocer el juego es necesario para conocer al banco y para saber sobre qué casilleros debe moverse (Punto 9)
	var posicionActual     = juego.salida()//Surge en el Punto 8
	const banco            = juego.banco()//Necesario en el Punto 1b
	var property estado    = libre//Surge en el Punto 1 Parte 2
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

	/*method comprar(unaPropiedad){
		self.pagarA(banco, unaPropiedad.valorDeCompra())// Por ahora siempre se compra al banco, si no se puede hacer unaPropiedad.duenio()
		self.agregarPropiedad(unaPropiedad)
	}*/

	/* Punto 8 (único de Jugador, no es de Acreedor)*/
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
		estado.jugar(self)//Recién surge en el Punto 1 Parte 2
	}
	
	/* Version antigua de Jugar (así surgió para el Punto 9)
	 *  
	 	method jugar(){
			const valorDeDadosObtenido = self.tirarDados()
			self.jugarHabiendoTirado(valorDeDadosObtenido)
		}
	 */
	 
	
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
		if(estrategiaDeCompra.esComprable(unaPropiedad,self)) self.comprar(unaPropiedad)
	}
	
	method tieneAlgunaEmpresa(){
		return self.cantidadEmpresasPropias() > 0
	}
	
	method esDistintoAYTieneAlgunaEmpresa(otroJugador){
		return self.tieneAlgunaEmpresa() and self !== otroJugador
	}
	
	override method esJugador () = true
	
	/* Punto 3 Parte 2 */
	override method pagarA(unAcreedor, unMonto){
		try {
      		super(unAcreedor, unMonto)
    	}
    	catch exception : NoPuedeRealizarElPago {
      		self.hipotecarUnaPropiedad()
      		self.pagarA(unAcreedor, unMonto)
    	}
	}
	
	method hipotecarUnaPropiedad(){
		try{
			const unaPropiedad = self.unaPropiedad()
			self.hipotecar(unaPropiedad)
		}
		catch exception : Exception {
			throw new Perdio()
		}
	}
	
	method hipotecar(unaPropiedad){
		banco.pagarHipoteca(self, unaPropiedad)
	}
	
	/* No se usa este método */
	method tieneAlgunaPropiedad(){
		return self.propiedades().size()>0 //Esto rompe el encapsulamiento?
	}
	
	method unaPropiedad(){//No se lo pongo a Acreedor pq el banco  no lo usa para nada
		return self.propiedades().anyOne() //Esto rompe el encapsulamiento?
	}
	
	method comprar(unaPropiedad){
		self.pagarA(banco, unaPropiedad.valorDeCompraActual())// Por ahora siempre se compra al banco, si no se puede hacer unaPropiedad.duenio()
		unaPropiedad.liberar()
		self.agregarPropiedad(unaPropiedad)
	}
	
	/* Metodos surgidos por tests */

	method esSuPosicionActual(unCasillero)   = posicionActual === unCasillero
	method turnosRestantesEnPrision()	     = estado.turnosEnPrisionRestantes()
	method estrategiaDeCompra(unaEstrategia){
		estrategiaDeCompra = unaEstrategia
	}
	method estrategiaDeCompra() = estrategiaDeCompra
}
	
