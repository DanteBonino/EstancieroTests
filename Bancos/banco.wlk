import acreedor.*

class Banco inherits Acreedor{

    /* Punto 7 */
    override method accionDeTitularidadSobrePropiedad (unJugador, unaPropiedad){
        unJugador.comprarV2(unaPropiedad)
    }
    
    /* Punto 2 Parte 2 */
    override method esJugador () = false
    
    /* Punto 3 Parte 2 */
    method pagarHipoteca(unJugador, unaPropiedad){
    	self.pagarA(unJugador, unaPropiedad.valorDeHipoteca())
    	unaPropiedad.hipotecar()
    	self.agregarPropiedad(unaPropiedad)
    }
    
    /*override method pagarA(unAcreedor, unMonto){//Así?
    	self.validarPosibilidadDePagar(unMonto)
    	super(unAcreedor, unMonto)
    }*/
}
