extends CharacterBody2D


const SPEED = 200.0
var target_position: Vector2

func _ready() -> void:
	target_position = global_position

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed():
		var horizontal_movement = Vector2(event.position).x
		target_position.x = horizontal_movement

func _physics_process(delta: float) -> void:
	var direction = (target_position - global_position).normalized()
	if global_position.distance_to(target_position) > 2:
		velocity = direction * SPEED
		move_and_slide()
	else:
		velocity = Vector2.ZERO
