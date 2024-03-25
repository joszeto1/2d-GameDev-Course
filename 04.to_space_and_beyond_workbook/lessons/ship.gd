extends Sprite2D

var velocity = Vector2(0,0)
var max_speed = 600

func _process(delta):
	var direction = Vector2(0,0)
	direction.x = Input.get_axis("move_left","move_right")
	direction.y = Input.get_axis("move_up","move_down")
	
	if direction.length() > 1:
		direction = direction.normalized()
	
	velocity = direction * max_speed
	position += velocity * delta
	
	if direction.length() > 0:
		rotation = velocity.angle()
