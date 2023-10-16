import casillerosEspeciales.*

class Tablero {
    const property salida = new Salida()
    const property premioGanadero = new PremioGanadero ()
    const property casilleros = [salida, premioGanadero]//Debería crearse con todas las propiedades + casilleros especiales
    const property juego
    
    method casillerosDesdeHasta(unCasillero, unNumero) {
        return self.casillerosDesde(casilleros.copy(), unCasillero).take(unNumero)
    }
    
    method casillerosDesde(unosCasilleros, unCasillero) {
        const primero = unosCasilleros.first()
        unosCasilleros.remove(primero) // Remueve el primero
        unosCasilleros.add(primero) // Lo agrega al final
        return if (primero == unCasillero) unosCasilleros else self.casillerosDesde(unosCasilleros,unCasillero)
    }
    
    method casillerosPropiedades() = casilleros.filter{unCasillero => not unCasillero.esCasilleroEspecial()}
    
    method casillerosEspeciales()  = casilleros.filter{unCasillero => unCasillero.esCasilleroEspecial()}
    
    method setearTablero(unasPropiedades){//Recibe mockPropiedades, crea las propiedades y las agrega al tablero
    	unasPropiedades.forEach{propiedad => self.crearYAgregarPropiedad(propiedad)}
    }
    
    method crearYAgregarPropiedad(unaPropiedad){
    	unaPropiedad.duenio(juego.banco())
    	self.agregarPropiedad(unaPropiedad.crearPropiedad())
    }
    
    method agregarPropiedad(unaPropiedad){//Agrega una propiedad ya creada
    	casilleros.add(unaPropiedad)
    }
    
}

