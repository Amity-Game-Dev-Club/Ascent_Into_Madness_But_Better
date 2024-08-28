extends CharacterBody2D
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var doublejump = 1
var max_health : int = 3
var current_health : int = 3
var direction :float = 0
@onready var animation = $AnimatedSprite2D
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var bullet = preload("res://Scenes/buller.tscn")
func _ready():
	pass
func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("right"):
		animation.play("Run")
	direction = lerp(direction, Input.get_axis("left", "right"), delta * 10)
	if not is_on_floor():
		velocity.y += gravity * delta
		if Input.is_action_just_pressed("jump") and doublejump > 0:
			velocity.y = JUMP_VELOCITY
			doublejump = doublejump - 1
		
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		doublejump = 1 
	if direction:
		velocity.x =  direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()
	

func _on_area_2d_body_entered(body : Node2D):
	if body.is_in_group("Enemy"):
		print("enemy is being touched bad")
		decrease_health(1)
		
func decrease_health(health_amount : int):
	current_health -= health_amount
	
	if current_health < 0:
		current_health = 0
		get_tree().change_scene_to_file("res://Scenes/TitleScreen.tscn")

func increase_health(health_amount : int):
	current_health += health_amount
	
	if current_health > max_health:
		current_health = max_health
