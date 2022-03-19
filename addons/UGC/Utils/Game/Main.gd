tool
extends Node

func start_game(game_id):
	yield(download_game(game_id), "completed")
	clear_all()
	var main_script = load("res://UGCGame/main.gd").new()
	if main_script.has_method("init_autoload"):
		main_script.init_autoload()
	UGC.inputmap.load_input()

	if main_script.has_method("init_custom"):
		main_script.init_custom()

	if main_script.has_method("start_game"):
		main_script.start_game()
	else:
		get_tree().change_scene("res://UGCGame/main.tscn")
	

func clear_all():
	UGC.autoload.clear_autoload()
	InputMap.load_from_globals()


func download_game(game_id):
	var game_info = UGC.platform_protocol.get_game_info_by_id(game_id)
	for content_cid in game_info.use:
		var content_pck_path = UGC.data_manger.data_constant.ugc_content_pck_path+"/%s.pck"%content_cid
		var file = File.new()
		if not file.file_exists(content_pck_path):
			var pck_cid = UGC.platform_protocol.get_content_info(content_cid).pck
			UGC.data_manger.content_pck_download.ugc_download(pck_cid,content_cid)
			yield(UGC.data_protocol,"cid-%s"%pck_cid)
		ProjectSettings.set_load_pack_enabled(true)
		ProjectSettings.load_resource_pack(content_pck_path)
		
	var game_pck_path = UGC.data_manger.data_constant.ugc_content_pck_path+"/%s/UGCGame.pck"%game_info.cid
	var file = File.new()
	if not file.file_exists(game_pck_path):
		UGC.data_manger.game_pck_download.ugc_download(game_info.cid)
		yield(UGC.data_protocol,"cid-%s"%game_info.cid)
	ProjectSettings.set_load_pack_enabled(true)
	ProjectSettings.load_resource_pack(game_pck_path)


func end_game(game_id):
	clear_all()
	var main_script = load("res://UGCGame/main.gd").new()
	if main_script.has_method("end_game"):
		main_script.end_game()
