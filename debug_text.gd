extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var to_show = {
	"Hover on color buttons": null
}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func update():
	text = ''
	for i in range(len(to_show)):
		text += str(to_show.keys()[i]) + ": " + str(to_show.values()[i]) + "\n"
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update()
