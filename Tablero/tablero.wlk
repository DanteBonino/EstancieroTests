import casillerosEspeciales.*
import casillero.*

class Tablero {
    const property salida 		  = new Salida()
    const property premioGanadero = new PremioGanadero ()
    const property prision		  = new Casillero() //Punto 1 Parte 2
    const property casilleros     = [salida, premioGanadero, prision]//Debería crearse con todas las propiedades + casilleros especiales
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
    
    /* No se usan, podrían usarse */
    method casillerosPropiedades() = casilleros.filter{unCasillero => not unCasillero.esCasilleroEspecial()}
    
    method casillerosEspeciales()  = casilleros.filter{unCasillero => unCasillero.esCasilleroEspecial()}
    /* -------------------------- */
    
    /* Métodos de inicialización */
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
    
    method banco () = juego.banco()
    
    /* Punto 2 Parte 2 */
    method empresasQueNoSon(unaEmpresa){
    	return casilleros.filter{unCasillero=> unCasillero.esEmpresaYNoEsEsta(unaEmpresa)}
    }
}
