extends Node2D

# Declare member variables here. Examples:
var a = 0.5
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Sprite").set_rotation(a)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	a = a +.5
	get_node("Sprite").set_rotation(-a)
	get_node("Timer").start()
	pass # Replace with function body.
