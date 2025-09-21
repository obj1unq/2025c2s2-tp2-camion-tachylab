object camion {
	//Atributos (Variables y Constantes)
	const property cosas = #{}
	const pesoTara = 1000
	const pesoMaximoAceptable = 2500
	//Metodos de validacion y sus condiciones
	method puedeCargar(unaCosa) {
		return not cosas.contains(unaCosa)
	}
	method puedeDescargar(unaCosa) {
		return cosas.contains(unaCosa)
	}
	method esParElPeso(unaCosa) {
		return (unaCosa.peso() % 2) == 0
	}
	method estoPesa(pesoBuscado, unaCosa) {
		return unaCosa.peso() == pesoBuscado
	}
	method estaExcedidoDePeso() {
		return self.totalPeso() > pesoMaximoAceptable
	}
	method esDeNivel(nivelBuscado, unaCosa) {
		return unaCosa.nivelPeligrosidad() == nivelBuscado
	}
	method puedeCircularEnRutaDeNivel(nivel) {
		return not (self.estaExcedidoDePeso()) and self.cosasQueSuperenNivelPeligrosidad(nivel).isEmpty()
	}
	method tieneAlgoQuePesaEntre(pesoMinimo, pesoMaximo) {
		return cosas.any({unaCosa => unaCosa.peso() > pesoMinimo and unaCosa.peso() < pesoMaximo})
	}
	method validarDescargar(unaCosa) {
		if (not self.puedeDescargar(unaCosa)) {
			self.error(unaCosa + " no está cargada en el camión")
		}
	}
	method validarCargar(unaCosa) {
		if (not self.puedeCargar(unaCosa)) {
			self.error(unaCosa + " ya está cargada en el camión")
		}
	}
	method validarTrasportar(camino) {
		if (not camino.puedeTransportar(self)) {
			self.error("No se puede transportar por " + camino)
		}
	}
	//Metodos funcionales
	method cargar(unaCosa) {
		self.validarCargar(unaCosa)
		cosas.add(unaCosa)
	}
	method descargar(unaCosa) {
		self.validarDescargar(unaCosa)
		cosas.remove(unaCosa)
	}
	method esTodoPesoPar() {
		return cosas.all({unaCosa => self.esParElPeso(unaCosa)})
	}
	method hayAlgoConPeso(pesoBuscado) {
		return cosas.any({unaCosa => self.estoPesa(pesoBuscado, unaCosa)})
	}
	method totalPeso() {
		return pesoTara + cosas.sum({unaCosa => unaCosa.peso()})
	}
	method encontrarCosaDeNivel(nivelBuscado) {
		return cosas.find({unaCosa => self.esDeNivel(nivelBuscado, unaCosa)})
	}
	method cosasQueSuperenNivelPeligrosidad(nivel) {
		return cosas.filter({unaCosa => unaCosa.nivelPeligrosidad() > nivel})
	}
	method cosasMasPeligrosasQue(unaCosa) {
		return self.cosasQueSuperenNivelPeligrosidad(unaCosa.nivelPeligrosidad())
	}
	method cosaMasPesada() {
		return cosas.max({unaCosa => unaCosa.peso()})
	}
	method pesosDeCosas() {
		return cosas.map({unaCosa => unaCosa.peso()})
	}
	method totalBultos() {
		return cosas.sum({unaCosa => unaCosa.bultos()})
	}
	method sufreAccidente() {
		return cosas.forEach({unaCosa => unaCosa.efectoAccidente()})
	}
	method almacenarEn(destino) {
		destino.almacenar(cosas)
		cosas.clear()
	}
	method transportar(destino, camino) {
		self.validarTrasportar(camino)
		self.almacenarEn(destino)
	}
}
