extends Area2D

func _on_area_entered(area_that_entered: Area2D):
	queue_free()
	
func _ready():
	area_entered.connect(_on_area_entered)
