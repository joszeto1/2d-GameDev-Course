extends Area2D


func _ready():
	area_entered.connect(_on_area_entered)
	
	play_floating_animation()
	

func _on_area_entered(area_that_entered: Area2D):
	queue_free()

func play_floating_animation():
	var tween = create_tween()
	var sprite_2d = get_node("Sprite2D")
	
	var position_offset = Vector2(0,4)
	var duration = randf_range(0.8, 2)
	sprite_2d.position.y = -1 * position_offset.y
	tween.tween_property(sprite_2d, "position", position_offset, duration)
	tween.tween_property(sprite_2d, "position", -1 * position_offset, duration)
	tween.set_loops()
	tween.set_trans(Tween.TRANS_SINE)
