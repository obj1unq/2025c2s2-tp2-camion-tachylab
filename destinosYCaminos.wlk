object almacen {
    //Atributos (Variables y Constantes)
    const cosasAlmacenadas = #{}
    //Metodos Lookers (Getters y Setters)
    method cosasAlmacenadas() {
        return cosasAlmacenadas
    }
    //Metodos funcionales
    method almacenar(cosasTransportadas) {
        cosasAlmacenadas.addAll(cosasTransportadas)
    }
}

object ruta9 {
    method puedeTransportar(transporte) {
        return transporte.puedeCircularEnRutaDeNivel(20)
    }
}

object caminosVecinales {
    var pesoMaximoPermitido = 200
    method pesoMaximoPermitido(_pesoMaximoPermitido) {
        pesoMaximoPermitido = _pesoMaximoPermitido
    }
    method puedeTransportar(transporte) {
        return transporte.totalPeso() < pesoMaximoPermitido
    }
}