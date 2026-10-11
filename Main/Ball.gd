extends CharacterBody2D

var speed = 500
var lastXPos = 0
var lastYPos = 0
var stasis = false
var impact = false

func _ready():
	randomize()
	velocity.x = [-1,1][randi() % 2] * speed
	velocity.y = [-0.75,0.75][randi() % 2] * speed

func _physics_process(delta):
	var collision = move_and_collide(delta * velocity)
	if collision:
		impact = true
		velocity = velocity.bounce(collision.get_normal()) * 1.02
	else: impact = false
	if abs(lastYPos - position.y) < 0.1 or abs(lastXPos - position.x) < 0.3: stasis = true
	else: stasis = false
	lastXPos = position.x
	lastYPos = position.y

func stop_ball():
	velocity = Vector2.ZERO

func restart_ball():
	speed = 400
	velocity.x = [-1,1][randi() % 2] * speed
	velocity.y = [-0.75,0.75][randi() % 2] * speed

