extends CanvasLayer

onready var livesText = get_node("LivesLabel")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_lives_text (lives):
	livesText.text = str(lives)
