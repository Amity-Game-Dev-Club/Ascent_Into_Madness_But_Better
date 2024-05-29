extends Node2D
@onready var wormyboi = preload("res://Scenes/worm .tscn")
func _ready():
	wormyboi.instantiate()
