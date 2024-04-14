extends Node

var floors_cleared := 0
var bees_shot := 0
var bees_belled := 0
var hives_destroyed := 0


func _ready():
	EventBus.game_started.connect(reset_stats)
	EventBus.level_complete.connect(icnr_floors_cleared)

func icnr_floors_cleared():
	floors_cleared += 1

func reset_stats():
	floors_cleared = 0
	bees_shot = 0
	bees_belled = 0
	hives_destroyed = 0
