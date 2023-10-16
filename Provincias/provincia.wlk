import excepciones.*

class Provincia{
    const campos = new Set()

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

    /* Metodos que surgieron por tests */
    method agregarCampo(unCampo){
        unCampo.asignarProvincia(self)
        campos.add(unCampo)
    }
}