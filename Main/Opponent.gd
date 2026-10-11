extends CharacterBody2D

var speed = 400
var ball

func _ready():
	ball = get_parent().get_node("Ball")

func _physics_process(_delta):
	velocity.y = speed * get_opponent_direction()
	move_and_slide()
	position.x = 1130

func get_opponent_direction():
	if abs(ball.position.y - position.y) > 25:
		if ball.position.y > position.y: return 1
		else: return -1
	else: return 0

func reset():
	position.x = 1130
	position.y = 360
