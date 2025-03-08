extends Node2D

@export var phase: String
@onready var phase_anim: AnimationPlayer = $PhaseAnim

func _ready() -> void:
	phase_anim.play(phase)

func _process(delta: float) -> void:
	pass
		
func end_phase():
	print("Phase ended")
	print(GameManager.faseAtual == GameManager.faseUnlocked)
	if GameManager.faseAtual == GameManager.faseUnlocked and ScoreManager.current_score > 5:
		GameManager.faseUnlocked+=1
	print(GameManager.faseUnlocked)
	get_tree().change_scene_to_file("res://Scenes/mainMenu/mainMenu.tscn")
	
