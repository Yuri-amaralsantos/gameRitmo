extends Control

@onready var note_1: Node2D = $MarginContainer/Internotes/Internote1/Note1
@onready var note_2: Node2D = $MarginContainer/Internotes/Internote2/Note2
@onready var note_3: Node2D = $MarginContainer/Internotes/Internote3/Note3

var rand_number_count: int = 0
var rand_number_holder_1: int 
var rand_number_holder_2: int 
var rand_number_holder_3: int 

var internotes_added: bool = false

var note_1_on_tree: bool = false
var note_2_on_tree: bool = false
var note_3_on_tree: bool = false

const INTERNOTE_1 = preload("res://Scenes/internote/internote_1.tscn")
const INTERNOTE_2 = preload("res://Scenes/internote/internote_2.tscn")
const INTERNOTE_3 = preload("res://Scenes/internote/internote_3.tscn")
const INTERNOTE_4 = preload("res://Scenes/internote/internote_4.tscn")
@onready var internotes = [INTERNOTE_1, INTERNOTE_2, INTERNOTE_3, INTERNOTE_4]

@onready var combo_cooldown: TextureProgressBar = $MarginContainer/Cooldown/ComboCooldown

func _ready() -> void:
	add_new_internotes() 
	SignalManager.on_combo_failed.connect(on_combo_failed)
	combo_cooldown.max_value = GameManager.combo_cooldown_max_value

func _process(delta: float) -> void:
	refresh_combo_cooldown()
	active_combo()
	combo_cleared()
	add_new_internotes()

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
		GameManager.reset_combo_percentage()
		internotes_added = false
		reset_combo()
	
func reset_combo() -> void:
	GameManager.combo_is_possible = false
	GameManager.combo_activated = false

	
func active_combo() -> void:
	if combo_cooldown.value >= GameManager.combo_cooldown_max_value and Input.is_action_just_pressed("Combo") and GameManager.combo_is_possible:
		GameManager.combo_activated = true
	
func instantiate_new_internote(internote: PackedScene, container: Node2D) -> void:
	var new_note = internote.instantiate()
	container.add_child(new_note)
	
func add_new_internotes() -> void: ## ARRUMAR RANDOMIZADOR DUPLICADO
	if internotes_added == false and combo_cooldown.value >= GameManager.combo_cooldown_max_value:
		#for i in range(3):
			#pass
		#for i in randi_range(0, 4):
			#if i == rand_number_holder_1 or i == rand_number_holder_2 or i == rand_number_holder_3:
				#continue
			#elif
		
		instantiate_new_internote(internotes.pick_random(), note_1)
		instantiate_new_internote(internotes.pick_random(), note_2)
		instantiate_new_internote(internotes.pick_random(), note_3)
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
	note_1_on_tree = true


func _on_note_2_child_entered_tree(node: Node) -> void:
	note_2_on_tree = true


func _on_note_3_child_entered_tree(node: Node) -> void:
	note_3_on_tree = true
