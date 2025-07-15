extends Node2D

@export var slimer_scene : PackedScene

# Spawning variables
var current_spawn_interval: float = 3.0  # Starting spawn interval
var min_spawn_interval: float = 1.0      # Minimum spawn interval (frequency limit)
var spawn_acceleration: float = 0.2      # How much to decrease interval per second
var last_spawn_time: float = 0.0         # Track when last spawn occurred

# Score system
var score: int = 0
@export var score_label: Label

# Game Over UI
@export var game_over_label: Label

# Congratulations UI
@export var congratulations_label: Label

# Game state
var game_ended: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Initialize last spawn time
	last_spawn_time = Time.get_time_dict_from_system()["second"]

func increase_score() -> void:
	if game_ended:
		return
		
	score += 1
	score_label.text = "Score: " + str(score)
	
	# Check for win condition
	if score >= 15:
		show_congratulations()

func show_game_over() -> void:
	game_ended = true
	game_over_label.visible = true

func show_congratulations() -> void:
	game_ended = true
	congratulations_label.visible = true
	
	# Freeze all game entities
	freeze_all_entities()
	
	# Wait 3 seconds then restart the scene
	await get_tree().create_timer(3).timeout
	get_tree().reload_current_scene()

func freeze_all_entities() -> void:
	# Freeze the player
	var player = get_node("Player")
	if player and player.has_method("freeze_player"):
		player.freeze_player()
	
	# Freeze all enemies (slimers)
	var enemies = get_tree().get_nodes_in_group("enemy")
	for enemy in enemies:
		if enemy.has_method("freeze_enemy"):
			enemy.freeze_enemy()
	
	# Freeze all bullets
	var bullets = get_tree().get_nodes_in_group("bullet")
	for bullet in bullets:
		if bullet.has_method("freeze_bullet"):
			bullet.freeze_bullet()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if game_ended:
		return
		
	# Gradually decrease spawn interval (increase frequency)
	if current_spawn_interval > min_spawn_interval:
		current_spawn_interval -= spawn_acceleration * delta
		# Clamp to minimum interval
		current_spawn_interval = max(current_spawn_interval, min_spawn_interval)
	
	# Check for fire input
	if Input.is_action_just_pressed("fire"):
		attempt_spawn_slimer()

func attempt_spawn_slimer() -> void:
	if game_ended:
		return
		
	var current_time = Time.get_time_dict_from_system()["second"]
	var time_since_last_spawn = current_time - last_spawn_time
	
	# Handle time wrap-around (when seconds go from 59 to 0)
	if time_since_last_spawn < 0:
		time_since_last_spawn += 60
	
	# Check if enough time has passed since last spawn
	if time_since_last_spawn >= current_spawn_interval:
		_spawn_slimer()
		last_spawn_time = current_time

func _spawn_slimer() -> void:
	if game_ended:
		return
		
	var slimer_node = slimer_scene.instantiate()
	slimer_node.position = Vector2(230, randf_range(20, 120))
	get_tree().current_scene.add_child(slimer_node)
