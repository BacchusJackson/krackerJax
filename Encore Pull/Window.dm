var/Window/window_manager = new
Window
	proc
		onfocus(window_id)
		onfocus_lost(window_id)
		onclose(window_id)
		onload(window_id)
		onresize(window_id)
		show(mob/owner,window_id)
			var/list/window_params = new
			window_params["parent"] = "[window_id]"
			window_params["type"] = "browser"
			window_params["pos"] = "1,1"
			window_params["size"] = "0x0"
			window_params["anchor1"] = "0,0"
			window_params["anchor2"] = "100,100"
			window_params["is-visible"] = "false"
			winset(owner, "[window_id].winmanager_browser", list2params(window_params))
			owner << output({"
			<HTML>
			<BODY onload="location.replace('byond://?src=\ref[src]&action=load&window=[window_id]');" onunload="location.replace('byond://?src=\ref[src]&action=unload&window=[window_id]');" onBlur="location.replace('byond://?src=\ref[src]&action=blur&window=[window_id]');" onFocus="location.replace('byond://?src=\ref[src]&action=focus&window=[window_id]');" onresize="location.replace('byond://?src=\ref[src]&action=resize&window=[window_id]');">
			Some stuff.
			</BODY>
			</HTML>
			"},"[window_id].winmanager_browser")
			winshow(owner,window_id,1)

	Topic(href,href_list[])
		if(href_list["action"])
			if(href_list["window"])
				var/window = href_list["window"]
				switch(href_list["action"])
					if("focus") src.onfocus(window)
					if("blur") src.onfocus_lost(window)
					if("resize") src.onresize(window)
					if("load") src.onload(window)
					if("unload") src.onclose(window)