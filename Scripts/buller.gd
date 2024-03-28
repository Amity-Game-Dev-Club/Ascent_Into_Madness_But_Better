extends RigidBody2D
var shoot = false
const Damage = 25

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if shoot:
		add_constant_force(Vector2(10,0),Vector2(-0.1,0))



func _on_area_2d_body_entered(body):
	if body.is_in_group("enemy"):
		body.health = body.health-Damage
		queue_free()
	else:
		if body.is_in_group("floor"):
			queue_free()
			
