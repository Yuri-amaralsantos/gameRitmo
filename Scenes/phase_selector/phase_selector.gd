extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	return_to_menu()
		
func return_to_menu() -> void:
	if Input.is_action_just_pressed("ReturnToMenu"):
		SceneManager.return_to_main_menu()
