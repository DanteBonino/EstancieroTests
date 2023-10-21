import casillero.*
import estatus.*

class Propiedad inherits Casillero{
    var   property duenio /* Surge por por primera vez en el punto 1a en Campo */
    var   property valorDeCompra
    const property juego
    var   property estatus       = libre /* Surge en el Punto 3 Parte 2 */
	
	/* Punto 4 */
    method rentaPara(unJugador)
    
	/* Punto 7 */
    override method cayo(unJugador){
        duenio.accionDeTitularidadSobrePropiedad(unJugador, self)
    }
	
    
    /* Punto 2 Parte 2 */
    method hayOtrosDueniosEnElRubro(unJugador){
    	return self.otrasPropiedadesDelRubro().any{unaPropiedad => unaPropiedad.lePerteneceAOtroJugador(unJugador)}
    }
    
    method lePerteneceAOtroJugador(unJugador){
    	return not self.esDe(unJugador) or self.esDe(self.banco()) 
    }
    
    method otrasPropiedadesDelRubro()
    
	method elRubroEsMonopolioDelBanco(){
		return self.otrasPropiedadesDelRubro().all{unaPropiedad => unaPropiedad.esDe(juego.banco())}
	}
	
	 method esDe(unJugador) = duenio === unJugador
	 
		/* Punto 3 Parte 2 */
    method valorDeCompraActual () = estatus.valorDeCompra(self)
    
    method cambiarDuenio(nuevoDuenio){
    	duenio.eliminarPropiedad(self)
    	self.duenio(nuevoDuenio)
    }
    
    method banco(){
    	return juego.banco()
    }
    
    method valorDeHipoteca(){//Lo que paga el banco al jugador
    	return valorDeCompra/2
    }
    
    method hipotecar(){
    	self.estatus(hipotecada)
    }
    
    method liberar(){
    	self.estatus(libre)
    }
    
    method estaLibre () = self.valorDeCompraActual() === valorDeCompra
	/* Este último método podría ser distinto para empresas y para campos, en campos podría directamente preguntarle a la provincia si es monopolioDe */
}

/* 
Esta duda surgió en el Punto 6
        -> Dejarla como interfaz y que quienes la usan hereden directo de Casillero
            -> Las distintas propiedades comparten interfaz, pero los métodos son distintos salvo para duenio
        -> Convertirla en clase de la que hereden las propiedades
            -> Semánticamente capaz le da mayor sentido que pase a ser una clase abstracta

Actualización Punto 7:
        -> Como ahora ambas propiedades aplican la misma implemetanción para cayo y paso, toma más fuerza la idea de que hereden de Propiedad y que Propiedad sea una clase
        -> Por otro lado, Casillero quizá tiene más sentido que sólo sea una interfaz 
*/