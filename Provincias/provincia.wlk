import exception.*

class Provincia{
    const campos = new Set()

    /* Punto 1 a*/
    method dueniosDeCampos(){
        self.dueniosConPosiblesRepetidos().asSet()
    }

    method dueniosConPosiblesRepetidos(){
        campos.map{unCampo => unCampo.duenio}
    }

    /* Punto 1b */
    method puedeConstruirEstancia(unCampo){
        if(not self.esMonopolio()) throw noEsMonopolioLaProvincia
        if(not self.esConstruccionPareja(unCampo)) throw noEsConstruccionPareja
    }

    method esMonopolio() = self.dueniosDeCampos().size() == 1

    method esConstruccionPareja(unCampo){
        const cantidadEstanciasDelCampo = unCampo.cantidadEstancias()
        campos.all{campo => campo.noTieneMasEstanciasQue(cantidadEstanciasDelCampo)}
    }
}