extends Node2D

@onready var cig: AnimatedSprite2D = $AnimatedSprite2D
@onready var smoke: AnimatedSprite2D = $AnimatedSprite2D2


func _ready():
	cig.play("burn")
	smoke.play("smoke")
