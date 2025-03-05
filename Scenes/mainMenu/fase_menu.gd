extends Control

@export var buttons: Array[Button]  
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for button in buttons:
		var value = int(button.name.lstrip("Button"))  # Extract number from button name
		button.disabled = value > GameManager.faseUnlocked


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	return


func _on_fase_1_pressed() -> void:
	GameManager.faseAtual = 1
	get_tree().change_scene_to_file("res://Scenes/scene_test/scene_test.tscn")


func _on_fase_2_pressed() -> void:
	GameManager.faseAtual = 2
	get_tree().change_scene_to_file("res://Scenes/scene_test/scene_test.tscn")


func _on_fase_3_pressed() -> void:
	GameManager.faseAtual = 3
	get_tree().change_scene_to_file("res://Scenes/scene_test/scene_test.tscn")


func _on_fase_4_pressed() -> void:
	GameManager.faseAtual = 4
	get_tree().change_scene_to_file("res://Scenes/scene_test/scene_test.tscn")


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/mainMenu/mainMenu.tscn")
