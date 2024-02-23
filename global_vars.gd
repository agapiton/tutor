extends Node
var score:int=0
var hscore:int=0

var config 
var path_to_save_file := "user://game.ctg"
var section_name :="game"
var starts_n :=0
var die_n:=0
var saves_n:=0
var player_name: String
var last_level: String=""
func _ready():
	load_game()
	starts_n+=1
func save_game():
	saves_n+=1
	config.set_value(section_name,"player_name",player_name)
	config.set_value(section_name,"starts_n",starts_n)
	config.set_value(section_name,"die_n",die_n)
	config.set_value(section_name,"saves_n",saves_n)
	config.set_value(section_name,"last_level",last_level)
	config.set_value(section_name,"hscore",hscore)
	config.set_value(section_name,"score",score)
	config.save(path_to_save_file)
	
func load_game():
	config=ConfigFile.new()
	config.load(path_to_save_file)
	player_name=config.get_value(section_name,"player_name","player1")
	starts_n=config.get_value(section_name,"starts_n",0)
	die_n=config.get_value(section_name,"die_n",0)
	saves_n=config.get_value(section_name,"saves_n",0)
	last_level=config.get_value(section_name,"last_level","")
	hscore=config.get_value(section_name,"hscore",0)
	score=config.get_value(section_name,"score",0)
