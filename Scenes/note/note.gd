extends Area2D

class_name Note

func _process(delta: float) -> void:
	position.y += GameManager.note_fall_speed * delta
