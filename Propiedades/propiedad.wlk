import casillero.*

class Propiedad{//Solo interfaz
    var property duenio 
    var valorDeCompra
    const property juego

    method sosEmpresa()

    method rentaPara(unJugador)

    method paso(unJugador){
        //No pasa nada
    }

    method cayo(unJugador){//Punto 7
        duenio.accionDeTitularidadSobrePropiedad(unJugador, self)
    }

    method valorDeCompra () = valorDeCompra
    
    method cambiarDuenio(nuevoDuenio){
    	duenio.eliminarPropiedad(self)
    	self.duenio(nuevoDuenio)
    }
    
    method esDe(unJugador) = duenio === unJugador
    
    method banco(){
    	return juego.banco()
    }

}

class PropiedadV2 inherits Casillero{//Deja de ser interfaz y las propiedades herendan de ella
    var property duenio 
    var valorDeCompra
    const property juego

    method sosEmpresa()

    method rentaPara(unJugador)
    
    override method cayo(unJugador){
       duenio.accionDeTitularidadSobrePropiedad(unJugador, self)
    }
    
    method valorDeCompra () = valorDeCompra
    
    override method esCasilleroEspecial() = false
    
    method cambiarDuenio(nuevoDuenio){
    	duenio.eliminarPropiedad(self)
    	self.duenio(nuevoDuenio)
    }
    
    method esDe(unJugador) = duenio === unJugador
    
    method banco(){
    	return juego.banco()
    }
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