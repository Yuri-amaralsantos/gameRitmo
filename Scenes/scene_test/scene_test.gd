extends Node2D

const NOTE_1: PackedScene = preload("res://Scenes/note/note_1.tscn")
const NOTE_2: PackedScene = preload("res://Scenes/note/note_2.tscn")
const NOTE_3: PackedScene = preload("res://Scenes/note/note_3.tscn")
const NOTE_4: PackedScene = preload("res://Scenes/note/note_4.tscn")
const NOTE_5: PackedScene = preload("res://Scenes/note/note_5.tscn")

@onready var marker_note_area_1: Marker2D = $NoteSpawnerContainer/MarkerNoteArea1
@onready var marker_note_area_2: Marker2D = $NoteSpawnerContainer/MarkerNoteArea2
@onready var marker_note_area_3: Marker2D = $NoteSpawnerContainer/MarkerNoteArea3
@onready var marker_note_area_4: Marker2D = $NoteSpawnerContainer/MarkerNoteArea4
@onready var marker_note_area_5: Marker2D = $NoteSpawnerContainer/MarkerNoteArea5

@onready var timer_note_1: Timer = $TimerContainer/TimerNote1
@onready var timer_note_2: Timer = $TimerContainer/TimerNote2
@onready var timer_note_3: Timer = $TimerContainer/TimerNote3
@onready var timer_note_4: Timer = $TimerContainer/TimerNote4
@onready var timer_note_5: Timer = $TimerContainer/TimerNote5

@onready var note_container: Node2D = $NoteContainer


func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	pass
	

func instantiate_new_note(pos: Vector2, note: PackedScene) -> void:
	var new_note: Note = note.instantiate()
	new_note.position = pos
	note_container.add_child(new_note)


func _on_timer_note_1_timeout() -> void:
	instantiate_new_note(marker_note_area_1.position, NOTE_1)

func _on_timer_note_2_timeout() -> void:
	instantiate_new_note(marker_note_area_2.position, NOTE_2)

func _on_timer_note_3_timeout() -> void:
	instantiate_new_note(marker_note_area_3.position, NOTE_3)

func _on_timer_note_4_timeout() -> void:
	instantiate_new_note(marker_note_area_4.position, NOTE_4)

func _on_timer_note_5_timeout() -> void:
	instantiate_new_note(marker_note_area_5.position, NOTE_5)
