import casillero.*

class Salida inherits Casillero{
    override method paso(unJugador){
        unJugador.cobrar(5000)
    }
}

class PremioGanadero inherits Casillero{
    override method cayo(unJugador){
        unJugador.cobrar(2500)
        super(unJugador)
    }
}


/* Version Obsoleta */
class PremioGanaderoV2{
    method paso(_unJugador){
        //No pasa nada
    }
    method cayo(unJugador){
        unJugador.cobrar(2500)
    }
}

class SalidaV2{
    method paso(unJugador){
        unJugador.cobrar(5000)
    }

    method cayo(_unJugador){
        //No pasa nada
    }
}


//Me decanto por que hereden de Casillero pq en todos cuando cae quiero que se actualice la posicion del jugador