extends Node2D


func _ready() -> void:
	SignalManager.on_music_ended.connect(on_music_ended)


func _process(delta: float) -> void:
	return_to_menu()
		
func return_to_menu() -> void:
	if Input.is_action_just_pressed("ReturnToMenu"):
		SceneManager.return_to_main_menu()
	
	
func on_music_ended() -> void:
	pass

func stop_game_end() -> void:
	pass
