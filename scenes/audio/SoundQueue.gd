extends Node

var _next = 0;
var _audio_stream_players: Array[AudioStreamPlayer]

@export var Count = 5

func _ready():
	if get_child_count() == 0:
		print("No AudioStreamPlayer found")
		return
	var child = get_child(0)
	var audioStreamPlayer = $AudioStreamPlayer
	if child is AudioStreamPlayer:
		print("something")
		
		_audio_stream_players.push_back(audioStreamPlayer)
		for i in range(Count):
			var duplicate = audioStreamPlayer.duplicate()
			add_child(duplicate)
			_audio_stream_players.push_back(duplicate)
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func play_sound():
	if(not (_audio_stream_players[_next].playing)):
		_audio_stream_players[_next].play()
		_next += 1
		_next %= _audio_stream_players.size()
