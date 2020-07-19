extends KinematicBody2D


var velocity = Vector2.ZERO
const SPEED = 4
onready var j = get_node("../ui/joystick")
onready var sprite = get_node("player_sprite")
onready var weapon = get_node("player_sprite/player_weapon")
onready var buttons_panel = get_node("../ui/buttons_panel")

func _ready():
	
	pass # Replace with function body.

func _physics_process(delta):
	if Input.is_action_pressed("ui_up"):
		velocity.y = -SPEED
	elif Input.is_action_pressed("ui_down"):
		velocity.y = SPEED
	else:
		velocity.y = 0
		
	if Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
	else:
		velocity.x = 0
	
	if velocity.x == 0 and velocity.y == 0:
		velocity.x = j.output.x * SPEED
		velocity.y = j.output.y * SPEED
		
	if velocity.x == 0 and velocity.y == 0:
		sprite.set_animation("idle")
	else:
		sprite.flip_h = velocity.x < 0
		sprite.set_animation("run")
	if velocity.x > 0:
		weapon.rotation = velocity.y*PI/8 + PI/2
	elif velocity.x < 0:
		weapon.rotation = -velocity.y*PI/8 - PI/2
	position.x += velocity.x
	position.y += velocity.y



#func _process(delta):
#	pass
