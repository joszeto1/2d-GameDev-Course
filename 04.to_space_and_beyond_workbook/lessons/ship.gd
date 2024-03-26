extends Sprite2D

var boost_speed = 1500
var normal_speed = 600

var max_speed = normal_speed
var velocity = Vector2(0,0)
var steering_factor = 8

func _process(delta):
	var direction = Vector2(0,0)
	direction.x = Input.get_axis("move_left","move_right")
	direction.y = Input.get_axis("move_up","move_down")
	
	if direction.length() > 1:
		direction = direction.normalized()
	
	if Input.is_action_just_pressed("boost"):
		max_speed = boost_speed
		get_node("Timer").start()
		
	var desired_velocity = max_speed * direction
	var steering_vector = desired_velocity - velocity
	velocity += steering_vector * steering_factor * delta
	position += velocity * delta
	
	if direction.length() > 0:
		rotation = velocity.angle()

func _on_timer_timeout():
	max_speed = normal_speed
