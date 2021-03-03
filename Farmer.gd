extends KinematicBody2D


signal fell
signal died
signal create_ladder

var lives = 3

export var speed = 200
var jumpForce = 800
var gravity = 1800
var screen_size
var velocity = Vector2()

onready var hud = get_node("/root/Main/HUD")

func _ready():
	screen_size = get_viewport_rect().size
	emit_signal("fell")

func _physics_process(delta):
	if is_on_floor():
		velocity.x = 0
	
	if Input.is_action_pressed ("move_right") and is_on_floor():
		velocity.x += speed
	if Input.is_action_pressed("move_left") and is_on_floor():
		velocity.x -= speed
	if Input.is_action_pressed("ladder_up") and is_on_floor():
		emit_signal("create_ladder")
	if Input.is_action_pressed("ladder_down") and is_on_floor():
		pass
	
	velocity = move_and_slide(velocity, Vector2.UP)
	velocity.y += gravity * delta
	
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y -= jumpForce

	position.x = clamp(position.x, 0, screen_size.x)

	if velocity.x != 0:
		$AnimatedSprite.animation = "Walk"
		$AnimatedSprite.flip_h = velocity.x < 0
	else:
		$AnimatedSprite.animation = "Idle"
	
	if position.y > screen_size.y:
		lives -= 1
		hud.set_lives_text(lives)
		if lives < 1:
			emit_signal("died")
			get_tree().paused = true
			$AnimatedSprite.animation = "Death"
		else:
			emit_signal("fell")

func collect_life (value):
	lives += value
	hud.set_lives_text(lives)

func start(pos):
	position = pos
