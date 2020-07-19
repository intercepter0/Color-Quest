extends TextureButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var previously_pressed = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if pressed and (previously_pressed == false):
		hit()
	previously_pressed = pressed

func hit():
	$"../../../player_body/player_sprite/player_attack_animation".perform()
	print("Attack!")
