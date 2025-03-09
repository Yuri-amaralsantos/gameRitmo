extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	exit_game()
	
func exit_game() -> void:
	if Input.is_action_just_pressed("ReturnToMenu"):
		get_tree().quit()


func _on_start_button_down() -> void:
	SceneManager.change_to_phase_selector()


func _on_exit_button_down() -> void:
	get_tree().quit()
