extends Control

export var text_speed = 0.05
export var next_text = 0

func _ready():
	$Texts/End.text = " "

func _physics_process(delta):
	if $Texts/Text.visible_characters == len($Texts/Text.text):
		$Texts/End.text = "Next>"

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
		$Texts/End.text = " "
	match next_text:
		1:
			AnimationText()
			$Texts/Text.text = text1
		2:
			AnimationText()
			$Texts/Text.text = text2
		3:
			AnimationText()
			$Texts/Text.text = text3
		4:
			AnimationText()
			$Texts/Text.text = text4
		5:
			hide()
			next_text = 0
