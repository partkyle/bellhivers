extends Node

var bees_shot := 0
var bees_belled := 0

var hives_destroyed := 0


func _ready():
	EventBus.game_started.connect(reset_stats)

func reset_stats():
	bees_shot = 0
	bees_belled = 0
	hives_destroyed = 0
