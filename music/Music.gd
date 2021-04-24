extends Node2D

func _start():
	$Music1.play()

func update_music():
	if Global.num_spirits == 2:
		var start_time = $Music1.get_playback_position()
		$Music1.stop()
		$Music2.play(start_time)
	elif Global.num_spirits == 3:
		var start_time = $Music2.get_playback_position()
		$Music2.stop()
		$Music3.play(start_time)
	elif Global.num_spirits == 4:
		var start_time = $Music3.get_playback_position()
		$Music3.stop()
		$Music4.play(start_time)
	elif Global.num_spirits == 5:
		var start_time = $Music4.get_playback_position()
		$Music4.stop()
		$Music5.play(start_time)
	elif Global.num_spirits == 6:
		var start_time = $Music5.get_playback_position()
		$Music5.stop()
		$Music6.play(start_time)
	elif Global.num_spirits == 7:
		var start_time = $Music6.get_playback_position()
		$Music6.stop()
		$Music7.play(start_time)
	elif Global.num_spirits == 8:
		var start_time = $Music7.get_playback_position()
		$Music7.stop()
		$Music8.play(start_time)
	elif Global.num_spirits == 9:
		var start_time = $Music8.get_playback_position()
		$Music8.stop()
		$Music9.play(start_time)
		
func end_music():
	$Music1.stop()
	$Music2.stop()
	$Music3.stop()
	$Music4.stop()
	$Music5.stop()
	$Music6.stop()
	$Music7.stop()
	$Music8.stop()
	$Music9.stop()
