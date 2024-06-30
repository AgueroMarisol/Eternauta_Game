import wollok.game.*
import _6_frames.*
import _7_nivel.*

object juego {
	const property niveles = [nivel1, nivel2, nivel3]
	var property numeroNivel = 0
	
	method iniciar() {
		if(numeroNivel < niveles.size()) self.nivelActual().dimensionarEscenario() else historiaSeis.mostrar() //Mostrar Créditos, una felicitación por haber ganado el juego y después cerrarlo
	}
	
	method nivelActual() = self.niveles().get(self.numeroNivel())
	
	method detener() { game.schedule(1500, {game.stop()}) }
}


