extends Area2D


@onready var buble_sprite: Sprite2D = get_node("Sprite2D")
@onready var death_sprite: Sprite2D = get_node("Death")
@onready var death_timer: Timer = get_node("Timer")
@onready var screen_size = get_viewport().size

@export var move_speed = 3
var direction


# Called when the node enters the scene tree for the first time.
func _ready():
	var scaling = randf_range(2, 5)
	scale.x *= scaling
	scale.y *= scaling
	var random_angle = randf() * 2 * PI
	direction = Vector2(cos(random_angle), sin(random_angle))
	direction = direction.normalized()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += move_speed*direction
	if(position.x > screen_size.x or position.x < 0 or position.y > screen_size.y or position.y < 0):
		queue_free()


func _input(event):
	if event is InputEventScreenTouch:
		if event.pressed and event.index == 0:
			buble_sprite.visible = false
			death_sprite.visible = true
			set_process(false)
			death_timer.start()
			# Touch event started on the Area2D
			# Add your code here


func _on_timer_timeout():
	queue_free()
