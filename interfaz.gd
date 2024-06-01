extends CanvasLayer
			#0     #1      #2       #3     #4    #5    #6       #7
enum NPCS {Tito, Nitrato, Azufre, Carbon, Mia, Baron, Maton1, Maton2} 

const IMAGENES : Dictionary = {
	'Tito'    :   preload ("res://icon.svg"),
	'Nitrato' :   preload ("res://icon.svg"),
	'Azufre'  :   preload ("res://icon.svg"),
	'Carbon'  :   preload ("res://icon.svg"),
	'Mia'     :   preload ("res://icon.svg"),
	'Baron'   :   preload ("res://icon.svg"),
	'Maton1'  :   preload ("res://icon.svg"),
	'Maton2'  :   preload ("res://icon.svg"),
}

const TEXTOS_Tito : Array = [
	'Tito : Un paso mas cerca. Este salitre es crucial, pero no puedo dejar que caiga en manos equivocadas.',#0
	'Tito : Necesito carbon, pero no el tipo que piensas. ¿Puedes ayudarme a encontrar algo que haga chispas pero no explote?.',#1
	'Tito : Solo estoy asegurandome de que la fiesta de esta noche sea inolvidable.',#2
	'Tito : Entonces sera mejor que no le digan.',#3
	'Tito : Asi que esto es donde planeas tus fechorias, Baron. Es hora de cambiar un poco tus planes.',#4
	'Tito : Disfruta tu victoria, pero recuerda, no todo es lo que parece.',#5
	'Tito : Solo un poco de alquimia. La verdadera formula esta segura... y el espectaculo acaba de comenzar.'#6
]

const TEXTOS_Mia : Array = [
	'Mia : Por supuesto, !vamos a iluminar el cielo, no a quemarlo!'#0
]

const TEXTOS_Baron : Array = [
	'Baron : !Al fin! !La formula es mia!.',#0
	'Baron : !¿Que has hecho?!',#1
]

const TEXTOS_Maton1 : Array = [
	'Maton1 : ¿Que crees que estas haciendo, chico?',#0
]

const TEXTOS_Maton2 : Array = [
	'Maton2 : El Baron no estara contento con esto.',#0
]

var chats : int = 0

var npc : int

#Funcion mas importante
func poner_TEXTO (TEXTO:String, NPC:int, IMAGEN:Texture) -> void:
	show()
	get_tree().paused = true
	$TEXTO.text = TEXTO
	npc = NPC
	$IMAGEN.texture = IMAGEN
	%ANIM.play("SET_TEXTO")

#Funcion de Tito
func _on_Tito_body_entered(body:Node) -> void:
	if body.is_in_group('Tito'):
		poner_TEXTO(TEXTOS_Tito[chats],NPCS.Tito,IMAGENES['Tito'])
		chats +=1

#Funcion de Mia
func _on_Mia_body_entered(body:Node) -> void:
	if body.is_in_group('Mia'):
		poner_TEXTO(TEXTOS_Mia[chats],NPCS.Mia,IMAGENES['Mia'])
		chats +=1

#Funcion de Maton1
func _on_Maton1_body_entered(body:Node) -> void:
	if body.is_in_group('Maton1'):
		poner_TEXTO(TEXTOS_Maton1[chats],NPCS.Maton1,IMAGENES['Maton1'])
		chats +=1


#Funcion de Maton2
func _on_Maton2_body_entered(body:Node) -> void:
	if body.is_in_group('Maton2'):
		poner_TEXTO(TEXTOS_Maton2[chats],NPCS.Maton2,IMAGENES['Maton2'])
		chats +=1

#Funcion de Baron
func _on_Baron_body_entered(body:Node) -> void:
	if body.is_in_group('Baron'):
		poner_TEXTO(TEXTOS_Baron[chats],NPCS.Baron,IMAGENES['Baron'])
		chats +=1


func _on_BOTON_pressed() -> void:
	match npc: 
		NPCS.Tito:
			if chats < TEXTOS_Tito.size():
				poner_TEXTO(TEXTOS_Tito[chats],NPCS.Tito,IMAGENES['Tito'])
				chats +=1
			else:
				#Conversacion acabo
				chats -= TEXTOS_Tito.size()
				hide()
				get_tree().paused = false
			
		NPCS.Mia:
			if chats < TEXTOS_Mia.size():
				poner_TEXTO(TEXTOS_Mia[chats],NPCS.Mia,IMAGENES['Mia'])
				chats +=1
			else:
				#Conversacion acabo
				chats -= TEXTOS_Mia.size()
				hide()
				get_tree().paused = false
		NPCS.Maton1:
			if chats < TEXTOS_Maton1.size():
				poner_TEXTO(TEXTOS_Maton1[chats],NPCS.Maton1,IMAGENES['Maton1'])
				chats +=1
			else:
				#Conversacion acabo
				chats -= TEXTOS_Maton1.size()
				hide()
				get_tree().paused = false
		NPCS.Maton2:
			if chats < TEXTOS_Maton2.size():
				poner_TEXTO(TEXTOS_Maton2[chats],NPCS.Maton2,IMAGENES['Maton2'])
				chats +=1
			else:
				#Conversacion acabo
				chats -= TEXTOS_Maton2.size()
				hide()
				get_tree().paused = false
		NPCS.Baron:
			if chats < TEXTOS_Baron.size():
				poner_TEXTO(TEXTOS_Baron[chats],NPCS.Baron,IMAGENES['Baron'])
				chats +=1
			else:
				#Conversacion acabo
				chats -= TEXTOS_Baron.size()
				hide()
				get_tree().paused = false
