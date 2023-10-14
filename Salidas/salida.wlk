import casillero.*

class Salida inherits Casillero{
    override method paso(unJugador){
        unJugador.cobrar(5000)
    }
}

class Salida{
    method paso(unJugador){
        unJugador.cobrar(5000)
    }

    method cayo(_unJugador){
        //No pasa nada
    }
}