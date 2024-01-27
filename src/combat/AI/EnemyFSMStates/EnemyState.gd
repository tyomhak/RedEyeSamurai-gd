extends State
class_name EnemyState

var charBody: BasicEnemy = null
var anim: AnimatedSprite2D = null

func enter():
	super()
	charBody = get_parent().get_parent()
	assert(charBody != null)
	anim = charBody.anim
