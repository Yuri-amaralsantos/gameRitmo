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

func on_key_pressed() -> void: ## ARRUMAR ISSO, SE EU APERTAR OUTRO BOTÃO SEM SER O CORRETO EU TENHO QUE APAGAR A AREA2D E CANCELAR O COMBO OU ALGUMA COISA
    if is_on_area and Input.is_action_just_pressed("KeyNote%s" % stored_area_number):
        if stored_area != null:
            add_score()
    elif is_on_area and Input.is_action_just_pressed("KeyNote1"):
        if stored_area != null:
            stored_area.queue_free()
    elif is_on_area and Input.is_action_just_pressed("KeyNote2"):
        if stored_area != null:
            stored_area.queue_free()
    elif is_on_area and Input.is_action_just_pressed("KeyNote3"):
        if stored_area != null:
            stored_area.queue_free()
    elif is_on_area and Input.is_action_just_pressed("KeyNote4"):
        if stored_area != null:
            stored_area.queue_free()

func add_score() -> void:
    ScoreManager.add_score()
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
    checks_what_note_is(area)
    ScoreManager.score_holder = ScoreManager.NOTE_SCORE.SOON

func _on_collision_perfect_area_entered(area: Area2D) -> void:
    ScoreManager.score_holder = ScoreManager.NOTE_SCORE.PERFECT

func _on_collision_late_area_entered(area: Area2D) -> void:
    ScoreManager.score_holder = ScoreManager.NOTE_SCORE.LATE

func _on_area_exited(area: Area2D) -> void:
    if area.is_in_group("KeyNote"):
        stored_area_number = 0
        is_on_area = false
        stored_area = null

func _on_area_entered(area: Area2D) -> void:
    if area.is_in_group("KeyNote"):
        is_on_area = true
