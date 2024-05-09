extends CharacterBody2D

var max_health : int = 10
var current_health : int
var hit_bullet = preload("res://Scenes/buller.tscn")
func _on_area_2d_body_entered(body : Node2D):
	if body.is_class("Bullet"):
		decrease_health(1)



func decrease_health(health_amount : int):
	current_health -= health_amount
	
	if current_health < 0:
		current_health = 0    # make sure that this works
		print("Enemy Dies")

func increase_health(health_amount : int):
	current_health += health_amount
	
	if current_health > max_health:
		current_health = max_health
