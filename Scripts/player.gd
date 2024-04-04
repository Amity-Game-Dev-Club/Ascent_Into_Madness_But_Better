extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var doublejump = 1
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var aimcast = $"gun sprite/RayCast2D"
@onready var muzzle = $"gun sprite/muzzle"
@onready var bullet = preload("res://Scenes/buller.tscn")


func _physics_process(delta: float) -> void:

	if aimcast.is_colliding():
		if Input.is_action_pressed("mouseL"):
			var b = bullet.instantiate()
			muzzle.add_child(b)
			#b.look_at(aimcast.get_collision_point())
			b.position = position
			b.direction =(aimcast.target_position)
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
	
