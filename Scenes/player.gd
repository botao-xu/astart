extends CharacterBody2D

@export var move_speed :float = 50

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	velocity = Input.get_vector("left", "right", "up", "down") * move_speed
	move_and_slide()
