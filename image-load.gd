extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():	
	var texture = ImageTexture.new()
	var image = Image.new()
	image.load("res://assets/unpressed-tile.png")
	texture.create_from_image(image)
	self.texture = texture
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
