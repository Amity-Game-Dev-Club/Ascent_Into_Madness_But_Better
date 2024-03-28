extends Sprite2D
var shoot = false
const Damage = 25
# Called when the node enters the scene tree for the first time.
func _ready():
	set_as_top_level(true)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if shoot:
		pass



func _on_area_2d_body_entered(body):
	if body.is_in_group("enemy"):
		body.health = body.health-Damage
		queue_free()
	elif body.is_in_group("floor"):
		queue_free()
