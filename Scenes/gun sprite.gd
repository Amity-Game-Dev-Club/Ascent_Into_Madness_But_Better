extends Sprite2D
@export var mousePos = 1
var mouse_pos = 1

@onready var bullet = preload("res://Scenes/buller.tscn")
#gun stats


#gun rotation
func _input(event):
	if event is InputEventMouseMotion:
		mouse_pos =   get_global_mouse_position() 
		look_at(Vector2(mouse_pos.x, mouse_pos.y))


