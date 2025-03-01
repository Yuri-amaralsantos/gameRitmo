extends Node2D

@export var letter_scene: PackedScene
var letters = ["A", "B", "C", "D", "E"]
var slots = {  # Predefined X positions for each letter
	"A": 100,
	"B": 150,
	"C": 200,
	"D": 250,
	"E": 300
}
var fixed_y = 50  # Initial spawn height (letters always start here)
var score = 0  # Player's score

@onready var score_label = $ScoreLabel  # Reference to a Label for displaying score

func _ready():
	$Timer.wait_time = 1  # Spawns a new letter every 3 seconds
	$Timer.start()
	update_score()

func _on_timer_timeout():
	spawn_random_letter()

func spawn_random_letter():
	var letter = letters.pick_random()  # Pick a random letter
	var letter_instance = letter_scene.instantiate()

	letter_instance.position = Vector2(slots[letter], fixed_y)  # Spawn in the correct lane
	letter_instance.get_node("Label").text = letter  # Set letter text
	letter_instance.hit_callback = Callable(self, "_increase_score")  # Pass as callable
	letter_instance.miss_callback = Callable(self, "_decrease_score")  # Pass as callable
	add_child(letter_instance)

func _increase_score():
	score += 1
	update_score()

func _decrease_score():
	score -= 1
	update_score()

func update_score():
	score_label.text = "Score: " + str(score)
