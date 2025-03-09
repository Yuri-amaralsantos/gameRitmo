extends Node


const SIMPLE_TRANSITION = preload("res://Scenes/simple_transition/simple_transition.tscn")

const PHASE_1 = preload("res://Scenes/scene_test/phase_1.tscn")
const PHASE_2 = preload("res://Scenes/scene_test/phase_2.tscn")

const MAIN_MENU = preload("res://Scenes/main_menu/main_menu.tscn")
const PHASE_SELECTOR = preload("res://Scenes/phase_selector/phase_selector.tscn")



func _ready() -> void:
	SignalManager.on_change_to_phase.connect(on_change_to_phase)

func change_to_scene(scene: PackedScene) -> void: 
	scene_transition()
	get_tree().change_scene_to_packed(scene)
	
func change_to_phase_selector() -> void: 
	change_to_scene(PHASE_SELECTOR)
	
func return_to_main_menu() -> void:
	change_to_scene(MAIN_MENU)

func on_change_to_phase(phase: int) -> void:
	match phase:
		1:
			change_to_scene(PHASE_1)
		2: 
			change_to_scene(PHASE_2)
			
func scene_transition() -> void:
	var trans = SIMPLE_TRANSITION.instantiate()
	add_child(trans)
