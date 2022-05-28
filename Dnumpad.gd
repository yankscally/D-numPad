extends Control


onready var test = load("font.tres")
var rAllow = false

#var lastSound = Node

var pitcher = AudioServer.get_bus_effect(0, 0)
var delay = AudioServer.get_bus_effect(0, 1)
var	wholeNote = 1
var ms = 6



var sounds = []
var soundsCount = sounds.size()

func _ready() -> void:
	AudioServer.set_bus_bypass_effects(10, true)


	var path = "res://bin/sounds"
	var dir = Directory.new()
	dir.open(path)
	dir.list_dir_begin()
	while true:
		var file_name = dir.get_next()
		if file_name == "":
			#break the while loop when get_next() returns ""
			break
		elif !file_name.begins_with(".") and !file_name.ends_with(".import"):
			#if !file_name.ends_with(".import"):
			sounds.append(load(path + "/" + file_name))
	dir.list_dir_end()
	soundsCount = sounds.size()
	
	
	
	
	
	
	
	
	
	

func _process(delta: float) -> void:#	pass
	var pitch = pitcher.get("pitch_scale")
	var time = OS.get_time()
	var rng = RandomNumberGenerator.new()
	
	var num = rng.randi_range(0, 8)
	$KeypadControl/Row3/Info/V/Label.set("text", str(pitcher.get("pitch_scale")))
	$KeypadControl/Row3/Info/V/PitchGFX.set("value", pitch)
	
	if Input.is_action_pressed("del"):
			delay.set("feedback/delay_ms", rand_range(1.0, 1000))

	if Input.is_action_pressed("numadd"):
		
		wholeNote += 0.083333
		pitcher.set("pitch_scale", wholeNote)
		
		ms += 6
		delay.set("feedback/delay_ms",ms)
	if Input.is_action_pressed("numsub"):
		wholeNote -= 0.083333
		pitcher.set("pitch_scale", wholeNote)
		
		ms -= 6
		delay.set("feedback/delay_ms",ms)
	if wholeNote < 0.5:
		wholeNote += 1
	var LdB = AudioServer.get_bus_peak_volume_right_db(0, 0)
	var RdB = AudioServer.get_bus_peak_volume_left_db(0, 0)
	
	var kp1RdB = AudioServer.get_bus_peak_volume_right_db(1, 0)
	var kp1LdB = AudioServer.get_bus_peak_volume_left_db(1, 0)
	var kp2RdB = AudioServer.get_bus_peak_volume_right_db(2, 0)
	var kp2LdB = AudioServer.get_bus_peak_volume_left_db(2, 0)
	var kp3RdB = AudioServer.get_bus_peak_volume_right_db(3, 0)
	var kp3LdB = AudioServer.get_bus_peak_volume_left_db(3, 0)
	
	var kp4RdB = AudioServer.get_bus_peak_volume_right_db(4, 0)
	var kp4LdB = AudioServer.get_bus_peak_volume_left_db(4, 0)
	var kp5RdB = AudioServer.get_bus_peak_volume_right_db(5, 0)
	var kp5LdB = AudioServer.get_bus_peak_volume_left_db(5, 0)
	var kp6RdB = AudioServer.get_bus_peak_volume_right_db(6, 0)
	var kp6LdB = AudioServer.get_bus_peak_volume_left_db(6, 0)
	
	var kp7LdB = AudioServer.get_bus_peak_volume_right_db(7, 0)
	var kp7RdB = AudioServer.get_bus_peak_volume_left_db(7, 0)
	var kp8LdB = AudioServer.get_bus_peak_volume_right_db(8, 0)
	var kp8RdB = AudioServer.get_bus_peak_volume_left_db(8, 0)
	var kp9LdB = AudioServer.get_bus_peak_volume_right_db(9, 0)
	var kp9RdB = AudioServer.get_bus_peak_volume_left_db(9, 0)
	
	
	$KeypadControl/Row4/kp1/RdB.set("value", kp1RdB)
	$KeypadControl/Row4/kp1/LdB.set("value", kp1LdB)
	$KeypadControl/Row4/kp2/RdB.set("value", kp2RdB)
	$KeypadControl/Row4/kp2/LdB.set("value", kp2LdB)
	$KeypadControl/Row4/kp3/RdB.set("value", kp3RdB)
	$KeypadControl/Row4/kp3/LdB.set("value", kp3LdB)
	
