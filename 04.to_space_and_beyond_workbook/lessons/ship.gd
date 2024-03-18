extends Sprite2D

var velocity = Vector2(500,0)

func _process(delta):
	position += velocity * delta
	rotation = velocity.angle()
