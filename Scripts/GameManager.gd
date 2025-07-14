extends Node2D

@export var slimer_scene : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _spawn_slimer() -> void:
	var slimer_node = slimer_scene.instantiate()
	slimer_node.position = Vector2(230, randf_range(20, 120))
	get_tree().current_scene.add_child(slimer_node)
