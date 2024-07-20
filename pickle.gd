extends CharacterBody2D

const speed = 10

var direction: Vector2

var is_chasing: bool

var player: CharacterBody2D

signal hit

func _ready():
	is_chasing = true
	
	
		
func _process(delta):
	move(delta)
	animation()
	
func animation():
	$AnimatedSprite2D.play()
	if velocity.x != 0:
		$AnimatedSprite2D.animation = "walk_side"
		$AnimatedSprite2D.flip_v = false
		$AnimatedSprite2D.flip_h = velocity.x < 0
	else:
		$AnimatedSprite2D.animation = "idle"
		
func move(delta):
	if is_chasing:
		var player = Global.playerBody
		velocity = position.direction_to(player.position) * speed
	elif !is_chasing:
		velocity += direction * speed * delta
	move_and_slide()
		
func choose(array):
	array.shuffle()
	return array.front()

#If Collides with player:
#	Fight animation and pause
