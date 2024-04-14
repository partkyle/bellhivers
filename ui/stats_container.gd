extends VBoxContainer

@onready var floors_cleared = $FloorsCleared/Value
@onready var bees_shot = $BeesShot/Value
@onready var bees_belled = $BeesBelled/Value
@onready var hives_destroyed = $HivesDestroyed/Value

func update_stats():
	floors_cleared.text = '%d' % Stats.floors_cleared
	bees_shot.text = '%d' % Stats.bees_shot
	bees_belled.text = '%d' % Stats.bees_belled
	hives_destroyed.text = '%d' % Stats.hives_destroyed
