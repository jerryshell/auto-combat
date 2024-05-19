extends Node2D
class_name Player

@onready var character_stats: CharacterStats = $CharacterStats
@onready var hp_progress_bar: ProgressBar = $HpProgressBar
@onready var attack_progress_bar: ProgressBar = $AttackProgressBar

func _ready() -> void:
	character_stats.attack_triggered.connect(_on_attack_triggered)
	character_stats.deceased.connect(_on_deceased)

func _process(delta: float) -> void:
	hp_progress_bar.max_value = character_stats.hp_max
	hp_progress_bar.value = character_stats.hp
	attack_progress_bar.max_value = 1.0
	attack_progress_bar.value = character_stats.attack_progress

func _physics_process(delta: float) -> void:
	character_stats.physics_process(delta)

func _on_attack_triggered() -> void:
	if GameStats.enemy_stats_array.is_empty():
		return
	var enemy_index = randi_range(0, GameStats.enemy_stats_array.size() - 1)
	var enemy_stats = GameStats.enemy_stats_array[enemy_index]
	enemy_stats.take_damage(character_stats.damage)

func _on_deceased() -> void:
	queue_free()
