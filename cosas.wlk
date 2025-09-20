object knightRider {
	//Atributos (Variables y Constantes)
	const peso = 500
	const nivelPeligrosidad = 10
	//Metodos Lookers (Getters y Setters)
	method peso() {
		return peso
	}
	method nivelPeligrosidad() { 
		return nivelPeligrosidad
	}
}

object arenaGranel {
	//Atributos (Variables y Constantes)
	var peso = 200
	const nivelPeligrosidad = 2
	//Metodos Lookers (Getters y Setters)
	method peso() { 
		return peso 
	}
	method nivelPeligrosidad() { 
		return nivelPeligrosidad
	}
	method peso(_peso) {
		peso = _peso
	}
}

object bumblebee {
	//Atributos (Variables y Constantes)
	const peso = 800
	const peligrosidadAuto = 15
	const peligrosidadRobot = 30
	var estaTransformadoenRobot = false
	//Metodos Lookers (Getters y Setters)
	method peso() { 
		return peso 
	}
	method nivelPeligrosidad() {
		if (estaTransformadoenRobot) {
			return peligrosidadRobot
		} else {
			return peligrosidadAuto
		}
	}
	method estaTransformadoenRobot(_estaTransformadoenRobot) {
		estaTransformadoenRobot = _estaTransformadoenRobot
	} 
}

object paqueteLadrillos {
	//Atributos (Variables y Constantes)
	var cantidadLadrillos = 100
	const pesoladrillo = 2
	const nivelPeligrosidad = 2
	//Metodos Lookers (Getters y Setters)
	method peso() { 
		return cantidadLadrillos * pesoladrillo 
	}
	method nivelPeligrosidad() { 
		return nivelPeligrosidad
	}
	method cantidadLadrillos(_cantidadLadrillos) {
		cantidadLadrillos = _cantidadLadrillos
	}
}

object bateriaAntiaerea {
	//Atributos (Variables y Constantes)
	var tieneMisilesCargados = true
	const pesoConMisiles = 300
	const pesoSinMisiles = 200
	const peligrosidadSinMisiles = 0
	const peligrosidadConMisiles = 100
	//Metodos Lookers (Getters y Setters)
	method peso() { 
		if (tieneMisilesCargados) {
			return pesoConMisiles
		} else {
			return pesoSinMisiles
			}
		}
	method nivelPeligrosidad() {
		if (tieneMisilesCargados) {
			return peligrosidadConMisiles
		} else {
			return peligrosidadSinMisiles
		}
	}
	method tieneMisilesCargados(_tieneMisilesCargados) {
		tieneMisilesCargados = _tieneMisilesCargados
	}
}

object residuosRadiactivos {
	//Atributos (Variables y Constantes)
	const nivelPeligrosidad = 200
	var peso = 50
	//Metodos Lookers (Getters y Setters)
	method peso() { 
		return peso 
	}
	method nivelPeligrosidad() { 
		return nivelPeligrosidad
	}
	method peso(_peso) {
		peso = _peso
	}
}

//Más Cosas

object contenedorPortuario {
	//Atributos (Variables y Constantes)
	const property cosasCargadas = #{}
	//Metodos Lookers (Getters y Setters)
	method peso() { 
		return 100 + cosasCargadas.sum({unaCosa => unaCosa.peso()}) 
	}
	method nivelPeligrosidad() {
		const nivelesPeligrosidadCosas = cosasCargadas.map({cosaCargada => cosaCargada.nivelPeligrosidad()})
		return nivelesPeligrosidadCosas.maxIfEmpty({0})
	}
}


object embalajeSeguridad {
	//Atributos (Variables y Constantes)
	var cosaEnvuelta = bumblebee
	//Metodos Lookers (Getters y Setters)
	method peso() { 
		return cosaEnvuelta.peso()
	}
	method nivelPeligrosidad() { 
		return cosaEnvuelta.nivelPeligrosidad() / 2
	}
	method cosaEnvuelta(_cosaEnvuelta) {
		cosaEnvuelta = _cosaEnvuelta
	}
}