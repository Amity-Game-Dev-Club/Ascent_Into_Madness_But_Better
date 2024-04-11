extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var doublejump = 1
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var bullet = preload("res://Scenes/buller.tscn")


func _physics_process(delta: float) -> void:
	var direction = Input.get_axis("left", "right")
	if not is_on_floor():
		velocity.y += gravity * delta
		if Input.is_action_just_pressed("jump") and doublejump > 0:
			velocity.y = JUMP_VELOCITY
			doublejump= doublejump - 1
		
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		velocity.x = direction * SPEED * 1.2
		doublejump = 1 
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()
	

func _on_area_2d_body_entered(body : Node2D):
	if body.is_in_group("Enemy"):
		print("Enemy Entered")
		HealthManager.decrease_health(1)
