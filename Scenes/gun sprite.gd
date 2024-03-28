extends Sprite2D
@onready var aimcast = $"RayCast2D"
var gunPos = 1
@export var mousePos = 1
var mouse_pos = 1
@onready var muzzle = $"muzzle"
@onready var bullet = preload("res://Scenes/buller.tscn")
#gun stats


#gun rotation
func _input(event):
	if event is InputEventMouseMotion:
		mouse_pos =   get_global_mouse_position() 
		look_at(Vector2(mouse_pos.x, mouse_pos.y))

 #right now im just going to try and use hitscan wepons for now. later i will fix this and mak it into projectile wepons
#func _physics_process(delta: float) -> void:
#	if aimcast.is_colliding():
#		if Input.is_action_pressed("mouseL"):
#			b.shoot = true
