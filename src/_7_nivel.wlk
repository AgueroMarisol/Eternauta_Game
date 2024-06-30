import wollok.game.*
import _1_personaje.*
import _3_armas.*
import _5_elementosEnEscenario.*
import _6_frames.*
import _8_juego.*
import _10_sonidos.*
import _11_animacion.*

class Escenario {

	method dimensionarEscenario() {
		game.cellSize(100)
		game.height(10)
		game.width(19)
		game.boardGround("interfaces/Inicio.png") // Pantalla tipo como simulando un "cargando juego"
	}
	
	

}

class Nivel inherits Escenario {

	const property frames
	var property sound = new MusicaJuego()

	method reiniciarNivel() {
		game.clear()
		sound.reanudarMusica()
		juan.resetearFuncionalidades()
		self.jugarNivel()
	}

	method pasarDeNivel() {
		sound.pararMusica()
		game.clear()
		juan.resetearFuncionalidades()
	}

	method mostrarHistoria()

	method jugarNivel()

	method agregarVisuales()
	

}

object nivel1 inherits Nivel(frames = [ historiaUno, historiaDos, historiaTres ]) {

	var property indice = 0

	override method dimensionarEscenario() {
		super()
		game.title("El Eternauta")
		menu.mostrar() // Acá va el main menú cuando funcione
	}

	override method mostrarHistoria() {
		if (indice < frames.size()) {
			frames.get(indice).mostrar()
		} else {
			game.clear()
			mainMenu.mostrar()
		}
	}

	override method jugarNivel() {
		self.agregarVisuales()
		juan.activarTeclas()
//		const hombreRobots = new HombreRobot()
//		hombreRobots.generarEnemigos()
		const cascarudo = new Cascarudo()
		cascarudo.generarEnemigos()
//		mano.accionarArma()
	}

	override method agregarVisuales() {
		game.addVisual(escenario1)
		game.addVisual(juan)
		game.addVisual(puntuacion)
		game.addVisual(vidaJuan)
		
//		game.addVisual(vidaEscudoRayo)
//		game.addVisual(mano)
//		game.addVisual(rayoTerrenal1)
//		game.addVisual(rayoTerrenal2)
	}

	override method pasarDeNivel() {
		super()
		juego.numeroNivel(1)
		juego.iniciar()
	}

}

object nivel2 inherits Nivel(frames = [ historiaCuatro ]) {

	var property indice = 0

	override method dimensionarEscenario() {
		super()
		game.clear()
		objetivoLogradoNivel1.mostrar()
	}

	override method mostrarHistoria() {
		if (indice < frames.size()) {
			frames.get(indice).mostrar()
		} else {
			selectArma1.mostrar()
		}
	}

	override method jugarNivel() {
		self.agregarVisuales()
		juan.activarTeclas()
		const hombreRobots = new HombreRobot()
		hombreRobots.generarEnemigos()
	}

	override method agregarVisuales() {
		game.addVisual(cielo)
		game.addVisual(cerca)
		game.addVisual(calle2)
		game.addVisual(calle)
		game.addVisual(juan)
		game.addVisual(puntuacion)
		game.addVisual(vidaJuan)
	}

	override method pasarDeNivel() {
		super()
		juego.numeroNivel(2)
		juego.iniciar()
	}

}

object nivel3 inherits Nivel(frames = [ historiaCinco, historiaSeis,gameOver]) {

	var property indice = 0

	override method dimensionarEscenario() {
		super()
		game.clear()
		objetivoLogradoNivel2.mostrar()
	}

	override method mostrarHistoria() {
		if (indice < frames.size()) {
			frames.get(indice).mostrar()
		} else {
			selectArma2.mostrar()
		}
	}

	override method jugarNivel() {
		self.agregarVisuales()
		juan.activarTeclas()
		const cascarudos = new Cascarudo()
		cascarudos.generarEnemigos()
	}

	override method agregarVisuales() {
		game.addVisual(cielo)
		game.addVisual(cerca)
		game.addVisual(calle)
		game.addVisual(calle2)
		game.addVisual(juan)
		game.addVisual(puntuacion)
		game.addVisual(vidaJuan)
	}

	override method pasarDeNivel() {
		game.clear()
		juan.resetearFuncionalidades()
		juego.numeroNivel(3)
		juego.iniciar()
	}

}

