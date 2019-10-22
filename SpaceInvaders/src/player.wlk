import Shot.*
import wollok.game.*
import juego.*

object player {
	var property position = game.at(6,0)
	var property image = "res/player.gif"
	var property disparo = null
	

	method validar(){
		if (position.y() > 0) 
			position = game.at(position.x(),0)  
	}
	
	method disparar() {
		if(disparo == null || !game.hasVisual(disparo)){
			disparo = new ShotPlayer(position.up(1), "res/shot1.gif")			
			game.addVisual(disparo)		
		}	
		else{
			
		}	
	}
	
	method moverDisparo() {
		if(disparo != null && game.hasVisual(disparo))
			disparo.mover(disparo) 
	}
	
	method validarDisparo() {
		if(disparo != null && game.hasVisual(disparo))
		 	disparo.validar()
	}
	
	method impactar() {
		if(self.disparo() != null && game.hasVisual(self.disparo())){
			game.whenCollideDo(self.disparo(), { invader => 
			juego.eliminarEnemigo(invader)
			self.disparo().salirDeEscena()			
		})		
		}	
	}
	
}

