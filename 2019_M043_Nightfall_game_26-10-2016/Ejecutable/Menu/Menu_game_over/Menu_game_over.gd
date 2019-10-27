extends Node

var preMenu = load("res://Ejecutable/Menu/Menu_niveles/Escena_menu_niveles.tscn")
var Menu
var My_timer = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func cambia_pantalla():
	Menu =preMenu.instance()
	get_node("/root/Nodo_Dios").add_child(Menu)
	get_node("/root/Nodo_Dios/Music_menu").play()
	$".".queue_free()
	

func _on_Timer_timeout():
	My_timer += 1
	get_node("Label").set_text(str(3-My_timer))
	if My_timer > 3:
		cambia_pantalla()
	get_node("Botones/Timer").start()
	pass # Replace with function body.


func _on_Inicio_pressed():
	cambia_pantalla()
	pass # Replace with function body.
