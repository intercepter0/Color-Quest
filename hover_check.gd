extends TextureButton



# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var button_red = get_node("button_red")
onready var button_green = get_node("button_green")
onready var button_blue = get_node("button_blue")

var before_on_panel = false
var current_color_hover = null
var combination = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func is_red() -> bool:
	return button_red.is_hovered()
	
func is_green() -> bool:
	return button_green.is_hovered()
	
func is_blue() -> bool:
	return button_blue.is_hovered()
	
	
func is_on_panel() -> bool:
	return (is_hovered() or is_red() or is_blue() or is_green())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$"../debug_text".to_show["Hover on color buttons"] = is_on_panel()
	if is_on_panel():
		if before_on_panel == false:
			combination = []
		if is_red() and current_color_hover != "red":
			combination.append([1,0,0])
			current_color_hover = "red"
		elif is_green() and current_color_hover != "green":
			combination.append([0,1,0])
			current_color_hover = "green"
		elif is_blue() and current_color_hover != "blue":
			combination.append([0,0,1])
			current_color_hover = "blue"
		else:
			pass
		set_attack_color(calculate_color(combination))
		
	else:
		combination = []
		current_color_hover = null
	before_on_panel = is_on_panel()
	
func calculate_color(array):
	var reds = 0.0 # init as float
	var greens = 0.0
	var blues = 0.0
	if array:
		for i in array:
			reds += i[0]
			greens += i[1]
			blues += i[2]
		return [2*reds/len(array), 2*greens/len(array), 2*blues/len(array), 1]
	else:
		return [1,1,1,1]
	
	
func set_attack_color(array):
	var color = Color(array[0], array[1], array[2], array[3])
	$"../../player_body/player_sprite/player_weapon".modulate = color
	$attack_button.modulate = color
