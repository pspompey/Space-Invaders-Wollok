import Shot.*
import juego.*
import wollok.game.*

class Invader {
	var property position
	var property image
	var property limiteDerecho
	var property limiteIzquierdo
	var property disparo = new ShotInvader(position, "res/bomb.png")			
	
	constructor(_position,_image){
		position = _position
		image = _image
		limiteDerecho = position.x()+1
		limiteIzquierdo = position.x()-1
	}
	
	method mover() {
		if (position.y().even() && position.x() > self.limiteIzquierdo())
			position = position.left(1)
		else if (!position.y().even() && position.x() < self.limiteDerecho() ) 
				position = position.right(1)			
			else{		
				position = position.down(1)
			}
		self.cambiarImagen()
	}
	
	method cambiarImagen()
	
	method disparar(){
		if(!game.hasVisual(disparo) && game.hasVisual(self)){
			disparo.position(self.position().down(1))
			game.addVisual(disparo)
		}	
		else{
			
		}
	}

	method moverDisparo() {
		if(game.hasVisual(disparo))
			disparo.mover(disparo) 
	}

	method validarDisparo() {
		if(game.hasVisual(disparo))
			disparo.validar() 
	}
	
	method win() = position.y() == 1
	
}


class Invader1 inherits Invader{
	
	override method cambiarImagen() {
		if (image.equals("res/invader1.gif")) 
			image = "res/invader2.gif"			
		else{		
			image = "res/invader1.gif"			
		} 
	} 
	
}

class Invader2 inherits Invader{
	
	override method cambiarImagen() {
		if (image.equals("res/invader3.gif")) 
			image = "res/invader4.gif"			
		else{		
			image = "res/invader3.gif"			
		} 
	} 
	
}

class Invader3 inherits Invader{
	
	var anterior = "res/ufo0.gif"
	
	override method cambiarImagen() {
		
		if (image.equals("res/ufo0.gif")){
			image = "res/ufo1.gif"
			anterior = "res/ufo0.gif"			
		}else{		
		if (image.equals("res/ufo4.gif")){ 
			image = "res/ufo3.gif"
			anterior = "res/ufo4.gif"								
		}else{		
		if (image.equals("res/ufo1.gif") && anterior.equals("res/ufo0.gif")){ 
			image = "res/ufo2.gif"
			anterior = "res/ufo1.gif"									
		}else{		
		if (image.equals("res/ufo1.gif") && anterior.equals("res/ufo2.gif")){ 
			image = "res/ufo0.gif"
			anterior = "res/ufo1.gif"			
		}else{		
		if (image.equals("res/ufo2.gif") && anterior.equals("res/ufo1.gif")){ 
			image = "res/ufo3.gif"
			anterior = "res/ufo2.gif"			
		}else{		
		if (image.equals("res/ufo2.gif") && anterior.equals("res/ufo3.gif")){ 
			image = "res/ufo1.gif"
			anterior = "res/ufo2.gif"			
		}else{		
		if (image.equals("res/ufo3.gif") && anterior.equals("res/ufo2.gif")){ 
			image = "res/ufo4.gif"
			anterior = "res/ufo3.gif"			
		}else{		
			image = "res/ufo2.gif"			
		} 
		} 
		} 
		} 				
		} 				
		} 		
		} 
	} 
	
}

