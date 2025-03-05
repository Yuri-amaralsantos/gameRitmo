extends Area2D

@onready var collision_soon: Area2D = $CollisionSoon
@onready var collision_perfect: Area2D = $CollisionPerfect
@onready var collision_late: Area2D = $CollisionLate

enum AREA_NUMBER {NOTE1 = 1, NOTE2 = 2, NOTE3 = 3, NOTE4 = 4}

var stored_area_number: int = 0
var is_on_area: bool = false
var stored_area: Area2D

func _process(delta: float) -> void:
	on_key_pressed()

func on_key_pressed() -> void:
	if is_on_area and Input.is_action_just_pressed("KeyNote%s" % stored_area_number):
		if stored_area != null:
			SignalManager.on_note_correct.emit("KeyNote%s" % stored_area_number)
			add_score()
	elif is_on_area and Input.is_action_just_pressed("KeyNote1"):
		if stored_area != null:
			key_wrong_pressed()
	elif is_on_area and Input.is_action_just_pressed("KeyNote2"):
		if stored_area != null:
			key_wrong_pressed()
	elif is_on_area and Input.is_action_just_pressed("KeyNote3"):
		if stored_area != null:
			key_wrong_pressed()
	elif is_on_area and Input.is_action_just_pressed("KeyNote4"):
		if stored_area != null:
			key_wrong_pressed()

func key_wrong_pressed() -> void:
	GameManager.reset_combo_percentage()
	stored_area.queue_free()
	SignalManager.on_note_incorrect.emit()

func add_score() -> void:
	ScoreManager.add_score()
	GameManager.increase_combo_percentage()
	GameManager.increase_speed_notes_percentage()
	stored_area.queue_free()

func checks_what_note_is(area: Area2D) -> void:
	if area.is_in_group("KeyNote1"):
		stored_area_number = AREA_NUMBER.NOTE1
		stored_area = area
	elif area.is_in_group("KeyNote2"):
		stored_area_number = AREA_NUMBER.NOTE2
		stored_area = area
	elif area.is_in_group("KeyNote3"):
		stored_area_number = AREA_NUMBER.NOTE3
		stored_area = area
	elif area.is_in_group("KeyNote4"):
		stored_area_number = AREA_NUMBER.NOTE4
		stored_area = area

func _on_collision_soon_area_entered(area: Area2D) -> void:
	if area.is_in_group("KeyNote"):
		checks_what_note_is(area)
		ScoreManager.score_holder = ScoreManager.NOTE_SCORE.SOON
		GameManager.increase_combo_percentage_holder = GameManager.COMBO_PERCENTAGE_INCREASE.SOON
		GameManager.increase_speed_notes_percentage_holder = GameManager.SPEED_NOTES_PERCENTAGE_INCREASE.SOON

func _on_collision_perfect_area_entered(area: Area2D) -> void:
	if area.is_in_group("KeyNote"):
		ScoreManager.score_holder = ScoreManager.NOTE_SCORE.PERFECT
		GameManager.increase_combo_percentage_holder = GameManager.COMBO_PERCENTAGE_INCREASE.PERFECT
		GameManager.increase_speed_notes_percentage_holder = GameManager.SPEED_NOTES_PERCENTAGE_INCREASE.PERFECT

func _on_collision_late_area_entered(area: Area2D) -> void:
	if area.is_in_group("KeyNote"):
		ScoreManager.score_holder = ScoreManager.NOTE_SCORE.LATE	
		GameManager.increase_combo_percentage_holder = GameManager.COMBO_PERCENTAGE_INCREASE.LATE
		GameManager.increase_speed_notes_percentage_holder = GameManager.SPEED_NOTES_PERCENTAGE_INCREASE.LATE

func _on_area_exited(area: Area2D) -> void:
	if area.is_in_group("KeyNote"):
		ScoreManager.score_holder = 0
		GameManager.increase_combo_percentage_holder = 0
		stored_area_number = 0
		is_on_area = false
		stored_area = null
		GameManager.combo_is_possible = true

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("KeyNote"):
		is_on_area = true
		if GameManager.combo_activated == true:
			SignalManager.on_combo_failed.emit()
			
