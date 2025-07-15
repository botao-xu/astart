extends Area2D

@export var bullet_speed : float = 100
var is_game_won : bool = false

func _ready() -> void:
	await get_tree().create_timer(3).timeout
	queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if not is_game_won:
		position += Vector2(bullet_speed, 0) * delta

func freeze_bullet():
	is_game_won = true
