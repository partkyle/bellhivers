class_name GameOver
extends Object

enum Cause { BEE, BELL, FALL };

static var bee_phrases = [
	"buzz buzz",
	"that stings",
]

static var bell_phrases = [
	"you got rung",
	"ask not for who the bell tolls",
	"it tolls for thee",
	"ding dong. who's there? you. dead.",
]

static var fall_phrases = [
	"you fell into infinity",
	"you have a minor gravity allergy",
]

static func cause_to_name(cause: Cause) -> String:
	match cause:
		Cause.BEE:
			return 'a bee'
		Cause.BELL:
			return 'your own bell'
		Cause.FALL:
			return 'gravity'

	return 'your own ignorance'

static func cause_to_text(cause: Cause) -> String:
	return 'you were killed by a %s' % cause_to_name(cause)

static func cause_to_text_funny(cause: Cause) -> String:
	match cause:
		Cause.BEE:
			return bee_phrases.pick_random()
		Cause.BELL:
			return bell_phrases.pick_random()
		Cause.FALL:
			return fall_phrases.pick_random()

	return 'you lose'
