extends Control

export var text_speed = 5
export var next_text = 0

func _ready():
	$Texts/End.text = "Next>"

func _physics_process(delta):
	SetName("Actor")
	WriteLine("Hi Hello","This is good dialog box", "easy to write", "not hard at all")

func SetName(Name):
	$Texts/Name.text = Name

func AnimationText():
	while $Texts/Text.visible_characters < len($Texts/Text.text):
		$Texts/Text.visible_characters += 1
		
		yield(get_tree().create_timer(text_speed),"timeout")

func WriteLine(text1, text2, text3, text4):
	if Input.is_action_just_pressed("ui_accept"):
		next_text += 1
		$Texts/Text.visible_characters = 0
	match next_text:
		0:
			$Texts/Text.text = text1
		1:
			AnimationText()
			$Texts/Text.text = text2
		2:
			AnimationText()
			$Texts/Text.text = text3
		3:
			AnimationText()
			$Texts/Text.text = text4
		4:
			hide()
			next_text = 0
