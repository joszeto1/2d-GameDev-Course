extends Node2D

@onready var sprite_2d = $Sprite2D
@onready var shadow = $Shadow
@onready var wait_timer = $WaitTimer

func _ready():
	wait_timer.wait_time = randf_range(1,3)
	wait_timer.one_shot = true
	wait_timer.timeout.connect(_bird_hop)
	wait_timer.start()



func _bird_hop():
	
	const HOP_DURATION = 0.25
	const HALF_HOP_DURATION = HOP_DURATION/2
	
	var random_direction = Vector2(1,0).rotated(randf() * 2 * PI)
	var land_position = random_direction * randf_range(0,30)
	
	var tween = create_tween().set_parallel()
	tween.tween_property(sprite_2d, "position:x", land_position.x, HOP_DURATION)
	tween.tween_property(shadow,"position", land_position, HOP_DURATION)
	
	tween = create_tween()
	tween.set_trans(Tween.TRANS_QUAD)
	tween.set_ease(Tween.EASE_OUT)
	const JUMP_HEIGHT = 16
	tween.tween_property(sprite_2d, "position:y", land_position.y - JUMP_HEIGHT, HALF_HOP_DURATION)
	tween.set_ease(Tween.EASE_IN)
	tween.tween_property(sprite_2d, "position:y", land_position.y, HALF_HOP_DURATION)
	
	wait_timer.wait_time = randf_range(1,3)
	tween.finished.connect(wait_timer.start)
