extends Node2D

@onready var player: Player = $Player

func _ready() -> void:
	GameStats.player_stats = player.character_stats
	var enemy_node_array := get_tree().get_nodes_in_group("enemy")
	GameStats.enemy_stats_array = []
	for enemy_node in enemy_node_array:
		GameStats.enemy_stats_array.append(enemy_node.character_stats)
