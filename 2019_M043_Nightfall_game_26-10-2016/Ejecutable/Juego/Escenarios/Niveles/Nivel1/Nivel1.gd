extends Node2D

#var preMenu = load("res://Ejecutable/Menu/Menu_niveles/Escena_menu_niveles.tscn")
#var Menu
var preMenuGO = load("res://Ejecutable/Menu/Menu_game_over/Menu_game_over.tscn")
var MenuGO
var preMenuWin = load("res://Ejecutable/Menu/Menu_win/Menu_win.tscn")
var MenuWin
var My_timer = 0
var Mi_tiempo = 30
var veloTrenTSubir = 10 # aumento de velocidad
var veloTren = veloTrenTSubir
var veloNightfall = veloTrenTSubir


func _ready():
	get_node("velo2alta").hide()
	get_node("Sprite").hide()
	
func salir_a_GO():
	MenuGO =preMenuGO.instance()
	get_node("/root/Nodo_Dios").add_child(MenuGO)
	get_node("/root/Nodo_Dios/Music_menu").play()
	$".".queue_free()

func salir_a_win():
		MenuWin =preMenuWin.instance()
		get_node("/root/Nodo_Dios").add_child(MenuWin)
		get_node("/root/Nodo_Dios/Music_menu").play()
		$".".queue_free()
	
func _on_Timer_timeout():
	My_timer += 1
	get_node("Label").set_text(str(Mi_tiempo-My_timer))
	if My_timer > Mi_tiempo:
		salir_a_win()
	get_node("Timer").start()
	pass # Replace with function body.


func _on_Velocidad_timeout():
	var actual
	var actual2
	var actualNightfall
	if veloTren > 5:
		veloTren = veloTren -1
		veloNightfall = veloNightfall + 1

	
	actual = get_node("terreno").get_position().x
	get_node("terreno").set_position(Vector2(actual + veloTren, get_node("terreno").get_position().y))
#	print(get_node("terreno").get_position().y)

	actual2 = get_node("terreno2").get_position().x
	get_node("terreno2").set_position(Vector2(actual2 + veloTren, get_node("terreno2").get_position().y))
#	print(get_node("terreno").get_position().y)
	
	actualNightfall =  get_node("Nightfall").get_position().x
	get_node("Nightfall").set_position(Vector2((actualNightfall - veloNightfall - 0.5 ), get_node("Nightfall").get_position().y))
	
	if get_node("terreno").get_position().x >= 1024:
		get_node("terreno").set_position(Vector2(get_node("terreno2").get_position().x-1024,0))
	if get_node("terreno2").get_position().x >= 1024:
		get_node("terreno2").set_position(Vector2(get_node("terreno").get_position().x-1024,0))
		
	if veloTren > 30:
		if get_node("Sprite").visible == false:
			get_node("velo2alta").hide()
			get_node("Sprite").show()
			
		else:
			get_node("Sprite").hide()
			get_node("velo2alta").show()
			
		if get_node("Sprite").visible == false and get_node("velo2alta").visible == false:
			get_node("velo2alta").show()
			print(get_node("velo2alta").visible)

		if veloTren > 55:
			print("aqui se ropmpe el tren")
			salir_a_GO()

	if veloTren < 30 and get_node("velo2alta").visible:
		get_node("velo2alta").hide()
	
	if veloTren < 30 and get_node("Sprite").visible:
		get_node("Sprite").hide()
	
	if get_node("Nightfall").get_position().x < 100:
			print("te ha pillao la noche")
			salir_a_GO()
		
#	if veloTren < 30 and get_node("velo2alta").visible:
#		get_node("velo2alta").show()
		
	get_node("terreno/Velocidad").start()
	get_node("velo").set_text(str(veloTren))
	pass # Replace with function body.



func _on_TextureButton_pressed():
	veloTren = veloTren + veloTrenTSubir
	veloNightfall = veloNightfall - veloTrenTSubir
	pass # Replace with function body.
