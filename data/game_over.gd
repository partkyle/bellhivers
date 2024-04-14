class_name GameOver
extends Object

enum Cause { BEE, BELL, FALL };

static var bee_phrases = [
	"buzz buzz",
]

static var bell_phrases = [
	"you got rung",
	"ask not for who the bell tolls",
	"it tolls for thee",
]

static var fall_phrases = [
	"you fell into infinity",
	"spring has sprung, but you have not"
]

static func cause_to_text(cause: Cause) -> String:
	match cause:
		Cause.BEE:
			return bee_phrases.pick_random()
		Cause.BELL:
			return bell_phrases.pick_random()
		Cause.FALL:
			return fall_phrases.pick_random()

	return "you lose"
