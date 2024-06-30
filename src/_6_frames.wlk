import wollok.game.*
import _1_personaje.*
import _3_armas.*
import _7_nivel.*
import _8_juego.*
import _10_sonidos.*

class Fondo {

	const property image
	const property position = game.origin()

}

class Frame inherits Fondo {

	const property sound = new MusicaMenu()

	method mostrar()

	method configurarTeclado()

}

class Menu inherits Frame {

	override method mostrar() {
		game.addVisual(self.image())
		self.configurarTeclado()
	}

}

object menu inherits Menu (image = new Fondo(image = "interfaces/Inicio.png")) {

	override method mostrar() {
		super()
		sound.reproducirMusica()
	}

	override method configurarTeclado() {
		keyboard.enter().onPressDo({ game.clear()
			nivel1.mostrarHistoria()
		})
	}

}

class Historia inherits Frame {

	override method mostrar() {
		game.clear()
		game.addVisual(self.image())
		self.configurarTeclado()
	}

}

object historiaUno inherits Historia(image = new Fondo(image = "interfaces/HistoriaUno.png")) {

	override method configurarTeclado() {
		keyboard.space().onPressDo({ nivel1.indice(1)
			nivel1.mostrarHistoria()
		})
	}

}

object historiaDos inherits Historia(image = new Fondo(image = "interfaces/HistoriaDos.png")) {

	override method configurarTeclado() {
		keyboard.space().onPressDo({ nivel1.indice(2)
			nivel1.mostrarHistoria()
		})
	}

}

object historiaTres inherits Historia(image = new Fondo(image = "interfaces/HistoriaTres.png")) {

	override method configurarTeclado() {
		keyboard.space().onPressDo({ nivel1.indice(3)
			nivel1.mostrarHistoria()
		})
	}

}

object mainMenu inherits Menu (image = new Fondo(image = "interfaces/MainMenu.png")) {

	override method configurarTeclado() {
		keyboard.num1().onPressDo({ menu.sound().pararMusica()
			game.clear()
			nivel1.sound().reproducirMusica()
			nivel1.jugarNivel()
		})
		keyboard.num2().onPressDo({ game.clear()
			tutorial.mostrar()
		})
		keyboard.num3().onPressDo({ game.clear()
			creditosUno.mostrar()
		})
	}

}

object tutorial inherits Historia(image = new Fondo(image = "interfaces/Tutorial.png")) {

	override method configurarTeclado() {
		keyboard.x().onPressDo({ game.clear()
			mainMenu.mostrar()
		})
	}

}

object creditosUno inherits Historia(image = new Fondo(image = "interfaces/creditosUno.png")) {

	override method configurarTeclado() {
		keyboard.space().onPressDo({ game.clear()
			creditosDos.mostrar()
		})
	}

}

object creditosDos inherits Historia(image = new Fondo(image = "interfaces/creditosDos.png")) {

	override method configurarTeclado() {
		keyboard.x().onPressDo({ game.clear()
			mainMenu.mostrar()
		})
	}

}

class MenuObjetivoLogrado inherits Menu {

	override method mostrar() {
		super()
		sound.reproducirMusica()
	}

}

object objetivoLogradoNivel1 inherits MenuObjetivoLogrado (image = new Fondo(image = "interfaces/ObjetivoLogrado.png")) {

	override method configurarTeclado() {
		keyboard.enter().onPressDo({ game.clear()
			nivel2.mostrarHistoria()
		})
	}

}

object historiaCuatro inherits Historia(image = new Fondo(image = "interfaces/HistoriaCuatro.png")) {

	override method configurarTeclado() {
		keyboard.space().onPressDo({ nivel2.indice(1)
			game.clear()
			nivel2.mostrarHistoria()
		})
	}

}

object selectArma1 inherits Menu (image = new Fondo(image = "interfaces/SelectArma.png")) {

