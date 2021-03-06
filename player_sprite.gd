extends Sprite


const SPRITE_CHANGE_SPEED = 8
var frame_change_timer = 0
var current_frame_number = -1
var animation_range = null
var animations = {
	"run": [8,13],
	"idle": [0,3]
}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_animation(animation_name):
	if animation_range != animations[animation_name] and false:
		animation_range = animations[animation_name]
		frame_change_timer = 0
	

func _physics_process(delta):
	
	frame_change_timer += delta*SPRITE_CHANGE_SPEED
	if animation_range:
		current_frame_number = int(animation_range[0] + frame_change_timer)
		if current_frame_number > animation_range[1]:
			current_frame_number = animation_range[0]
			frame_change_timer = 0
		frame = current_frame_number
