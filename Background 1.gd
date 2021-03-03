extends Sprite

const VELOCITY: float = -0.1
var texture_width: float = 0

func _ready():
	texture_width = texture.get_size().x * scale.x

func _process(delta: float) -> void:
	position.x += VELOCITY
	_attempt_reposition()
	
func _attempt_reposition() -> void:
	if position.x < -texture_width:
		position.x += 2 * texture_width
