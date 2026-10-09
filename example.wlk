class Elemento {

  method esBueno() {}
  method recibeAtaqueDe(unaPlaga) {}
}

class Hogar inherits Elemento {
  var nivelMugre
  var confortOfrecido

  method nivelMugre() = nivelMugre
  method confortOfrecido() = confortOfrecido
  override method esBueno() = confortOfrecido >= nivelMugre * 0.5
  override method recibeAtaqueDe(unaPlaga) {
    nivelMugre += unaPlaga.nivelDaño()
    unaPlaga.consecuenciasDeAtaque()
  }

}

class Huerta inherits Elemento {
  var capacidadProduccion
  var nivelMinimoDeProduccion

  method capacidadProduccion() = capacidadProduccion
  override method esBueno() = capacidadProduccion > nivelMinimoDeProduccion
  override method recibeAtaqueDe(unaPlaga) {
    if (unaPlaga.trasmiteEnfermedades()) {
      capacidadProduccion -= unaPlaga.nivelDaño() * 0.1 + 10
      unaPlaga.consecuenciasDeAtaque()
    } else {
      capacidadProduccion -= unaPlaga.nivelDaño() * 0.1
      unaPlaga.consecuenciasDeAtaque()
    }
  }

}

class Mascota inherits Elemento {
  var nivelSalud

  method nivelSalud() = nivelSalud
  override method esBueno() = nivelSalud > 250
  override method recibeAtaqueDe(unaPlaga) {
    if (unaPlaga.trasmiteEnfermedades()) {
      nivelSalud -= unaPlaga.nivelDaño()
      unaPlaga.consecuenciasDeAtaque()
    }
  }
}



class Plagas {
  var poblacion

  method nivelDaño() {}
  method poblacion() = poblacion
  method trasmiteEnfermedades() {return poblacion >= 10}
  method consecuenciasDeAtaque() {poblacion += poblacion * 0.1}

}

class Cucarachas inherits Plagas {
  var pesoPromedio

  override method nivelDaño() {return poblacion * 0.5}
  method pesoPromedio() = pesoPromedio
  override method trasmiteEnfermedades() {return super() and pesoPromedio >= 10}
  override method consecuenciasDeAtaque() {
    super()
    pesoPromedio += 2
  }
}

class Pulgas inherits Plagas {

  override method nivelDaño() {return poblacion * 2}
}

class Garrapatas inherits Pulgas {

  override method consecuenciasDeAtaque() {
    poblacion += poblacion * 0.2
  }
}

class Mosquitos inherits Plagas {

  override method nivelDaño() {return poblacion}
  override method trasmiteEnfermedades() {return super() and poblacion % 3 == 0}

}