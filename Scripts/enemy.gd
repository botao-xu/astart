extends Area2D

@export var slimer_speed : float = -100

func _physics_process(delta: float) -> void:
	position += Vector2(slimer_speed, 0) * delta


func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		body.game_over()