#	$KeypadControl/Row4/kpEnter/RdB/.set("value", kp4RdB)
#	$KeypadControl/Row4/kpEnter/LdB.set("value", kp4LdB)
	
	$KeypadControl/Row3/kp4/RdB.set("value", kp4RdB)
	$KeypadControl/Row3/kp4/LdB.set("value", kp4LdB)
	$KeypadControl/Row3/kp5/RdB.set("value", kp5RdB)
	$KeypadControl/Row3/kp5/LdB.set("value", kp5LdB)
	$KeypadControl/Row3/kp6/RdB.set("value", kp6RdB)
	$KeypadControl/Row3/kp6/LdB.set("value", kp6LdB)
		
	$KeypadControl/Row2/kp7/RdB.set("value", kp7RdB)
	$KeypadControl/Row2/kp7/LdB.set("value", kp7LdB)
	$KeypadControl/Row2/kp8/RdB.set("value", kp8RdB)
	$KeypadControl/Row2/kp8/LdB.set("value", kp8LdB)
	$KeypadControl/Row2/kp9/RdB.set("value", kp9RdB)
	$KeypadControl/Row2/kp9/LdB.set("value", kp9LdB)

	
	
	
	
	
	
	
	
	
	$KeypadControl/GainVisualiser/RdB.set("value", RdB)
	$KeypadControl/GainVisualiser/LdB.set("value", LdB)

#		AudioServer.get_bus_effect_instance(0, 1, 1)
#	if Input.is_action_pressed("numsub"):
#		pitch -= 0.1
	




func _on_1_button_down() -> void:
	$s1.play()
	pass # Replace with function body.

func _on_2_button_down() -> void:
	$s2.play()
	pass # Replace with function body.

func _on_3_button_down() -> void:
	$s3.play()
	pass # Replace with function body.

func _on_4_button_down() -> void:
	$s4.play()
	pass # Replace with function body.

func _on_5_button_down() -> void:
	$s5.play()
	pass # Replace with function body.

func _on_6_button_down() -> void:
	$s6.play()
	pass # Replace with function body.
func _on_7_button_down() -> void:
	$s7.play()
	pass # Replace with function body.
func _on_8_button_down() -> void:
	$s8.play()
	pass # Replace with function body.
func _on_9_button_down() -> void:
	$s9.play()
	pass # Replace with function body.






func _on_MasterVolume_value_changed(value: float) -> void:
	var masterVol = value
	print(masterVol)
	AudioServer.set_bus_volume_db(0, masterVol)
	pass # Replace with function body.



#############pitch up
#func _on_Plus_button_down() -> void:
#
#	var pitcher = AudioServer.get_bus_effect(0, 0)
#	var test = pitcher.get("pitch_scale")
#	wholeNote += 0.083333
#	print(pitcher, ": ", wholeNote)
#	pitcher.set("pitch_scale", wholeNote)
#
#	pass # Replace with function body.
#
######## pitch down
#func _on_Minus_button_down() -> void:
#	var pitcher = AudioServer.get_bus_effect(0, 0)
#	var test = pitcher.get("pitch_scale")
#	wholeNote -= 0.083333
#	print(pitcher, ": ", wholeNote)
#	pitcher.set("pitch_scale", wholeNote)
#
#	pass # Replace with function body.

######### delay
func _on_0_toggled(button_pressed: bool) -> void:
	if button_pressed == true:
		AudioServer.set_bus_effect_enabled(0, 1, true)
	if button_pressed == false:
		AudioServer.set_bus_effect_enabled(0, 1, false)
	pass # Replace with function body.


func _on_Slash_button_down() -> void:
	var r = randi()%soundsCount
	randomize()
	$s1.stream = sounds[r]
	r = randi()%soundsCount
	
	randomize()
	$s2.stream = sounds[r]
	r = randi()%soundsCount
	
	randomize()
	$s3.stream = sounds[r]
	r = randi()%soundsCount
	randomize()
	$s4.stream = sounds[r]
	r = randi()%soundsCount
	
	randomize()
	$s5.stream = sounds[r]
	r = randi()%soundsCount
	
	randomize()
	$s6.stream = sounds[r]
	r = randi()%soundsCount
	
	randomize()
	$s7.stream = sounds[r]
	r = randi()%soundsCount
	
	randomize()
	$s8.stream = sounds[r]
	r = randi()%soundsCount
	
	randomize()
	$s9.stream = sounds[r]
	r = randi()%soundsCount

	pass # Replace with function body.


func _on_Star_button_down() -> void:
	AudioServer.set_bus_mute(10, false)
	pass # Replace with function body.
