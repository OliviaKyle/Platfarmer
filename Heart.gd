extends Area2D

export var value = 1
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _process (delta):
	rotation_degrees += 90 * delta

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Heart_body_entered(body):
	body.collect_life(value)
	queue_free()
