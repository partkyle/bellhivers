extends Node

signal open_main_menu()
signal open_pause_menu()
signal game_resumed()
signal game_started()
signal game_over(cause : GameOver.Cause)


signal player_joined(player: Player)
signal level_complete()
