extends Control

@onready var lEye: TextureRect = $RedLeft
@onready var rEye: TextureRect = $RedRight

func _ready():
	set_percent(1.0)

func set_percent(value: float):
	lEye.modulate.a = value
	rEye.modulate.a = value
	
