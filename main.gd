extends Node2D


@onready var HUD: CanvasLayer = get_node("HUD")
@onready var bubles: Node2D = get_node("Bubles")
@onready var screen_size = get_viewport().size
const BUBLES: Array = [
	preload("res://Bubles/buble_blue.tscn"),
	preload("res://Bubles/buble_red.tscn"),
	preload("res://Bubles/buble_green.tscn")]


# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(false)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if(bubles.get_child_count() <= 20):
		var random_x = randi() % screen_size.x
		var random_y = randi() % screen_size.y
		var buble = BUBLES[randi() % BUBLES.size()].instantiate()
		buble.position = Vector2(random_x, random_y)
		bubles.add_child(buble)


func _on_start_button_pressed():
	HUD.visible = false
	set_process(true)
