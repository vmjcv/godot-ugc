tool
extends Reference

func ugc_download(res_cid):
	var path = ProjectSettings.globalize_path(UGC.data_manger.data_constant.ugc_content_path+"/"+res_cid)
	UGC.data_manger.add_ipfs(res_cid,path,UGC.data_manger.data_constant.DATATYPE.CONTENT)
	UGC.data_protocol.download(res_cid,path)


func download(res_cid,path):
	var data = []
	data.append(UGC.data_manger.token)
	data.append(res_cid)
	data.append(path)
	UGC.nodejs_client.call_server(UGC.nodejs_client.nodejs_constant.PROTOCOL.C_S_DOWNLOAD_FILE,data)
	UGC.data_protocol.add_user_signal("cid-%s"%res_cid)
