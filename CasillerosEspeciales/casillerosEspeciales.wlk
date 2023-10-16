import casillero.*

class PremioGanadero inherits Casillero{
    override method cayo(unJugador){
        unJugador.cobrar(2500)
    }
}

class PremioGanaderoV2{
    method paso(_unJugador){
        //No pasa nada
    }
    method cayo(unJugador){
        unJugador.cobrar(2500)
    }
}

class Salida inherits Casillero{
    override method paso(unJugador){
        unJugador.cobrar(5000)
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