extends Area2D

@export var slimer_speed : float = -100
var is_dead : bool = false

func _physics_process(delta: float) -> void:
	if not is_dead:
		position += Vector2(slimer_speed, 0) * delta
		
		# Destroy slimer if it goes past the left edge of the screen
		if position.x < -266:
			queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		body.game_over()


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("bullet"):
		is_dead = true
		area.queue_free()
		
		# Increase score when slimer is killed by bullet
		var game_manager = get_tree().current_scene
		if game_manager.has_method("increase_score"):
			game_manager.increase_score()
		
		$AnimatedSprite2D.play("death")
		
		await get_tree().create_timer(0.6).timeout
		queue_free()
