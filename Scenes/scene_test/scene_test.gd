extends Node2D

@onready var faseAnim = $AnimationPlayer

func _ready() -> void:
	faseAnim.play("phase")

func _process(delta: float) -> void:
	pass
		
func end_phase():
	print("Phase ended")
	print(GameManager.faseAtual == GameManager.faseUnlocked)
	if GameManager.faseAtual == GameManager.faseUnlocked and ScoreManager.current_score > 5:
		GameManager.faseUnlocked+=1
	print(GameManager.faseUnlocked)
	get_tree().change_scene_to_file("res://Scenes/mainMenu/mainMenu.tscn")
	
