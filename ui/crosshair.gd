extends TextureRect


# Called when the node enters the scene tree for the first time.
func _ready():
	EventBus.game_started.connect(game_started)
	EventBus.game_over.connect(game_)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
