extends Node
class_name CharacterStats

signal attack_triggered
signal harmed
signal deceased

@export var hp: int = 10
@export var hp_max: int = 10
@export var damage: int = 5
@export var defense: int = 0
@export var attack_speed: float = 0.5
@export var attack_progress: float = 0.0

func physics_process(delta: float) -> void:
	if hp <= 0:
		return
	attack_progress += delta * attack_speed
	if attack_progress >= 1.0:
		attack_progress -= 1.0
		attack_triggered.emit()

func take_damage(source_damage: int) -> void:
	var real_damage = source_damage - defense
	if real_damage <= 0:
		real_damage = 1
	hp -= real_damage
	harmed.emit()
	if hp <= 0:
		deceased.emit()
