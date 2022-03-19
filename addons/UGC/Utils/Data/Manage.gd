tool
extends Node
var data_constant = preload("res://addons/UGC/Utils/Data/Constant.gd").new()

var token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkaWQ6ZXRocjoweDNlN2I5MmEzNWNiNkQ4OTg1QmJGQ2E3OGZiQkRDM0QyRTY1NzIzY2QiLCJpc3MiOiJ3ZWIzLXN0b3JhZ2UiLCJpYXQiOjE2NDY5MzI0OTk3MDQsIm5hbWUiOiJ0ZXN0MyJ9.fQ1967dI5-m9kAR9wh8QjCgXdAMwqgtSnc_BDGKpA3c" setget set_token,get_token
func set_token(val):
	token = val

func get_token():
	return token

var crypto = Crypto.new()
var crypto_key = load(data_constant.ugc_crypto_pub)


var ipfs_map={

}

func add_ipfs(ipfs,folder,type):
	ipfs_map[ipfs] = {"folder":folder,"type":type}

func get_ipfs(ipfs):
	return ipfs_map.get(ipfs,null)

var game_use=[
	
]

var content_upload = preload("res://addons/UGC/Utils/Data/Content/ContentUpload.gd").new()
var content_download = preload("res://addons/UGC/Utils/Data/Content/ContentDownload.gd").new()
var content_pck_upload = preload("res://addons/UGC/Utils/Data/Content/ContentPCKUpload.gd").new()
var content_pck_download = preload("res://addons/UGC/Utils/Data/Content/ContentPCKDownload.gd").new()

var game_pck_upload = preload("res://addons/UGC/Utils/Data/Game/GamePCKUpload.gd").new()
var game_pck_download = preload("res://addons/UGC/Utils/Data/Game/GamePCKDownload.gd").new()
