class Propiedad{//Solo interfaz
    var property duenio
    method sosEmpresa()
    methodRentaPara(unJugador)
}

class PropiedadV2 inherits Casillero{//Deja de ser interfaz y las propiedades herendan de ella

}

/* Esta duda surgió en el Punto 6
        -> Dejarla como interfaz y que quienes la usan hereden directo de Casillero
            -> Las distintas propiedades comparten interfaz, pero los métodos son distintos salvo para duenio
        -> Convertirla en clase de la que hereden las propiedades
            -> Semánticamente capaz le da mayor sentido que pase a ser una clase abstracta