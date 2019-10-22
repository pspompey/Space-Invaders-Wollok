import wollok.game.*

class Shot {
	var property position
	var property image
	
	constructor(_position, _imagen){
		position = _position
		image = _imagen
	}
	
	method validar() {
		if (self.fueraDeEscena())
			game.removeVisual(self)
	}
	
	method salirDeEscena() {
		if(game.hasVisual(self))
			position = position.up(14)
	}
	
	method fueraDeEscena()
	method mover(shot) 
	
	
}

class ShotPlayer inherits Shot{
	
	override method mover(shot) {
		if(game.hasVisual(shot)){
			position = position.up(1)	
			if (image.equals("res/shot1.gif"))
				image = "res/shot2.gif"
			else
				image = "res/shot1.gif"
		}
	}
	
	override method fueraDeEscena() = position.y() >= game.height()

}

class ShotInvader inherits Shot{
	
	override method mover(shot) {
		position = position.down(1)	
	}
	
	override method fueraDeEscena() = position.y() < 0

}


