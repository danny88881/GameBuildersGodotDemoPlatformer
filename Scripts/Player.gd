extends KinematicBody2D


# Declare member variables here. Examples:
var speed = 500
var jump_height = 600
var gravity = 28
var terminal_velocity = 1000
var velocity = Vector2()

var score = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(true)
	set_process(true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	$CanvasLayer/Label.text = "SCORE: " + str(score)
	
	move_and_slide(velocity, Vector2.UP)
	
	var up = Input.is_action_pressed("up")
	var down = Input.is_action_pressed("down")
	var left = Input.is_action_pressed("left")
	var right = Input.is_action_pressed("right")
	
	var hdir = int(right) - int(left)
	if (hdir != 0):
		$Sprite.scale.x = hdir * abs($Sprite.scale.x)
	velocity.x = hdir * speed
	
	velocity.y += gravity
	velocity.y = min(velocity.y, terminal_velocity)
	
	if (is_on_floor()):
		velocity.y = 10
		if (up):
			velocity.y = -1.0 * jump_height

func add_score(num):
	score += num
