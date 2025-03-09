extends Control

@onready var label: Label = $MarginContainer/Label
@onready var score_label: Label = $MarginContainer/VBoxContainer/ScoreLabel
@onready var rank_label: Label = $MarginContainer/VBoxContainer/RankLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	get_score_and_rank()
	
func get_score_and_rank() -> void:
	score_label.text = str(ScoreManager.get_score())
	rank_label.text = ScoreManager.get_rank()
	
func return_to_main_menu() -> void:
	if Input.is_action_just_pressed("ReturnToMenu"):
		SceneManager.return_to_main_menu()
