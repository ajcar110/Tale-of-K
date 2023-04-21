extends HBoxContainer

var PlayerStats = ResourceLoader.PlayerStats

onready var icon = preload("res://UI/ActionMeterTexture.tres")

func _ready():
	PlayerStats.connect("player_missiles_changed", self, "_on_player_missiles_changed")
	PlayerStats.connect("player_missiles_unlocked", self, "_on_player_missiles_unlocked")
	
func _on_player_missiles_changed(amount):
	icon.region = Rect2(amount*32,0,32,32)

func _on_player_missiles_unlocked(value):
	visible = value
