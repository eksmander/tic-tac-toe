extends Control

var board : Array
var player : String
var is_winner : bool = false
var is_gameover: bool = false
var is_draw: bool = false

var unpressed = preload("res://assets/unpressed-tile.png")
var player_x = preload("res://assets/player-x-tile.png")
var player_o = preload("res://assets/player-o-tile.png")

func initiate_board() -> void:
	board = [
		"0", "0", "0",
		"0", "0", "0",
		"0", "0", "0"
	]
	$Board/Row0/Button0.texture_normal = unpressed
	$Board/Row0/Button1.texture_normal = unpressed
	$Board/Row0/Button2.texture_normal = unpressed
	$Board/Row1/Button3.texture_normal = unpressed
	$Board/Row1/Button4.texture_normal = unpressed
	$Board/Row1/Button5.texture_normal = unpressed
	$Board/Row2/Button6.texture_normal = unpressed
	$Board/Row2/Button7.texture_normal = unpressed
	$Board/Row2/Button8.texture_normal = unpressed
	is_gameover = false
	is_winner = false
	is_draw = false
	
func initiate_player() -> void:
	player = "x"

func _ready() -> void:
	initiate_board()
		
	
