import excepciones.*

class Provincia{
    const property campos = new Set()

    /* Punto 1 a*/
    method dueniosDeCampos(){
        return self.dueniosConPosiblesRepetidos().asSet()
    }

    method dueniosConPosiblesRepetidos(){
        return campos.map{unCampo => unCampo.duenio()}
    }

    /* Punto 1b */
    method puedeConstruirEstancia(unCampo){
        if(not self.esMonopolio()) throw noEsMonopolioLaProvincia
        if(not self.esConstruccionPareja(unCampo)) throw noEsConstruccionPareja
    }

    method esMonopolio() = self.dueniosDeCampos().size() == 1

    method esConstruccionPareja(unCampo){
        const cantidadEstanciasDelCampo = unCampo.cantidadDeEstancias()
        return campos.all{campo => campo.noTieneMasEstanciasQue(cantidadEstanciasDelCampo)}
    }
    
    /* Punto 2 Parte 2 */
    method esMonopolioDe(unJugador){
    	return campos.all{unCampo => unCampo.esDe(unJugador)}
    }
    
    method tieneAlgunCampo(unJugador){
    	return self.dueniosDeCampos().contains(unJugador)
    }
    
    method algunOtroJugadorTieneAlgunCampo(unJugador){
    	return self.dueniosDeCampos().any{duenio => duenio.esUnJugadorDistintoA(unJugador)}
    }
    
    method camposQueNoSean(unaPropiedad){
    	return campos.filter{unCampo => unCampo !== unaPropiedad}
    }

    /* Metodos que surgieron por tests */
    method agregarCampo(unCampo){
        unCampo.asignarProvincia(self)
        campos.add(unCampo)
    }
}