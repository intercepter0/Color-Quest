extends Sprite


const SPRITE_CHANGE_SPEED = 16
var frame_change_timer = 0
var current_frame_number = -1
var animation_range = [0,3]
var perform = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	if perform:
		visible = true
		frame_change_timer += delta*SPRITE_CHANGE_SPEED
		if animation_range:
			current_frame_number = int(animation_range[0] + frame_change_timer)
			if current_frame_number > animation_range[1]:
				current_frame_number = animation_range[0]
				frame_change_timer = 0
				perform = false
			frame = current_frame_number
	else:
		visible = false

func perform():
	perform = true
