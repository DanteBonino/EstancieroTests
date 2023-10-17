import empresa.*
import campo.*
import jugador.*

/*object creadoraDePropiedades{
	method crearPropiedad(mockPropiedad){
		const duenio = mockPropiedad.duenio()
		const valorDeCompra = mockPropiedad.valorDeCompra()
		if(mockPropiedad.tipo() === "empresa"){
			return new EmpresaV2 (duenio = duenio, valorDeCompra = valorDeCompra)
		}		
		else{
			return new CampoV2 (duenio = duenio, valorDeCompra = valorDeCompra, mockPropiedad.valorDeRenta(), costoDeConstruccion = mockPropiedad.costoDeConstruccion(), provincia = mockPropiedad.provincia())			
		}
	}
}
*/


/* Version 1 */
class MockCampo inherits MockPropiedad{
	const provincia
	const valorDeRenta
	const costoDeConstruccion
	
	method crearPropiedad(){
		return new CampoV2(	
			duenio = self.duenio(),	
			valorDeCompra = self.valorDeCompra(),	
			provincia = provincia,	
			valorDeRenta = valorDeRenta,	
			costoDeConstruccion = costoDeConstruccion,
			juego = self.juego()
		)
		
	}
}

class MockEmpresa inherits MockPropiedad{
	method crearPropiedad() = new EmpresaV2(valorDeCompra = self.valorDeCompra(), duenio = self.duenio(), juego = self.juego())
}

class MockPropiedad{
	var property duenio
	const property valorDeCompra
	const property juego
}

class MockJugador{
	const juego
	const dinero 
	method crearJugador() = new Jugador(dinero = dinero, juego = juego)
}