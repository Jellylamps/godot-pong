extends Node

var PlayerScore = 0
var OpponentScore = 0

func _ready():
	score_process()

func _on_left_goal_body_entered(_body):
	OpponentScore += 1
	score_process()

func _on_right_goal_body_entered(_body):
	PlayerScore += 1
	score_process()

func _process(_delta):
	$PlayerScore.text = str(PlayerScore)
	$OpponentScore.text = str(OpponentScore)
	reset_management()
	hard_reset()

func _on_timer_timeout():
	get_tree().call_group("BallGroup", "restart_ball")
	$Ready.visible = false

func score_process():
	get_tree().call_group("BallGroup", "stop_ball")
	$Ball.position = Vector2(640,360)
	$Timer.start()
	$Ready.visible = true
	$ResetTimer.start()
	$Player.reset()
	$Opponent.reset()

func reset_management():
	if !$Ball.stasis and $Ball.impact:
		$ResetTimer.start(8)

func _on_reset_timer_timeout():
	$Player.reset()
	$Opponent.reset()
	score_process()

func hard_reset():
	if Input.is_action_pressed("r"):
		PlayerScore = 0
		OpponentScore = 0
		$Player.reset()
		$Opponent.reset()
		score_process()
