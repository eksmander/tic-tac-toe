extends Control

var board : Array
var player : String
var is_winner : bool = false
var is_gameover: bool = false
var is_draw: bool = false

var unpressed = preload("res://assets/unpressed-tile.png")
var player_x = preload("res://assets/player-x-tile.png")
var player_o = preload("res://assets/player-o-tile.png")

func get_cell(row:int, col:int) -> Node:
	var path = "Board/Row" + str(row) + "/Button" + str(col)
	return get_node(path)

func initiate_board() -> void:
	board = [
		["0", "0", "0"],
		["0", "0", "0"],
		["0", "0", "0"]
	]
	for row in range(0,3):
		for col in range(0,3):
			get_cell(row, col).texture_normal = unpressed

	is_gameover = false
	is_winner = false
	is_draw = false
	
func initiate_player() -> void:
	player = "x"

func _ready() -> void:
	$GameOverMessage.hide()
	initiate_board()
	initiate_player()
		
func update_player() -> void:
	if player == "x":
		player = "o"
	else: 
		player = "x"
		
func is_row_matched() -> bool:
	for row in range(0,3):
		if board[row][0] == player and board[row][0] == board[row][1] and board[row][1] == board[row][2]:
			return true
	return false
	
func is_col_matched() -> bool:
	for col in range(0,3):
		if board[0][col] == player and board[0][col] == board[1][col] and board[1][col] == board[2][col]:
			return true
	return false
	
func is_diag_matched() -> bool:
	if board[0][0] == player and board[0][0] == board[1][1] and board[1][1] == board[2][2]:
		return true
	if board[2][0] == player and board[2][0] == board[1][1] and board[1][1] == board[0][2]:
		return true
	return false
	
func is_board_full() -> bool:
	for row in board:
		if row.has("0"):
			return false
	return true
	
func check_gameover() -> void:
	if is_row_matched() || is_col_matched() || is_diag_matched():
		is_gameover = true
		add_gameover_message()
	elif is_board_full():
		is_gameover = true
		is_draw = true
		add_gameover_message()
		
func add_gameover_message() -> void:
	if is_draw:
		$GameOverMessage/Container/Label.text = "Game is draw!"
	else:
		$GameOverMessage/Container/Label.text = "player " + player + " wins!"
	$GameOverMessage.show()
	
func make_move(row: int, col:int) -> void:
	if board[row][col] == "0" and !is_gameover:
		board[row][col] = player
		check_gameover()
		var node = get_cell(row, col) 
		if player == "x":
			node.texture_normal = player_x
		else:
			node.texture_normal = player_o
		update_player()
	
func _on_button_0_button_up() -> void:
	make_move(0, 0)

func _on_button_1_button_up() -> void:
	make_move(0, 1)

func _on_button_2_button_up() -> void:
	make_move(0, 2)

func _on_button_3_button_up() -> void:
	make_move(1, 0)

func _on_button_4_button_up() -> void:
	make_move(1, 1)

func _on_button_5_button_up() -> void:
	make_move(1, 2)

func _on_button_6_button_up() -> void:
	make_move(2, 0)

func _on_button_7_button_up() -> void:
	make_move(2, 1)

func _on_button_8_button_up() -> void:
	make_move(2, 2)

func _on_button_button_up() -> void:
	$GameOverMessage.hide()
	initiate_board()
	initiate_player()
