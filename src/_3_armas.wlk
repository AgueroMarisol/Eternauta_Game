import wollok.game.*
import _1_personaje.*
import _4_municion.*
import _5_elementosEnEscenario.*

class ArmaDeJuan {
	var property estaSobrecalentado = false
	const property cadencia
	
	method atacar()
	method enfriar() {
		self.estaSobrecalentado(true)
		game.schedule(cadencia, {self.estaSobrecalentado(false)})
	}
	method juanApuntando()
	method juanArmaReposo()
}

object rifle inherits ArmaDeJuan (cadencia = 700){

	override method atacar() {
		const proyectil = new BalaDeRifle()
		proyectil.salirDisparada()
		self.enfriar()
	}
     override method juanApuntando() = "juanSalvo/Juan_Rifle_Apuntar-176x192.png"
     override method juanArmaReposo() = "juanSalvo/Juan_Rifle-Reposo-176x192.png"
}

object revolver inherits ArmaDeJuan (cadencia = 500) {
	
	override method atacar() {
		const proyectil = new BalaDeRevolver()
		proyectil.salirDisparada()
		self.enfriar()
	}
	override method juanApuntando() = "juanSalvo/Juan_Revolver_Apuntar-176x192.png"
	override method juanArmaReposo() = "juanSalvo/Juan_Revolver_Reposo-176x192.png"
}

object fusil inherits ArmaDeJuan (cadencia = 300) {
	override method atacar() {
		const proyectil = new BalaDeFusil()
		proyectil.salirDisparada()
		self.enfriar()
	}
	override method juanApuntando() = "juanSalvo/Juan_Fusil_Apuntar-176x192.png"
	override method juanArmaReposo() = "juanSalvo/Juan_Fusil_Reposo-176x192.png"
}

class RayoTerrenal inherits Objeto(esEnemigo = true) {
	var property cadencia

	method atacar() {
		game.schedule(cadencia, { const rayo = new MunicionRayoMortifero(position = game.at(self.position().x() - 1, self.position().y()))
			rayo.salirDisparada()
		})
	}
	
	override method serImpactado(objeto) {
		vidaEscudoRayo.danioRecibido(objeto)
	}
}

object rayoTerrenal1 inherits RayoTerrenal(position = game.at(17, 1), image = "lanza_rayos (2) (1).png", cadencia = (0 .. 1000).anyOne()) {}
object rayoTerrenal2 inherits RayoTerrenal(position = game.at(17, 3), image = "lanza_rayos (2) (1).png", cadencia = (1000 .. 2000).anyOne()) {}


object nave inherits Objeto(position = game.at(18, 8), image = "nave_alien.png"){
	var property cadencia = 1000

	method atacar() {
		position = game.at((0 .. 15).anyOne(), game.height() - 2)
		game.addVisual(self)
		const rayo = new RayoNave(position = game.at(self.position().x(), self.position().y() - 1))
		rayo.salirDisparada()
		game.schedule(cadencia, { game.removeVisual(self)})
	}

}