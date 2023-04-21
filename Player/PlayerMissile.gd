extends "res://Player/Projectile.gd"

const EnemyDeathEffect = preload("res://Effects/EnemyDeathEffect.tscn")

const BRICK_LAYER_BIT = 4

export (float) var Projectile_height
export (float) var Projectile_time_to_peak
export (float) var Projectile_time_to_descent

onready var Projectile_velocity : float = ((2.0 * Projectile_height) / Projectile_time_to_peak) * -1.0
onready var Projectile_gravity : float = ((-2.0 * Projectile_height) / (Projectile_time_to_peak * Projectile_time_to_peak)) * -1.0
onready var fall_gravity : float = ((-2.0 * Projectile_height) / (Projectile_time_to_descent * Projectile_time_to_descent)) * -1.0

func _ready():
	SoundFX.play("Explosion")



func _physics_process(delta):
	velocity.y += get_gravity() * delta


func get_gravity() -> float:
	return Projectile_gravity if velocity.y < 0.0 else fall_gravity



func _on_Hitbox_body_entered(body):
	if body.get_collision_layer_bit(BRICK_LAYER_BIT):
		body.queue_free()
		Utils.instance_scene_on_main(EnemyDeathEffect, body.global_position + Vector2(8, 8))
	._on_Hitbox_body_entered(body)
	
