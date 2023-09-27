extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	
func _input(event):
	if event is InputEventScreenTouch:
		if event.pressed and event.index == 0:
			pass
			# Touch event started on the Area2D
			# Add your code here
