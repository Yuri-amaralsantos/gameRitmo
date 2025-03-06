extends Area2D

class_name Internote

@export var internote_number: int = 0

func _process(delta: float) -> void:
	combo_time()
	
func combo_time() -> void:
	if GameManager.combo_activated == true:
		if Input.is_action_just_pressed("Internote%s" % internote_number):
			queue_free()
	
	


func _on_tree_exiting() -> void:
	#emitir um som da nota acertada
	pass # Replace with function body.
