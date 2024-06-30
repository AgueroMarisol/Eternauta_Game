import wollok.game.*
import _1_personaje.*
import _7_nivel.*
import _8_juego.*

object vidaJuan {

	var property vida = 100
	const property position = game.at(1, game.height() - 1)
	var property image = "barraDeSalud/(" + self.text() + "_)Barra_Vida-210x98.png"

	method text() = vida.toString()

	method restarVida(danio) {
		vida = 0.max(vida - danio)
		image = "barraDeSalud/(" + self.text() + "_)Barra_Vida-210x98.png"
		game.removeVisual(self)
		game.addVisual(self)
		if (vida == 0) {
			juan.morir()
		}
	}

	method resetearVida() {
		vida = 100
		image = "barraDeSalud/(" + self.text() + "_)Barra_Vida-210x98.png"
	}

}

object vidaEscudoRayo {
	var property danioRecibido
	var danioAcumulado = 0
	var property vida = 1000 /* si el mano va tener esta vida hay que buscar una manera de que estos 2000 representen 100 para remplazar la barra de vida llena */
	var property vidaBarraSalud = vida * 0.10 /*una primera idea es tomar lo que haya en vida y dividirlo por 20. ejemplo: 2000 / 20 == 100, 1900/20== 95, 1800/20 == 90 */ // buscar la logica de hacer esto con porcentajes
	const property position = game.at(game.width() - 5, game.height() - 1)
	var property image = "barraDeSalud/(" + self.text() + "_)Barra_Vida-210x98.png"

	method text() = self.vidaBarraSalud().toString()
	
	method danioRecibido(objeto) {
		danioRecibido = objeto.danio()
		danioAcumulado += danioRecibido
		self.restarVida()
	}
	
	method restarVida() {
		if (danioAcumulado >= 100) {
			danioAcumulado = 0
			vida = 0.max(vida - 100)
			vidaBarraSalud = vida * 0.10 // Actualizamos la barra de salud
            self.actualizarImagen()
		}
	}

    method actualizarImagen() {
        image = "barraDeSalud/(" + self.text() + "_)Barra_Vida-210x98.png"
        game.removeVisual(self)
        game.addVisual(self)
    }
}

object puntuacion {

	var puntos = 0
	const property color = "#ff00ff"
	const property position = game.at(game.width() - 2, game.height() - 1)

	method text() = puntos.toString()

	method textColor() = self.color()

	method sumarPuntos(enemigo) {
		puntos = 1000.min(puntos + enemigo.puntosOtorgadoPorMuerte())
		if (puntos >= 150) {
			game.schedule(200, { juego.nivelActual().pasarDeNivel()})
		}
	}

	method resetearPuntuacion() {
		puntos = 0
	}

}

class FondoDeEscenario inherits Objeto {

}

object escenario1 inherits FondoDeEscenario(image = "escenarios/Nivel_1-2000x1000.png", position = game.origin()) {}
object cielo inherits FondoDeEscenario(image = "escenarios/Cielo_Nocturno-2400x600.png", position = game.at(0, 4)) {}
object cerca inherits FondoDeEscenario(image = "escenarios/Cerca-3600x150.png", position = game.at(0, 4)) {}
object calle inherits FondoDeEscenario(image = "escenarios/Calle-3600x300.png", position = game.at(0, 1)) {}
object calle2 inherits FondoDeEscenario(image = "escenarios/Calle-3600x300-girada.png", position = game.at(-1, 0)) {}

