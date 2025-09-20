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
	//Metodos Lookers (Getters y Setters)
	method peso() { 
		return peso 
	}
	method nivelPeligrosidad() { 
		if (estaTransformadoEnRobot) {
			return peligrosidadRobot
		else {
			return peligrosidadAuto
			}
		}
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
		else {
			return pesoSinMisiles
			}
		}
	}
	method nivelPeligrosidad() { 
		if (tieneMisilesCargados) {
			return peligrosidadConMisiles
		else {
			return peligrosidadSinMisiles
			}
		}
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