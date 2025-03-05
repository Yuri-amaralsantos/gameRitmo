extends Control

@onready var note_1: Node2D = $MarginContainer/Internotes/Internote1/Note1
@onready var note_2: Node2D = $MarginContainer/Internotes/Internote2/Note2
@onready var note_3: Node2D = $MarginContainer/Internotes/Internote3/Note3


var internotes_added: bool = false


var note_1_on_tree: bool = false
var note_2_on_tree: bool = false
var note_3_on_tree: bool = false


var note_1_name: String = ""
var note_2_name: String = ""
var note_3_name: String = ""
var intenotes_name: Array = ["Internote1", "Internote2", "Internote3", "Internote4", ]

const INTERNOTE_1 = preload("res://Scenes/internote/internote_1.tscn")
const INTERNOTE_2 = preload("res://Scenes/internote/internote_2.tscn")
const INTERNOTE_3 = preload("res://Scenes/internote/internote_3.tscn")
const INTERNOTE_4 = preload("res://Scenes/internote/internote_4.tscn")
@onready var internotes = [INTERNOTE_1, INTERNOTE_2, INTERNOTE_3, INTERNOTE_4]

@onready var combo_cooldown: TextureProgressBar = $MarginContainer/Cooldown/ComboCooldown

func _ready() -> void:
	SignalManager.on_combo_failed.connect(on_combo_failed)
	combo_cooldown.max_value = GameManager.combo_cooldown_max_value

func _process(delta: float) -> void:
	refresh_combo_cooldown()
	active_combo()
	combo_cleared()
	wrong_key_pressed()

func wrong_key_pressed() -> void:
	#if (Input.is_action_just_pressed(note_1_name)) or (Input.is_action_just_pressed(note_2_name)) or (Input.is_action_just_pressed(note_3_name)) and GameManager.combo_activated:
		#print("nice")
	pass
	

func on_combo_failed() -> void:
	GameManager.reset_combo_percentage()
	print("combo failed")
	remove_internotes()
	reset_combo()

func refresh_combo_cooldown() -> void:
	combo_cooldown.value = GameManager.combo_percentage
	
func combo_cleared() -> void:
	if note_1_on_tree == false and note_2_on_tree == false and note_3_on_tree == false and GameManager.combo_activated:
		print("combo_cleared")
		ScoreManager.add_combo_points()
		GameManager.reset_combo_percentage()
		internotes_added = false
		reset_combo()
	
func reset_combo() -> void:
	GameManager.combo_is_possible = false
	GameManager.combo_activated = false
	
func active_combo() -> void:
	if combo_cooldown.value >= GameManager.combo_cooldown_max_value and Input.is_action_just_pressed("Combo") and GameManager.combo_is_possible:
		add_new_internotes()
		GameManager.combo_activated = true
	
func instantiate_new_internote(internote: PackedScene, container: String) -> void:
	var new_note = internote.instantiate()
	match container:
		"note_1":
			note_1.add_child(new_note)
		"note_2":
			note_2.add_child(new_note)
		"note_3":
			note_3.add_child(new_note)
	
func add_new_internotes() -> void: ## ARRUMAR RANDOMIZADOR DUPLICADO
	if internotes_added == false:
		internotes.shuffle()
		for i in range(0, 4):
			instantiate_new_internote(internotes[i], "note_%s" % i)
		internotes_added = true
	
func remove_internotes() -> void:
	remove_internote_children(note_1.get_children())
	remove_internote_children(note_2.get_children())
	remove_internote_children(note_3.get_children())
	internotes_added = false
	
func remove_internote_children(internote: Array) -> void:
	for child in internote:
		child.queue_free()







func _on_note_1_child_exiting_tree(node: Node) -> void:
	note_1_on_tree = false


func _on_note_2_child_exiting_tree(node: Node) -> void:
	note_2_on_tree = false


func _on_note_3_child_exiting_tree(node: Node) -> void:
	note_3_on_tree = false




func _on_note_1_child_entered_tree(node: Node) -> void:
	print(node.name)
	note_1_name = node.name
	note_1_on_tree = true


func _on_note_2_child_entered_tree(node: Node) -> void:
	print(node.name)
	note_1_name = node.name
	note_2_on_tree = true


func _on_note_3_child_entered_tree(node: Node) -> void:
	print(node.name)
	note_1_name = node.name
	note_3_on_tree = true
