extends Control

var next_text = 0
var finished = false

func _ready():
	$Texts/End.text = ""

func _physics_process(delta):
	SetName("Actor")
	WriteLine("Hsfgsdjfjhiosdhflasjdhflaidhfasdhflaisdjhf;kasjdhf;ksfhi", "igdfigodfigjaoijgajgojidfogijapgjapifjgpoaijdfgpofgpojdfogjdoifjgpsofgopsijdfgposjdfgjspgjspdospogosdifjg[oidgsiogjpsogjsgjposifgspogjsoigm spdjfsiodjfposidhfoasdhfiajshdflkjadhfGood", "Bysodfijposifjpaoidjfpoaisdjfoajdfpaijdfeeeeee", "hEllsdifjpoidhfpaiuhsdfiuahsdfiauhsdfiuhadfOlo")

func SetName(Name):
	$Texts/Name.text = Name

func AnimationText():
	while $Texts/Text.visible_characters < len($Texts/Text.text):
		$Texts/Text.visible_characters += 1
		
		yield(get_tree().create_timer(1),"timeout")

func WriteLine(text1, text2, text3, text4):
	if $Texts/Text.visible_characters == len($Texts/Text.text):
		$Texts/End.text = "Next>"
	if Input.is_action_just_pressed("ui_accept"):
		next_text += 1
		$Texts/Text.visible_characters = 0
		$Texts/End.text = ""
	match next_text:
		0:
			AnimationText()
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