	override method configurarTeclado() {
		keyboard.num1().onPressDo({ objetivoLogradoNivel1.sound().pararMusica()
			game.clear()
			juan.arma(revolver)
			nivel2.sound().reproducirMusica()
			juan.image("juanSalvo/Juan_Revolver_Reposo-176x192.png")
			nivel2.jugarNivel()
		})
		keyboard.num2().onPressDo({ objetivoLogradoNivel1.sound().pararMusica()
			game.clear()
			juan.arma(fusil)
			nivel2.sound().reproducirMusica()
			juan.image("juanSalvo/Juan_Fusil_Apuntar-176x192.png")
			nivel2.jugarNivel()
		})
		keyboard.num3().onPressDo({ objetivoLogradoNivel1.sound().pararMusica()
			game.clear()
			juan.arma(rifle)
			nivel2.sound().reproducirMusica()
			juan.image("juanSalvo/Juan_Rifle-Reposo-176x192.png")
			nivel2.jugarNivel()
		})
	}

}

object objetivoLogradoNivel2 inherits MenuObjetivoLogrado (image = new Fondo(image = "interfaces/ObjetivoLogrado.png")) {

	override method configurarTeclado() {
		keyboard.enter().onPressDo({ game.clear()
			nivel3.mostrarHistoria()
		})
	}

}

object historiaCinco inherits Historia(image = new Fondo(image = "interfaces/HistoriaCinco.png")) {

	override method configurarTeclado() {
		keyboard.space().onPressDo({ nivel3.indice(1)
			game.clear()
			nivel3.mostrarHistoria()
		})
	}

}

object selectArma2 inherits Menu (image = new Fondo(image = "interfaces/SelectArma.png")) {

	override method configurarTeclado() {
		keyboard.num1().onPressDo({ objetivoLogradoNivel2.sound().pararMusica()
			game.clear()
			juan.arma(revolver)
			nivel3.sound().reproducirMusica()
			nivel3.jugarNivel()
		})
		keyboard.num2().onPressDo({ objetivoLogradoNivel2.sound().pararMusica()
			game.clear()
			juan.arma(fusil)
			nivel3.sound().reproducirMusica()
			nivel3.jugarNivel()
		})
		keyboard.num3().onPressDo({ objetivoLogradoNivel2.sound().pararMusica()
			game.clear()
			juan.arma(rifle)
			nivel3.sound().reproducirMusica()
			nivel3.jugarNivel()
		})
	}

}

object historiaSeis inherits Historia(image = new Fondo(image = "interfaces/HistoriaSeis.png")){

	override method configurarTeclado() {
		keyboard.space().onPressDo({
			game.clear()
			gameOver.mostrar()
		})
	}

}

object gameOver inherits Historia(image = new Fondo(image = "interfaces/GameOver.png")) {
	
	override method mostrar(){
		super()
		game.schedule(6000, { game.stop()})
	}
	
	override method configurarTeclado(){}

}

/*object gameOver inherits Historia(image = new Fondo(image = "interfaces/GameOver.png")) {
	
	override method configurarTeclado() {
		keyboard.num1().onPressDo({
			juego.nivelActual().sound().pausarMusica() 
			nivel1.jugarNivel()// jugar o reiniciar??
		})
		keyboard.num2().onPressDo({ game.schedule(200, { game.stop()})})
	}

} */



class Reinicio inherits Menu(image = new Fondo(image = "interfaces/ReiniciarPartida.png")) {
	
	override method mostrar() {
		juego.nivelActual().sound().pausarMusica()
		game.clear()
		game.addVisual(self.image())
		self.configurarTeclado()
		sound.reproducirMusica()
	}
	
	override method configurarTeclado() {
		keyboard.num1().onPressDo({ sound.pausarMusica()
			juego.nivelActual().reiniciarNivel()
		})
		keyboard.num2().onPressDo({ game.schedule(200, { game.stop()})})
	}
	
}

//Se ejecuta cuando se gana el nivel dos
