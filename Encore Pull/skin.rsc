�=   ǿ��'�M�Q6L�=  Skin.dmf macro "macro"
	elem 
		name = "CENTER+REP"
		command = ".center"
		is-disabled = false
	elem 
		name = "NORTHEAST+REP"
		command = ".northeast"
		is-disabled = false
	elem 
		name = "SOUTHEAST+REP"
		command = ".southeast"
		is-disabled = false
	elem 
		name = "SOUTHWEST+REP"
		command = ".southwest"
		is-disabled = false
	elem 
		name = "NORTHWEST+REP"
		command = ".northwest"
		is-disabled = false
	elem 
		name = "WEST+REP"
		command = ".west"
		is-disabled = false
	elem 
		name = "NORTH+REP"
		command = ".north"
		is-disabled = false
	elem 
		name = "EAST+REP"
		command = ".east"
		is-disabled = false
	elem 
		name = "SOUTH+REP"
		command = ".south"
		is-disabled = false
	elem 
		name = "F1+REP"
		command = ".options"
		is-disabled = false
	elem 
		name = "F2+REP"
		command = ".screenshot"
		is-disabled = false


menu "menu"
	elem 
		name = "&File"
		command = ""
		category = ""
		is-checked = false
		can-check = false
		group = ""
		is-disabled = false
		saved-params = "is-checked"
	elem 
		name = "&Options and Messages...\tF1"
		command = ".options"
		category = "&File"
		is-checked = false
		can-check = false
		group = ""
		is-disabled = false
		saved-params = "is-checked"
	elem 
		name = "&Save screenshot...\tF2"
		command = ".screenshot"
		category = "&File"
		is-checked = false
		can-check = false
		group = ""
		is-disabled = false
		saved-params = "is-checked"
	elem 
		name = "&Quit"
		command = ".quit"
		category = "&File"
		is-checked = false
		can-check = false
		group = ""
		is-disabled = false
		saved-params = "is-checked"
	elem 
		name = "&Icons"
		command = ""
		category = ""
		is-checked = false
		can-check = false
		group = ""
		is-disabled = false
		saved-params = "is-checked"
	elem "stretch"
		name = "&Stretch to fit"
		command = ".winset \"mapwindow.map.icon-size=0\""
		category = "&Icons"
		is-checked = true
		can-check = true
		group = "size"
		is-disabled = false
		saved-params = "is-checked"
	elem 
		name = ""
		command = ""
		category = "&Icons"
		is-checked = false
		can-check = false
		group = ""
		is-disabled = false
		saved-params = "is-checked"
	elem "icon32"
		name = "&32x32"
		command = ".winset \"mapwindow.map.icon-size=32\""
		category = "&Icons"
		is-checked = false
		can-check = true
		group = "size"
		is-disabled = false
		saved-params = "is-checked"
	elem "size16"
		name = "&16x16"
		command = ".winset \"mapwindow.map.icon-size=16\""
		category = "&Icons"
		is-checked = false
		can-check = true
		group = "size"
		is-disabled = false
		saved-params = "is-checked"
	elem 
		name = ""
		command = ""
		category = "&Icons"
		is-checked = false
		can-check = false
		group = ""
		is-disabled = false
		saved-params = "is-checked"
	elem "textmode"
		name = "&Text"
		command = "\"menu.textmode.is-checked=true?mapwindow.map.text-mode=true:mapwindow.map.text-mode=false\""
		category = "&Icons"
		is-checked = false
		can-check = true
		group = ""
		is-disabled = false
		saved-params = "is-checked"


window "Rpspy"
	elem "Rpspy"
		type = MAIN
		pos = 281,0
		size = 500x500
		anchor1 = none
		anchor2 = none
		font-family = ""
		font-size = 0
		font-style = ""
		text-color = #000000
		background-color = none
		is-visible = false
		is-disabled = false
		is-transparent = false
		is-default = false
		border = none
		drop-zone = false
		right-click = false
		saved-params = "pos;size;is-minimized;is-maximized"
		title = ""
		titlebar = true
		statusbar = true
		can-close = true
		can-minimize = true
		can-resize = true
		is-pane = false
		is-minimized = false
		is-maximized = false
		can-scroll = none
		icon = ""
		image = ""
		image-mode = stretch
		keep-aspect = false
		transparent-color = none
		alpha = 255
		macro = ""
		menu = ""
		on-close = ""
	elem "output1"
		type = OUTPUT
		pos = 0,0
		size = 500x500
		anchor1 = 0,0
		anchor2 = 100,100
		font-family = ""
		font-size = 0
		font-style = ""
		text-color = #000000
		background-color = #000000
		is-visible = true
		is-disabled = false
		is-transparent = false
		is-default = false
		border = none
		drop-zone = false
		right-click = false
		saved-params = "max-lines"
		link-color = #0000ff
		visited-color = #ff00ff
		style = ""
		enable-http-images = false
		max-lines = 1000
		image = ""

window "mainwindow"
	elem "mainwindow"
		type = MAIN
		pos = 281,0
		size = 640x393
		anchor1 = none
		anchor2 = none
		font-family = ""
		font-size = 0
		font-style = ""
		text-color = #000000
		background-color = #000000
		is-visible = true
		is-disabled = false
		is-transparent = false
		is-default = true
		border = none
		drop-zone = false
		right-click = false
		saved-params = "pos;size;is-maximized"
		title = "3.5 simulator"
		titlebar = true
		statusbar = true
		can-close = true
		can-minimize = true
		can-resize = true
		is-pane = false
		is-minimized = false
		is-maximized = false
		can-scroll = none
		icon = ""
		image = ""
		image-mode = stretch
		keep-aspect = false
		transparent-color = none
		alpha = 255
		macro = "macro"
		menu = "menu"
		on-close = ""
	elem "mainvsplit"
		type = CHILD
		pos = 0,0
		size = 640x372
		anchor1 = 0,0
		anchor2 = 100,100
		font-family = ""
		font-size = 0
		font-style = ""
		text-color = #000000
		background-color = none
		is-visible = true
		is-disabled = false
		is-transparent = false
		is-default = false
		border = none
		drop-zone = false
		right-click = false
		saved-params = "splitter"
		left = ""
		right = "rpane"
		is-vert = true
		splitter = 50
		show-splitter = true
		lock = none
	elem "input"
		type = INPUT
		pos = 3,373
		size = 590x20
		anchor1 = 0,100
		anchor2 = 100,100
		font-family = ""
		font-size = 0
		font-style = ""
		text-color = #c0c0c0
		background-color = #000000
		is-visible = true
		is-disabled = false
		is-transparent = false
		is-default = true
		border = sunken
		drop-zone = false
		right-click = false
		saved-params = ""
		command = ""
		multi-line = false
		is-password = false
		no-command = false

window "mapwindow"
	elem "mapwindow"
		type = MAIN
		pos = 281,0
		size = 640x480
		anchor1 = none
		anchor2 = none
		font-family = ""
		font-size = 0
		font-style = ""
		text-color = #000000
		background-color = #000000
		is-visible = true
		is-disabled = false
		is-transparent = false
		is-default = false
		border = none
		drop-zone = false
		right-click = false
		saved-params = "pos;size;is-maximized"
		title = ""
		titlebar = false
		statusbar = false
		can-close = false
		can-minimize = false
		can-resize = false
		is-pane = true
		is-minimized = false
		is-maximized = false
		can-scroll = none
		icon = ""
		image = ""
		image-mode = stretch
		keep-aspect = false
		transparent-color = none
		alpha = 255
		macro = ""
		menu = ""
		on-close = ""
	elem "map"
		type = MAP
		pos = 0,0
		size = 640x480
		anchor1 = 0,0
		anchor2 = 100,100
		font-family = ""
		font-size = 0
		font-style = ""
		text-color = #000000
		background-color = none
		is-visible = true
		is-disabled = false
		is-transparent = false
		is-default = true
		border = none
		drop-zone = true
		right-click = false
		saved-params = "icon-size"
		icon-size = 0
		text-mode = false
		on-show = ".winset\"mainwindow.mainvsplit.left=mapwindow\""
		on-hide = ".winset\"mainwindow.mainvsplit.left=\""

window "outputwindow"
	elem "outputwindow"
		type = MAIN
		pos = 281,0
		size = 640x480
		anchor1 = none
		anchor2 = none
		font-family = ""
		font-size = 0
		font-style = ""
		text-color = #000000
		background-color = #000000
		is-visible = true
		is-disabled = false
		is-transparent = false
		is-default = false
		border = none
		drop-zone = false
		right-click = false
		saved-params = "pos;size;is-maximized"
		title = ""
		titlebar = false
		statusbar = false
		can-close = false
		can-minimize = false
		can-resize = false
		is-pane = true
		is-minimized = false
		is-maximized = false
		can-scroll = none
		icon = ""
		image = ""
		image-mode = stretch
		keep-aspect = false
		transparent-color = none
		alpha = 255
		macro = ""
		menu = ""
		on-close = ""
	elem "output"
		type = OUTPUT
		pos = 0,0
		size = 640x480
		anchor1 = 0,0
		anchor2 = 100,100
		font-family = ""
		font-size = 0
		font-style = ""
		text-color = #c0c0c0
		background-color = #000000
		is-visible = true
		is-disabled = false
		is-transparent = false
		is-default = true
		border = none
		drop-zone = false
		right-click = false
		saved-params = "max-lines"
		link-color = #80ffff
		visited-color = #008080
		style = ".system {color:#FFFFFF;}"
		enable-http-images = false
		max-lines = 0
		image = ""

window "rpane"
	elem "rpane"
		type = MAIN
		pos = 281,19
		size = 640x461
		anchor1 = none
		anchor2 = none
		font-family = ""
		font-size = 0
		font-style = ""
		text-color = #000000
		background-color = #000000
		is-visible = true
		is-disabled = false
		is-transparent = false
		is-default = false
		border = none
		drop-zone = false
		right-click = false
		saved-params = "pos;size;is-maximized"
		title = ""
		titlebar = false
		statusbar = false
		can-close = false
		can-minimize = false
		can-resize = false
		is-pane = true
		is-minimized = false
		is-maximized = false
		can-scroll = none
		icon = ""
		image = ""
		image-mode = stretch
		keep-aspect = false
		transparent-color = none
		alpha = 255
		macro = ""
		menu = ""
		on-close = ""
	elem "rpanewindow"
		type = CHILD
		pos = 0,0
		size = 640x461
		anchor1 = 0,0
		anchor2 = 100,100
		font-family = ""
		font-size = 0
		font-style = ""
		text-color = #000000
		background-color = none
		is-visible = true
		is-disabled = false
		is-transparent = false
		is-default = false
		border = none
		drop-zone = false
		right-click = false
		saved-params = "splitter"
		left = ""
		right = "outputwindow"
		is-vert = false
		splitter = 50
		show-splitter = true
		lock = none
	elem "textb"
		type = BUTTON
		pos = 0,0
		size = 60x20
		anchor1 = none
		anchor2 = none
		font-family = ""
		font-size = 0
		font-style = ""
		text-color = #c0c0c0
		background-color = #000000
		is-visible = false
		is-disabled = false
		is-transparent = false
		is-default = false
		border = none
		drop-zone = false
		right-click = false
		saved-params = "is-checked"
		text = "Text"
		image = ""
		command = ".winset \"rpanewindow.left=;\""
		is-flat = false
		stretch = false
		is-checked = true
		group = "rpanemode"
		button-type = pushbox
	elem "browseb"
		type = BUTTON
		pos = 65,0
		size = 60x20
		anchor1 = none
		anchor2 = none
		font-family = ""
		font-size = 0
		font-style = ""
		text-color = #c0c0c0
		background-color = #000000
		is-visible = false
		is-disabled = false
		is-transparent = false
		is-default = false
		border = none
		drop-zone = false
		right-click = false
		saved-params = "is-checked"
		text = "Browser"
		image = ""
		command = ".winset \"rpanewindow.left=browserwindow\""
		is-flat = false
		stretch = false
		is-checked = false
		group = "rpanemode"
		button-type = pushbox
	elem "infob"
		type = BUTTON
		pos = 130,0
		size = 60x20
		anchor1 = none
		anchor2 = none
		font-family = ""
		font-size = 0
		font-style = ""
		text-color = #c0c0c0
		background-color = #000000
		is-visible = false
		is-disabled = false
		is-transparent = false
		is-default = false
		border = none
		drop-zone = false
		right-click = false
		saved-params = "is-checked"
		text = "Info"
		image = ""
		command = ".winset \"rpanewindow.left=infowindow\""
		is-flat = false
		stretch = false
		is-checked = false
		group = "rpanemode"
		button-type = pushbox

window "browserwindow"
	elem "browserwindow"
		type = MAIN
		pos = 281,0
		size = 640x480
		anchor1 = none
		anchor2 = none
		font-family = ""
		font-size = 0
		font-style = ""
		text-color = #000000
		background-color = #000000
		is-visible = true
		is-disabled = false
		is-transparent = false
		is-default = false
		border = none
		drop-zone = false
		right-click = false
		saved-params = "pos;size;is-maximized"
		title = "Browser"
		titlebar = false
		statusbar = false
		can-close = false
		can-minimize = false
		can-resize = false
		is-pane = true
		is-minimized = false
		is-maximized = false
		can-scroll = none
		icon = ""
		image = ""
		image-mode = stretch
		keep-aspect = false
		transparent-color = none
		alpha = 255
		macro = ""
		menu = ""
		on-close = ""
	elem "browser"
		type = BROWSER
		pos = 0,0
		size = 640x501
		anchor1 = 0,0
		anchor2 = 100,100
		font-family = ""
		font-size = 0
		font-style = ""
		text-color = #000000
		background-color = #ffffff
		is-visible = true
		is-disabled = false
		is-transparent = false
		is-default = true
		border = none
		drop-zone = false
		right-click = false
		saved-params = ""
		show-history = false
		show-url = false
		auto-format = true
		use-title = false
		on-show = ".winset\"rpane.infob.is-visible=true?rpane.infob.pos=130,0;rpane.textb.is-visible=true;rpane.browseb.is-visible=true;rpane.browseb.is-checked=true;rpane.rpanewindow.pos=0,30;rpane.rpanewindow.size=0x0;rpane.rpanewindow.left=browserwindow\""
		on-hide = ".winset\"rpane.browseb.is-visible=false;rpane.infob.is-visible=true?rpane.infob.is-checked=true rpane.infob.pos=65,0 rpane.rpanewindow.left=infowindow:rpane.rpanewindow.left=textwindow rpane.textb.is-visible=false rpane.rpanewindow.pos=0,0 rpane.rpanewindow.size=0x0\""

window "infowindow"
	elem "infowindow"
		type = MAIN
		pos = 281,0
		size = 640x480
		anchor1 = none
		anchor2 = none
		font-family = ""
		font-size = 0
		font-style = ""
		text-color = #000000
		background-color = #000000
		is-visible = true
		is-disabled = false
		is-transparent = false
		is-default = false
		border = none
		drop-zone = false
		right-click = false
		saved-params = "pos;size;is-maximized"
		title = "Info"
		titlebar = false
		statusbar = false
		can-close = false
		can-minimize = false
		can-resize = false
		is-pane = true
		is-minimized = false
		is-maximized = false
		can-scroll = none
		icon = ""
		image = ""
		image-mode = stretch
		keep-aspect = false
		transparent-color = none
		alpha = 255
		macro = ""
		menu = ""
		on-close = ""
	elem "info"
		type = INFO
		pos = 0,0
		size = 640x501
		anchor1 = 0,0
		anchor2 = 100,100
		font-family = ""
		font-size = 0
		font-style = ""
		text-color = #c0c0c0
		background-color = #000000
		is-visible = true
		is-disabled = false
		is-transparent = false
		is-default = true
		border = none
		drop-zone = true
		right-click = false
		saved-params = ""
		highlight-color = #00ffff
		tab-text-color = #c0c0c0
		tab-background-color = #000000
		tab-font-family = ""
		tab-font-size = 0
		tab-font-style = ""
		allow-html = false
		multi-line = true
		on-show = ".winset\"rpane.infob.is-visible=true;rpane.browseb.is-visible=true?rpane.infob.pos=130,0:rpane.infob.pos=65,0 rpane.textb.is-visible=true rpane.infob.is-checked=true rpane.rpanewindow.pos=0,30 rpane.rpanewindow.size=0x0 rpane.rpanewindow.left=infowindow\""
		on-hide = ".winset\"rpane.infob.is-visible=false;rpane.browseb.is-visible=true?rpane.browseb.is-checked=true rpane.rpanewindow.left=browserwindow:rpane.textb.is-visible=false rpane.rpanewindow.pos=0,0 rpane.rpanewindow.size=0x0 rpane.rpanewindow.left=\""
		on-tab = ""

k4  M�e��'�MM�GK4  Base Namek.dmi �PNG

   IHDR  	`       ��C�   �zTXtDescription  x�u�AK�@���_�h/
A�6�i�ԒJꥥ�ь��I ;��{)�h7�e�{���zS�P֕y��`�?<*/$��B%�<r�|��eo��:թN�J�~�;�A��+$z�I�=Y:�^�����;�S��]�y��	�g���3^c�E���F0a���$R8��^SGwG��^��8xn�=ya�^���ש%ֻe]�_�(�"į|�    IDATx��pՕ�?-�f 6�
6�����%��f<Q��܎++��^\o_�C��K��o�P�N��&�&��"���2kg�E���ڋϮ,;��^���`���ow�h$�V���>_��3==��{������s˲�@ �@ �@ тi�v�6˲�3�&�@ (��n�@ �@ �@ �@ �^���k��q^o��o�@ ��C*`	�@ �@ �@ фi�v|���pL�_�M�_	�@ L��%�@ �@ �@ D��مq��o�p�e|�M@�m�@ �ʨ�u�@ �@ �@ Am�|�����&���)S��ۚ�׺��@ 3R��ӡ־>h�Xl��C`�@��W;R�������wWuJ��k��Z�gk�/�6$�%��@ �@ �`6ah,�=��c�c���v6��ϋ�E2�,��`X�u�o��x-�{:L;�	\�x�㏪;�h�F���Ҭ9
��^< ��lx&�PX�d��C9�۽�a�/z��4 irdH¡�z둇i��ȀS-��/o�p$����n�C��ֹ_ގ�T�~n?jq��� ڈ�W��rn��_�~�&�����{.�E��C�1�Z��r���m���Z�W�iڱX�b�����s�q ��>���p�>��6��=���o�:W�iΪ�1Xk�(����_k~��Ŀ|��_��qOـ5'ࡺ�q�F�=��\�$�˹&���i��Y�?�L�ݘ���0��04�i�6=���>����:.�UI���j[�)I�A�G�d�ǉ-���8T�TՀ���?���j��.7�>�g���r_��� ?w~m��Ol�����D׀�!�E��G�~�/�]�~�/�E��W�#�?�Q�_���ZA����ؚ���s��λ�����oS�ZT��;qǂ���i�o��ic��>�O��2b����s0�� ��K�%�༎�T�wXF�"�o�LC����_|�z�pL��,Ӆ�o>�
<*�4d�4��c�k�ǃ��#�B���2#dr��(��[#ݔ$�B���$�G ���|չ.9ɻD��|�4��H7%K�@EN�gH�w�s����|��o��iQm�wN\&~��p�?wvc��#�/BA��V��Q�s@	�ډ�?��
��0�9��|�?Jվ�5D����~�/�E����_��������������Z��jDU�ƿMӴ+��鬰��������_PG��z�̻�9�.u/��*�%/O*�V�D6��t�E�w��e̚ȜU�3�R�8��S=�{��[�?�9���!������_��_�?k�?%�ڀ�����$;w�;۪`@p9|���py+�	]ݺSxO ��i/��1�h:~?�n���W��'r�_��ר�9���_k~A�Q�s@���E�����}.�E����_���!�g���P�?��n���;;��b�k����"�y���&���	?��ǐ���,#��f����'~��'~��o�i#��fz��Rξ;a.�Q�QC�t�؝���n�&,�Q��.&��G=#��O��н���]?{���h�`�~��\����K�%��c��d��	x���r[���2>���o����5W���ې#�1Z�/x3]9�}@��G�p���[�=A��pÁ�'H�J���z�\��>T[2]���	����r���9`F�����0��noo���0/|'�/oC��!Z���!�E����_��Ҷ��+���/�E�����<���JS,s+Ož�X��U�����y����?�iݢx��a�թ�tP,���y��z�P���[��ouN����x��Ӭ�W������Ybߌ���b�ظϞ�J��j5���&,m������X?}��3a�zt&��@��? �/��_�/�G���J,1�x�\�sK gr0 ����_���+��~�5Pm�%�3�����s���i�x�5��z�m�a���&�įu�����LCN9�#����}�Z�fJ�׊\{j\�o@��J��ͯUm�-�ڗdh�z-�;/}П��a�Cg~�ӆ��/����?D����_�~�/�E?�_�~ѯ���9 �?K��n�;?��S"^��)�E5���7:R�],ar?�)sS
�����mV5�~F�R��>&�c{�2T��i3�l_�;����Z,S���ӄ_KO�i���U6V5�m��f!�Lb��`X=���i��%;�߽������ws���5ޅ���r���Y�����Z��ͯ��H�5$������J,@�.�H�ٍ9
�xηd2I[[[����F2��ӣ�]vc�����;N�d2I"�p��D�m��'4�C���ߞM¡L���G�_��������s_�� �y�����eHA=f@���~x�_K~m ҥ���ɒ?]���Z��������/M~m�(�xn}�_���k������/«��F��5�����_�~�/�E����~�/�E����C��B��Xv�z�4���e뉭��x,�2,�2�Ţg4�3K,�4M;ݤ&`٩&?�cRA�X���;&$��,�]�n���=E�oP�����҆T�k×qg�3F��W�a���q�2է�n\�g>D|!�Ə��_X�����]tq6�?�*X��P�9��Lq&������_�/��Ϟ�Oـ�L�_{�����k����Fa5��9 �FF����Csfr��iSHpK�:�/���e]ӣIb��j����\l��-���]<��S~�m�ï1��5�T~�K�8�������F���S��| fJ�k����u[m�m��~��g6�kP����*�2�{���±�H irАQw��!,T	.)-�Z�w�0��\.o���_�~�/�E����_����_��~���?9c��N��댫ܿO-�47/~���vۭ<��F;�� �I���m�)Ӡ*Dķ�q��T²,�0F=^�щ�x������� �u�0M�.�Vcm�d�٭mo�;�Z,�)�g3M�noo�o^����s%}z��o������V'��֊�ߟ�?c�'��$��n��
A��`"������K�%��!�S2`U���?�ۀ���Ϩ	�����}�2�B⟔��h�+���}]� ��}]����+\��?A�Yն�8]SC
��K�HQ��}_R�!����2�֮� Ȅ˯Q��C�3��b��p\Ë��Ma@�߃俗���s��$�����N!�������+;	U�}�
��h24�?��MI�u�+9��s�N0���Z���nR\�G�m��P����{祻���v�)9�4{�oW��p��U���5�u��F�����~�/�EI[D�E	����_��*p�f���7�,i[�p84g���o��A���p�e�Op�>�n���;�ŧTe���U����C��K�G����f����֪�\�#�p��rH+�ޣ�K�7�ϙnJRxwɡq�Q}�,���?�@�����{����s.��O�?;��%���k�K��z���q��O? �����9���}��]˿�L����T8�����eLuI�3��ph�j�gL�k=W!�w-��ז	t�5��������K�˲����׀�6,Ŵ\�S�OC:Yza����|��=��������ࢫ������5Ah����s������6�����n����u�5R�?]k��݁�����v�A]�#p/������6���_L��n��Z�ǀ����*��r0�c $�5$��v�B���O���a�I�ʕ�^�ΠP��3"�k�o�����.��pנ��=���KCCf���00�&ѝ	�.���n�K�܁��R}�����xu���\�w���PZ������xV�����_�����/_^�c~Ϟ=��q��E���?h^��=?�G������yE���|��������ӟp�S��� �E=wo<D���??ǿ��_|���~�����; ̙w)O�p#v睰cH-��e|p�B�6����$���5V2�1)��X,�V~*A���s��|��7��t��"��:U?���}[W֏��>�������+e�3i�k�@׋]��$Iv�����6���8 ��EӏE�cpE�����>ӕ��s0g{�1M��E`ř�6پ3��㶱�/��K�%��k������j_��c���0�[���{x��Aң�5�@�	�!��@+Kճq���.��[aU�Zo{'%��������``�Qί/j���a��4M;1���'��qv/���n�o�o> ����r����?.	��=��v�v�]U��Z� �����P����|޴�[,���Ҥ�<㕆eY�~O��gc�
�_k�,����_�� ��k��Ë�2�aN�<�����k�������� ��;���Xl����Hx�~~}��7��6U�_�O��Q$_(}oB��Nyb���W�sڢ&���u�蟹��~�G]ԏ�����u�Q?�g�~?*�|�L�L��w9&�P�@վ	�m[��9�=%ּ����+�%,=	�[��X%m�U�r'����K�lZb8kȕ��9��٧�ـu��߿�3b��LӴ':�=�|6X�o:�s���P�9�s9���YM�'>q�ϫ������c���I�%���l���X�i������7F��t�GϠ	xm�`U��wʾ��m���߷t�˩/8�1�	Ý�/_\O��oz]���ӓ��?�Q�Z�����~kޕ����&�u.��xV�Vm�?&���@s�����/S��@����D���3�wA�)�ckb���9����a�2@A�r_�=������4m��cy�ؚX�kŭE�=��lhm����3�u�����p
ez���>W������,������\�ʹ�.«�Ր#y�ͅK���K��b�j��6N��Kn��!�(4���K	�p�}&T��k��|���о�*��km�u� ��诬?}$I�+7��t��z�:g����0m�6�>����3S�U_Z��L΄��0�L[��\�Q?���?����G��������Q�=����8��? �}�;�����`�7��ߢ�~X�̒�ˆ_�9����6MӦ����~��댫���a�����=m�s�z��L�-A8m�mjYDg6�(���3�n�*��c����[�`ƞ�����js�:�ݾ o���>�|�3ƒ���:�Տ�c�ԒA:�g�����l�E����X?��L`,�4�D���H8��߂;��S�N��?��3a&���Z�_c���I�%���l��S�)1���eЛ�����	��`,���@�&���A�q_��\�#}$���T�а�Y�,WOӣI�ߺ���$DR�[�t��N�%���Al:�'����3Z=���{g��5f9���R��5bXM�����s^��:�섧��cت�o�b���L;�@{{��C���'a)�[�׫qXq�o�^���i������2D(�����wŕb��w^ۿ��%���Vy���~�x��G�dP���ޜ�mkq����)o �~ ���_��w��Ԣ�Uń��ß�q-���.J������:ՅWB�^���h�vg'�i�a܁[3~}\;�T2��k��?����k���d��3�>����a�PF��Jοj�+!p�.�;R�݌Z����Y�r2�̀.BɹJ��׵���fr��iӳ*G���9!��T���)��y��w���e�ZgK)������i�%�%�ң�ՏT���)ÙLʬ�A?d��H��������}���N>V��?��G�������Q���?���~��B�~��ɟ�a��\�I�	��ט$tj=�m�� ���~���j��:�[���&��E�^B�QG,v7EgnŽɵ�R�F��ad?�#�:�t�� ��9����R� e>��n�{�P��v�J�4��ʙr�&���\l��IT%�댫 x��	����]=]�xw�[�p�m�m����]&�;'���N��y����n�5�}N�t	3c&��?�?fz��+r�s��?�^��K�%���ǿ�L;���|�W?�.�x���9�.�9��;�"7ӕs9Kք��L���bkI�� a�?������B�CaPUƎ!2��t��%m
��Nhq�I��V߱��t��e���1�t�x`�o?Њ���;��G��6j���)�x�3f},�Wt����~��O�`�鄟;ܨ�6��ªf�� !�?Q����L�t�r?\��ou�
\���%�\б�y�xX�F�����a��t�%p8.h��A�ZI7%U�Wn���_�A�oJ��W��u��Z�0��ҵ�g�k��q��ӪD�,�w�@��{Z����ϟ�cp����02����H �?��Mx bߌ�9��!}��s�<�}3枛���eY�AJ�s��:
���o�U�L�d�� n%���T{�H�&�Z佪m�G�]�:���~U��?��۳��_�_�O�?s}�־$���Z��R���1��,#�E���H��{2��D��_	˗/?�vL��?��G�����J���_	Q���?��+!J�%���5LӴ����I���j��b�α�q��K�i����;�og�������u���9�q�>��}�߾��7�{�nC�Ÿ+��~Rjd��}n�2�rd�(�V����ug������P}�>�2�9²,#�]�X���5�}K���)�VRb��,�ؽ{����M|��K���9��������]�l�R�w�E�?3i�?��L� F6��{���z	e��ӫ�LT�?�E�g��D�O�'�	���'�=�z2�|A�+'�ؐ�K�%��'�S��j.���zkO�| �M>vg'�!������rW�g)��Tg�)��&��H��%m�Y']�	��r/F�|�D�ew�b��3ķ�+���j&=z����S�'�&��T�9 ,���,}�]�&��?�s���6�����|K�߅7���/췂?�x�v��%?Ȫ��� }�5��8��k�#�ňgI�D)��kK���xIO�,#��|���l:�g��(��tb\��r�u�gp�ߒ+Y"m	9��c1��B�sᱪ��uCdF�yCpw�l`�d�^��LC�̕9�!���Z�J?w*o�MO��V¹��N眶c#5�W����|	�x�
H��7V5c����eՒ�rn���hZ����9��~��P8�m7�Y��NU�m�7�����H��<������r��Qw�>=�c�t\X���f'�t.�	�Z���Vg�2�΀d��[C��g�oY��"��u�\�X�`���5E��ԏ5���R	b����E�����?���~�G]ԏ�����?���&��dzrp�z�?�s�pgz���T��Y�.�ҙ ���+.h���뇐�6���o����0���P�-J���t'F1��C�7mZ��$�@��	�-���a�n���	w�A��z�ӭ�5]���'�_	�J\z,�~�ӝ���b^ ٜ�@|!�}�7�M���8��|��� �}�����x�P7���~�t�}��>J*�#ጽ�y��MU����B-�3hN�wL'�����N���No���E~-�sW8˫5���q�	�@�l)�� �w ��ϒ����.�U,ݪz�[�%�Ml˳�W�0�g���CꋮE��pZ�^���C�?$lܸѸ�_�����X���"Xs��<a�*4�r<a��57^N�E�_���qѿdٸqc(�ƕY�¿��ݎ��en�c٧1F^en�c������n]4�a����e�?��sS���zR6sS�ϸ�n�C�����u����J|˽�zc�U���`�OU_]�yR��r/�����R�TK��Q����,#q��i(���W1�O��s�P����,����t�V���sE`p�k�2�*�O�+����  IDAT7�T��§�KW���U��Y�Ơ��*4��Հ�����3��9��73�_W|��4{^���v���-��g��p�X�U��@Dz4�ݑАs/��w��5������٧�/���y�G��P��V�o*��0_ih���P��V�[�r����	��DÚ��%�3�
�������X��X,��/���?L�~�/��'�_��~�/�E���W?����Vz�@��$��_=�>���ϯ,��1�(����
��]�ѻK��Š�L�*O��KW`*_q� �SG��HP�������Yb��ұ��
��L�ۧ�w�e�����1��On��+�A�:A,�߷�e��P��+���_�����~�Xp`8΃_�s��5W9���}�6������Z4�~��=ϙ�I1n|+�\�}�2j6��O9j��2(�+�]�b��"�37��OzK�+ZP78�'�9��NU�Y傕����B�/�w �缎��*`Wf���QDLb��ާ0��ڡ�;�b^��ؚ�=N�?>躟-�2L���s9N��0���`Y�:��A�<Y�h~�iS#\�x5�� �����������'���.h��p���ꮃ��Ir?ʱx^������Ϙ3o 'G�aμKy��:>�0�2_(�ԏ�3V�������Ezn3��Eй.x��j\�7�*,�'I�� �]�5����A��e�K����gj[�M�3��\hU$�=D)���Hy����;���Αxv���ヤG�d7��yִ�c��ooo�w�����#e�_m�ð��w@�&u��Oz%���t�r���$�]�#�<a�ё2� Ͽ��i�Zz��/�ߪ��y���U�N�:NW���sd�Y������y���:���?U�t�a������5�k�"K�+ǚ���@�I�ղ{αp��-p]��
/�YC�-9w�1�MC���żA�u�PU�l��\g��8ǋ��MƟh�?��2�aC�~�/�E��� �E������׿�+>w~g����O�P��u�{�k<�c���A�E]��'jg�X���[��{p�v��#�xc<�-^�)�yӶn����z�X`�1���Px�y�(<r���-v���W��/˲�4�ĳ�[+0�M'�=Yro�JE����'����Ui�������~�z� x�ϻ����{a,��c�	+�xf�����K]�)lR�m��wڑi�ym�-�gIl0�����ơ���󞉇UE>�pP��������&��`�:��� dU�<���Ϯ"�i�6/�� +伊C�A������7���V�߰,kJ�����p�����;.6.p�|p�/+�~���,?��i����G�d�I��?�L����_>����nRKY���4��|ȯ��$'7�x_�z�o�|�ё2�5������K�9�#��E�=��v�v�k�C��T��K/�������#eڟ]�b_	c�c|��&�߃���x�i����]�Y����������:�*�:ԭ�@t����M�<���~���_��;�V|�߇�I~p@��t��]�tX��;tL%��<��i\��6��_��R;�K�ܿL�+�cP�^�N���o�%^X�oX �\�S��y�7��kp*UM�Pk�J�I�'���eH7)#^�y��>��̀t��"~��N�@f�{ ����ˁ�-ϋ�
x��+y�>�j�U���ãtYp��
ό�Hx�Ս�v6m�����_�a\o��s�i�~�/�E������_�~�/���_	�iڱX�b�)�&�	ǭ�j�;S�Q�Z�����{��\��J��ķ{�+ �C�j�1��o�
�����q�㯂u.�|E�N��z灙����D��I�5"~�Bi��Ǵ�րQ��4�D�g��ז_�!����c��T�u�Gb|h� N��إ�98���<��pQM���7/V��'�?Z ��z��R�	m�w��>�qwSߙ� �3��k�x��$�����z�g��%K��C�� �O�U&��' g}�P8���.�G �����pz�n{��o���7/~��c��zM�h��H��W�Qq>j����1�}�ۖ� �?Q���1hh������~\��>x�	 ��s�;�c�4���5�O�۞j:��k�snp�F�9�t�U�kk������\ޱ/f�h����gF�u��}>S�+��w99f({�S��ʬ*ɞ
�|��{xz�q2��º_p����u����|�X�#����8+�ӟ�11b�©4w6�,�,���ط����7��IQ��J�K���䝪�����/�E����_�~�/�EH�}0M��7'�w�/���W;rnX���O7ay7E���,�����E��;Y;"��F�k}s���D_lWF���d�>��95/��:㠕T-��&��`����+P�����w�5��������կ�����m�CoG%~��|�ƚ�k�=�z�W�s����ô�J;�������6���s"H�%����3V���gE�_�ޝp���a �\�P_ڀ�7� ���۠J���������o���Ɩ���eqB]��>��g��/�:�*~R��W6�Ʃ���n�o��?<}5G���e���/�]��;�]��˭q�qG�U�@��[�؆�n�
�.����k�\J�����3��/�]�Oܒ���z�׏ջǠ��ٚ��i�k>��.nr��gu������6T����_�W�m�x�w����@��pY{s7F] �G��e1�M/m�e�x�h���`�e��^�ε-��o
����]�>Z�ݾ�Z�.���~�b���-�t���2�a�%j�����_�a����_����E����_���x����?�2t7��=%m�`ǂ��|@i��B���P�?��k��s�a�	�٪�o�
�Pu6�U���?uH�9��ԧ*ˣ*������ߏ(���П����[�U3����E-�_�S����C7�H�%����)U���7��O0gޥ��WE-��	A�:R�������GQ���KB�/��/p��k���T_�M\��b�¦��8|�M|��>
�p����ipT��&������a��% �ݸ�t���x�a��+��3��o�w��FK��o�xl�W�a|H��"������OQA�N�.�j���7��-g
�m�Ħ���i��\����C$��ɩ��w#k>z/�'1X0粒�����3Z��l���aP���
;-n	��D�����������_��J��_��+�E?�~�M�A�]~�\w�nG�(�\���6���ֿ?gf��j"��t5��~�?�����HT�?~h����T;?�7ll67�[��)�)�a����Կ��b�����-LH�%��������Ԗ tP>��U	.�rL�y���'J�B����]�I�лK��u�.�|v�Z�o�~��'l~�߲��;�ت�o��|(���%w_�Op��njĩ�W�� p?{�6�j<����_x6�8H��G��~��c'����o�4n��������zM�W_����:�����"�}Vwɱ���7�
V��~��֎�0�`�e���_{���+�g�������'��/��/��/��/��/��/������6�K:o���Ԏ��	ǟ �t(s]�P�=��v���y���f�Z��d��m�T�?�c\LB3�L)�U毆����I�+l�������Y�����c�~�ι̽#e̷m(�B,�_~4W�m��Px�Cd����n?V��ԽA�X�2}نk@XӸ��_��P.�O�:��%��gº��ת�=7�u���c����p5V?V�w�>��%��,C�_P8V!�_�!�h�ܻ,c�~`�\��ث��'uo�K���m�c �o��2ü��G|a�}����?[��܂2A[����3[��9��/��/��/��/��/��/���i���`/p	��<���⎍
�=/�;�U��j��AO�i編���$��� ;�`U3]7�N������,��a��X5�?��R~�g���M;L�����WC�/���K���#�?�����d������J��@���o:}�x�D���TMh����ӧ�ûk�t2���y�B�?~��)��\�$Ӑ��b޲[ڿf���6lp�N�?��M%�@W�����8�����R�$�����K�0�k|���nWȦ����N�X���9�1Ǯ�p��!��
�������U9����<�A��[)u`V�]�J���@5�N��f������������������
�:z���T��j�������k~�	��`%dV�2�s$��zSv��w�~�X��q�U���H�=���_�9������&���$���3��eYSڱā�|�w��O������.֌��4m�s%��$�\�#��1�0����As��y�����e���L����ˎ��'�_���ô�ߧ���C������-�}2�����Urܵ�����r�!�� �0������/��/��/��/��/��/��_~A�!���FO�i�����1v'������Q��ḻ_��%�@p~�*`��6j��G����z�p�`���YC��G��@�P�g��]n�ʇ��/0��*�u�՚ߏ��LT�*-MgU�/Ou���i��?/fZ��Y�Z����������������у��0�)�pJU��կ�3]6ۇ�ö���@ L�&\3����    IEND�B`�}  ����'�M��IGZ  Base Metamori.dmi �PNG

   IHDR  �       m�b   �zTXtDescription  x����
�0E��W�6�	WYXZ��֍?0�Q�}@2�{7�(��lfq�a�&�ǲ��.�D��q �f+<#�c��y0���갧��R�O0���Zj��D=T����y٢֠�Z��0�����C;,�w�D%?&��鯿ʖ#�<0{f�<�>�cY�~���&��.��vp���   \IDATx��ϋ�}ƟW�3���v� q���0=��Iu �jA�&���l���I`D���xEbrH���\2e�����iA����E3ݻ֛C�����So��]������y���[��~���}B!�B!�B!����n������X-��B��e� �B!�B!�B!�����$w���涇]�	!�Gq8!�B!�B!�BHuI��GB�� '�B!�B!�B�8�fZ�y�~� h4  �z����B�2\r]�M��<�y�B������w��u��j�������s�O!�B!�BȦ�n�u��D�׃R��%��l6)N!.Yj�$|�Ϝ�b����Z_�t:�x��<O�]�;��Y�m�O���߅�"�>�m�:�\�����BlR���4��O� ��?����_���������/J��ۦ�Ͽ����:��#��$A^U��O��z�_x�E�����M}�������mg�;V�Pe�o����> �����������i���' �� e�3�����ڔ��0���g��?��?��I��O�����m���]P��ߢ1��S��IO���k�W=���g鯓���B� f�i  -/���V�P�?H�"�c`S_�~���Only���c�O�^G��@&@��ƿ-�2�j�������>��O}�S��ԧ>��O}�W�����oјm~�{=��l6��{�^z����@W�>��O}�秿T��	�(%o�(��K��R�G����?��f��٬�@���s�O��O� ��?�������7�����ES��o��� P�����;�m @/q���� p� �]_U��i� ��?6��Rk�'0o��f�h�=�~�޳��Z��z��\`=LK��d��'b!0���ߌ�����r�/L��Gt�i
��qx��j��Ze������*�O��_�V٠�����F��g��(�N���-?�����w~�s�� ��Au�(NT��+Ϻ�B���*�O���_=^�Ȅ��$�+� � ��ߌ7ڮ`�W*�Y���}a�<�NG)�f�{�~�ڙ�����M���6��ӗ2�Ԧw�R����N_��R����K\jӿ;})�Km�w�/ep������\��~b�ߘzp}v�Ħ�������}�]�'�Os��E˜��~J}���z�Pb|������N_��R{��s�E����3����x3�W��n�������(ط>i?QP8�ʃ�i��
*���+���e��L>O[K�l&�������� �8����$��)�>����'py�7�H�M�����i������i������i�f����QBR֑M�m�wc��o? 0�C<&8}�W�'�s|�]'�z�1h ��} ����,�,2���ױ~0S��lF�wkW�a7��a��B�?������UM��N��1�;���Ck���;Y�7�ʬ��(����3�����w������`��a��Me�O�^�v��i=�]2�AV�^��$�Ŝ���	� ��?��?��?���?����%��l6��$��W�  ������@��_��?��?��L<������"���� �7���4;\����� ����/�R���j�.�Q�е���e��y�:�GGG�vg���h&�T*��{�(c���LVa�Ǹ��?S��I�������k;�F#�=�F��5}����S3�ӿ-��3� �O���Zk4�Mh���F��C�vz��x}�8�
8U���z?�7hy��$�5+\������:U����>��_�P|������}_��-���+��� f�H� ����m�z��>�nWe��o�O����)�]�h
NZ{�t�aO���C){�Y��� ��m4��vg5XO~�v���T�@F!,O]ݿ�Mo�z0�h���t��L��:�3ׅ(�?��Qx��օ�g�G�>����18>>V�NG�9�l_��9��)��o�����/���������������MG^k�����h4�l6�ߟ���ϩ�uD���Ĕ<��#֠M`���I��T����1���Z'��8�^�y�}��}���S�aW�t���7�����_*�H�Q�&�hK���X��w���WQ��m]���}a����$�MN��A�Wz}�/0�������{�G�~���˼���ʄ���
��@�-DO���u��F@��6{�
�����)�fM	8o�_/��j�Ӷ�������������Ͽ<W����m����P��� n��� �� �U#��?��_ʧ�Q�[�9�t��?U8U���EI6ÓL;�Mk\G���o��V�~W-����7���	p�	��B���r��d"�Ȇl�V��NG�H�D'����}�Ӭ`���\{$�e � �Obd;��zp��Z��v[omm(_���� ���?fV�o?��mln�w:���Z�����Ock��q4\:? �����)�vfl�9���|�և ��>+�d_[�����4�r�?��_�׻�'z*���ľ&�v�>��K���濨�?�?߿��U�2����'��OV�� ��~��'����2������ӿ��7W�~�u�������zpX� �"�����o��������nr���l�	�&@�$@< �Q|k	i�$F��'��$D:�6H�������LNyD��$"�}ԃ8X�q���ښH<�%
K#�'���L����o���������38��p��4 �j5���5���Y-.g�k�Mv�y����}k�>Z�@p�wS��=َ��nX[�g��D9��Q=п�P�������c�n_�X�mV��g|������3������C����+uQ}����~��Ϧ�/]�y���z�o������<���;�%i!ST�#u�x��5~���;��Q�)�� N59�|6�?���,��9���h�n�'o�|������)�^��h�`�6���eb�Y��>�?�o���� ׻�_�-��0�0��Br� m��H�"0O~ս4��8��g2U�&�oA$A�wtZY��o��t����t�4�Y尕��	�f��n�-`�{�� ��|2�'��T�oB��@v�7ѱ/*�-fw��:@��S���a��@�o<�^���v
��p�7�w��;����i�,yŁ�a��or�\��I��y�O��7��@��~��g�����_(`�s~�g���R����,�������/,�+<k�_?�ˎB�5�����?��,����z���ô����?��v[���x�������^��� ����,���81����V:�����~��� ?��ʴ���8�~�^��F��F��Tؖ�֮^�}��_�O�i����xr������� JP� ��L��ij�$������ӧD�I����3��M�V��y� k�f"Lu/e6��|wz�g��+ַ���g�tB�6����ʸ*��$U�ս�A���y.��Ӝs���2�_��:)l�;`$���E���N�0k�7�gMҽ:�`>hy�y���M��4�o��O����|�P��B�� |�,\��U��W���� �o
|�N�
 ���8|��; ����j���.cv��?��(p����1h���g�h�3�d#C�}��Z����d����F�,�?h�,v ��e�/[�������Q��ެ}�,�M����?����o�/�����i����s���2��<�}@����_)�^�={7�M�z���mK���V4���B=��2-���l�,�HY���NO5o.�'���:�q�"l������E�������_j��^OL}�(���z�\�q�zħ$-�� �0�k�����.\�x5K�F�I�i�?��|H.�$����� �|�K(�qo������Φ�Vl��E��� �i����-���������Y�籁��}ս�n����ǹ�����Ӓd�y�}��G���L�� �<�>��ק���O>�t�D/v j�ɛ��zةm��w~m�^��^�������F�����D8�ϟ� g�s4�M|��K(�.��X�N%�1���uf��7�@�h����З� ����N(Ҡ��>�ӿ�y���Ŭ}�=����������eg?�͂��I����>��`~~���t�W�+ڿ$(�y>M��Q���Q�&y����Yv�Q9�@�Z�x���`"�~Q�n߇$�Ujjz�.g��"��7���f�_z
tս�����o�uy��%F�	Q��2�$T�uəH��V�Mn2�4� �=�DX��_�����G�"N���e����<O���Z�9y�G�ˏ�4�In��%�*;?����sƹ8�
��t�z�[�� �>�1he����?�T���]�'��,����}�w|jA�>ƨ{���o���Ǡ���ʔ]�^�����!����0~�5B)��T���RM逧�O��7I?���ǿ?�O}�S���O��o�y���z�_f��e>C���������?��j"iL�f�ԛ^N�<G?�h�\'��l�����Bڹ|�W���qG/��$)���2�y�)��O}��f�5�ӣ���m�#kZN�r��n�ỿA���0�]؟�<d�p�㢦^��uEb�; `��� ��}�l Oߴ���=���� o �x���簽n���>d��A"�P0���E$� ƿɦǿ�������|���  Wp8���fBp^��NF�j5��Nb�k ��m��j��v��ξk�<d�ɧ�F3gK<Ȳg��QG�Or8Ά��i�����ό�}�㸨�I���$xK���(�³��n���D��������l�I���������Ow�����ԧ>��O}ꯗ�*������aّ��������5̶�iK�I[Ӣ~�nͳ�s�@b}q�Q.Zf�}2=+��5�"m6��ԧ>��Y)����N�e��t:z4�8rV�: �U@	b-s-��h�N��m�m4���x������&��~��fB��h � 0����r�"�q��7ƣ�$�`�Ѩ�>���/*���V���y��
����{����`���y���v�a�y�t:�:�r�A���FQ�lu���'�n�?N�z�e�˝�F�歟��:���H��{��E�̩�͵�_��֏ S��rAbʵ�	^?�9����h�o��E��z�葺y�z����^�x�G�Y��� G}�S��ԧ>��O}�S���y����~�T����]t87)�����X�,�Fu�]_��ԧ>��Y:��� ׾��7���_���`kk׮]óg�z�׮]+$�j����Ya�aj�~���E���O��|O�r�5�$��wA#�ƨh�m�?�N�9g\ǟk}���/?0��ޘ�����6r���~���֖�f�ׁn4x���D2>o$����?�|а��6�ֶ˜������Td�o�ֽ^Zk|��gP*|���nh� ���|���z4
���>�������ɵqޚZ�����/  ��&W�^�͛7��$���?��O}�S��ԧ>��O}�S?�R$zST���x
���u |k˞-S>�U�?�S�����sw2M��f��:�e*�~f^$��&2T� B����֖�uxE�L�<{�R&[��v[K�{�HOy�֍H� $^�m�e��J���`ӿ�m�JY��V��q��M��@��&}m�Q���_b��hD7\��@ֱ⛿\�X���e{h�n޼���� �_���Ѷ/���vu��<ய��_?���R�����y�y����_��������I�]�������ims&BT=�����M���C�$H�Q>�
p�����*r���)e(r��s�g!�.S?+	m�v�%�\x��Y&#�]ǟk�,��Y��۸�3�]��=9��D�&�I���իW�߽���W�^E��K$��������_?}��?��ҧ��K�����}��?���ߤ�t��?e��}�y�������}]�z��?�o��Kˈ�ss䫈K��fc�k}IB5�R8::R[[[�F�2����X�J0��m����Q@��ì��Ǣ��:�\�T-���0�fg� �kƻIQ7�~�?Q�f�ۈ�Y�2u�!������a���L~۝�����S��ԧ>��O}�S��ԯ��k����}5+�=o�����S����W������!�Z먀6 �����#�.���h�~��X��h�2��o��̄KQ�����i��2�����]��oE�)є2�岁��s�/0�C̘/���ck����@���ZCk�=���E`�w򷔋[<x�@���^�M7��^vl&�]_��O}�S��ԧ>��O}�S���軦������O}�S?���@7�FO�"�]���/_�V�%�+2�ttt�:�N�,_Z�MO� ����1����_�v��%�%������x��}���`3	�����&�Ӹ�?��@u�_b?�޽y(�ǿ�����?nq��C��e�1D���y��NG�����{��R6Bla+��(���ԧ>��O}�S��ԧ>��O�jPu�U���>������}���#& $�0k[^��O�NH��ZaI0��i���t���v���hTI��8��i�ت���Z?M��E=ϣ���y�Lx`�3���t�`2��Q�y�/���S��ԧ>��O}�S��ԧ>���.�7U�_u\�S����/5�L�����p�o2S���v�(�4.��ňo!X�v[Y��V�?�\ǟk}�����c��"���}�y^�\+j���{��i�<`�l2���ԧ>��O}�S��ԧ>��O����\Pu�U���>������B@ّ�Mm�    IEND�B`��&  ��
��'�M��I�&  Base Cooler.dmi �PNG

   IHDR  @       ����   �zTXtDescription  x�u�=�0���W��k:�d��J�����`? 9
�{!n��y?�2���9�j1��v�Ql�³a�F�����C��ݙ��{G�yCCI%�T"��yз�Y6L�'_�,��3v\�v!-�?�{fs{��]`��>��"7���^�_��){�9���K��\�j���pv�i�|    IDATx��}lW~�g$�r6�D�T1�V|!�j�.�5
u)���֩��&6�`�f8��.Ԝ$�Dj(�����kq�fK��"H}����)&A!�Ȯ��\"C����	�5n��y�����p�s�p$���%q8��{��y���=eqq�!�f�d2J'�IHHT��@D������`P5�FBB�1�*!!!!!!!!!!!!!!!�,�evΨ3�*Q �ؙP5���O	�Ɛh���D��P�
8f�F��ܻ�{s��iv���� ��ֆVy��KHHHHHHHHH��`0���i������a�L�s%$��F uz �4�k)`h��8�|y���'�FN@�d������LL1�@v4����6;�ILo��{;���Z���6�������w+�Nտ���߽��8E�cZ�vk�%�66z��
:�7��T. ^�;ɲ>#j�*� ^�@�~�t5�����ofm�4�����f�#�P(  r���8�z���~<�w��V���8��.bjj
~� 000�D+���C�m�R�� ۱���Z��"�yn��� &���'�_�w1 �����k����_����׳���/�%��w/#�쎿����K���!�� ��3�$�Rw�%��Ϭ�u#������/�l����X=;x$�I��a<��
���!��ćO�^f6ԃ�@��>55�}�꟮a��ee �s�N�C���"�� &��n�����������ߩNտ���߽�f�t+�}ߍ�p/6B�C:�@y�3�F���[x����s��l�Yݵ"�N'���?��_��pP�`��8p� ~� ��	/��)���_׼M6Pٓ�$���[S��,--1QFT�? vr�嵋����7��0����yH���/���l�э����_򻗟����x�}��w���:�Z�w;0�y���A#���w#�?�I��f�5媇��)K{���:����,�����������$N�8�>��'N �L�ޣ]�����.b;�Y�3~.���=x�!`jj
���l��e��LmĽ��>�pKKK P#~�)>��?
�6@��p(d+?��l⟽Y���Q ���M<��_���=��K�'����!���}���/�%��w/�݌����h�o���_ԽI�it-���t��w�o�'IK�ӌ��&+0����[;A7���u0T��كu��5�~��6��f�,� |>�z���W�H�+�=���>����f�سg�}���ь:��#j5R�#����o[9��r��T~���� 
�0�U��Ԕ�od�� Ξ=��ӵ�q��Y��|@���π�f m���"g x��v� ���R��R�̞�c;v��O�������������>ݮ�/�%�{���f�5��V.�U�����|�#o/2~Tُ�b��3�̾+b"�h-�-
���U��e����{Z��xyT��kD7��8G��=t�V�
 �Qgtb��>���r!���=�;�;�,�P(��%� �ٽ��z���N����3"Lh(�G~�{��T? ��U:t�t�f�R@��V��g��^~'��� 
�p&�Q��x�АN�q8B�P��� ��m{0d2ey�"��4P(p8b����$��P����L&������x<���$�I���ex=��� �X�X ���?���A�\��_
`����K�'H���;]��_�K~���p"������ t"$��h��v�G����������,�]d{����5��mz�N���8��u��/���	����|=�����s]?�x�0QB����@gl3�yI������H�+�z����'���ɀ�e� ��*�~?����ٽ��%������CU5sh�Ш��͗���|Y3�����x������U�O�������[���[��N�_K����V��)��c1t�٬��O '�����`�ˎ�P8f{+�r���\.@��ўV�� m�������� ��p~)�I���/�_��3��t�K~�/���O68�X~3Ҙ�h�ڬ�eU�o�D����r�b��%��^�k��$.R[��I�4�&�$p� t,�� �>�ɤ�'��� eU���X,�S�Nannsss8u�b��n�<��N@��w�^֞�l+++�2Q]�XK�	�@�:nn�F�\~'���!H<�;��D�� X��Í���$�x��5'N����nF;��2<O�$v��g�$x��O��;�Az�r���c�ܹӖ�����J k�7}f��w���8��2b�{)�$: ������0==�ǣ{v�{����K���o���v8U��_�K~��;�lpK��l'a4��;X?�@h2����&#�s�}��C9)�.�tK^)�ӈn�Ud��xoJ�0��N���PH����/�/y,��Q%��[O� LOO#��!�J�H���
/�{���R).���Ti�.��ڱύ�[��N�_K(��0�al�x�>��(�#<�����;�F�}\��������JǓ���۳��*��_ *���f��%0==���(<}}�� &�[������_�w�
���z��t�� ����������o�_���\~�/���o��]�d�5��)?/@�a<��!�T.�|f6`)���8ȧr'�I ��ᥗ^�P�qK���E�={~��B�q�⯙��CT]����>uBI �N�k� ^�;����g�}���D�X,���i�B!#��#�Lb��Q�NO�N�%�`%3/���|zz�C!( ��� �n� �R)�'����h� L��������|��[��7�����������³8W9�w�Y���1�"��%���[��N�_�(_n��5�;)�����ַ���O}ni֥{f�<4�^�uܺu�� 4�StG��� ��ӏ��g� C������  ��iv2���C�/؞� 0�������`0��OZ�C=��F�����:����68U����s`پv�E-�_46[�����X�V���uN�_������\�x\�JY��gG��p(���h��x<>K��vD8��|����#��"I��Z �������%���2!�h��A��c�w�/�k���0��:���P�q���S� h�#����У(�.���I�q�_l�"h0TI���ֶz���k|>��<���N�eXS�*f��T�I���*��kY]�S���x�Z���?�b���v����vz�������/,�k�P��"@��� <�BYN���VA����cvv���(�J(
��E�}��d���q�;�� �����{�Q4�
�B��������ov<w�F�����- �f� ��YY�Z]��e?��57��S�[�l�A�������ҥ���g�H��C�w���;�����	����������ԔN _������v�[�k1��������z7k��淊�^�V��D�p8�$o�u��ߍ�6{�y�h	<?��fh	|;1���a`]�{l���Ͳ����4�̨3�An<	�� ��I�>�g\��I�Iܥ=�ْ�\�f�+��?��h�Y��9�`����)�]w1�����y��)&���z��U�(
���/��U���j|��S S!M䟚�BOL|�O�g�c  ;h��\O<�H�6P`*~ET��v�O��?7��I�kY mw ,r���wS �����ǫ�1��٘۷ocvv�*]˘�����Ů]� ����q�ڵk:�@TDU��}בJ�����FOw�k3P�T
C���Qe��?vy�e��3݋��L'����X�~�������/�Ay�|>\�e}�� ��o��g@���Gɼ��M~Bp=�g���I�����w�;����|'�f���i~Qج�o���p�p8��� k���3�oܸ��C?�[�� t�"o' ]��F�����̭��d��5��v�OuN��"z�@5@���x<����3��������F�U�bp�?3�y�;�Rwz�af�u��OBU.�c��Q<�v�q3|Ryܲݢ������[E�v��!H��ʔn̓����x�)���륀zL�QLU��;�>���֗ �r��5[����*� 
������U����-�I(`�$����y�{�t�(~c]�����amF�o߾ͮ������Y��(��kov	`������>�gϙ�����0nݺe���x�����ϟ�ݛ���׾�!�ҿ��D����S~Q~:�m��o~+b�f.;���ڣc��n�2�O� ����'Oj��l�����O�9�=q6��@�K|��ǫ"1�gJٵ%�������zK���ժv�?�n͖i[]�K��0*����[����??��g��%�����������������7 ��� X�&�a	����@��	`o
���ٽ���o �����;A| �/&�������%M�fsڌ$mn̟B7<<�6>�N���òGr�{��?��Ě�H�V�*<H˄S��O�\�������Dq�h$�m�2>)M��H��­���������K(:Ꮸ�q�Y���t�$ ��F0��� �b����P�h��va#���! *���_���K'�}�Q]{��:��d�u�/*�S~�����H�V2pE�Δ��F�j��ŝ;�I]�:~���6r�3���s�N� �.�� ��ƕ������P�t�4&"jD�U��*N�4^�6�l�cK�FK^�߆o��N㴮���_�k���|ݲUe}���s�gZ_?
�}P����lT2����
���2�D�Dv�	��`}�/ �zz�	������;�{�-��!&~���}U��;��&��P( 
i��V��B�*�q4{�eJ��.r{�۪�w���
�a l�4�D��GB?Fr#��b��b�}�6�����7�&�L�� ��bbb�q��Fp�_?�n7��-o ��~>�sss ����+�z�Y�|>��;77ǜ ������U~������8��uV�h<�^D�T
EE�7u h�u��ߏ\.E����/��b � t�o���_��)���|{�������|>����AQ+},�a߾�@������S��ȴ,��	� ��U��c�{����QPfp��\;��\N�gc�W$���)�qe'�3o��o~�+{�n��7X;v�������¶���~�F{@~a�������/�/qw�m[?��0�;�ײ���s3���zEQ x��2^�%�j��|UU.y}��VmYǌ:����@������G�766�R���7�������l�G�T��#F�\�e&��/�S�CD�'m���vT���r�q[�{�{�8��T.��ʈ��;�k��EBI�γ��Z���?7��I�k9�� ����#L?|�+�K	i�u��b����{��s(V��o#�E|��s��GX*4���"_�"�qD����� ��Ƙ�@ς$	��������P�Tt�oU�m��c3�H��Dɍ Ж���.`jz�����U����v��u����o]��7������Q^tL���f����B�O��n������ǭ[����EQ�P���)��Пr�wi&�n�$T<g�f�]����9�AD�H���|�F����4�?vL���/:i3�e���I~�����"�o�>�ߊ�?ٺ�������/��{���9�{w�Cx��տ��Uau���	B�=�K��*V��y�j�BUULMF�GY�%�s�^/�ִ}�w�z�~O���Ŏ�aqqQW�{��r/㉾��G��m:8����m������B,�&�7�����t:��&3�Eab���C�ý���`0���cm%���
;�k�޽5YÝ�?��OZ���L&��Ғ�/���O�8��Ge���٢|�1&����xt{�3a���������$���|@t^�tI7 &1�W���O���	`"���ǵkה��qu�8�%-E���(ӝ�p��^H�׾�P(���Y�����u�20�^��l����~ �P@s ~Y.���q�f6JQ�b1��~��{�y(�:��v�6�FGGUzS����Y�r�����M녮�ߏ[������1��� �� �DY{-�I�w����L����@�BA�I���v
)M� ��Q��${�����euC�F8=w����$B�|�AK�f��_.��J����@������^�uh�>z�(�?���Z]C�P"@-���/�_�w�/"�
�(8��Í��'l�2�b��!��8��X��ά���8�(��2�b�ȲS���\ �{�ihB�Dq�.�ñc�
i{2�R)aB�)����/�&�o^c}L� �W��DW��EQ�$� ����4�w>Ӓ���2.���gXZ�H�$����׎����S��(N>Ӕ�f�c�.�����s X=��!�׭�V��������5@�d2JQ��0	`TxR��N�j��[�D�� ^��&���111��/��������v|����}	���� 4��O� �+W����Vg&�Z�����K�Ry��1�� n|�������k�����,���8^�P�8��f�#�#x�ғ ���^[����+}���K�  � @Ul8���E`��k����|�~�go��r�
��U�@ ���6�<�J>�7��o:��WՙQ��7��5f���2t$���Gg��QHI����rx饗  gϞ���GY�;�F�?��EA�K~��"��o�򋆛��Y~#��>��U�:���j����U,��������@��Uu����>%F\�(�"��A��v��������xs�_�±�T*��bB�O���B�T*�����= ����!��l���[��P��M(	���fh+����ܙL�m�B��3�C�x~û��w1�Gz_A<�2�F'?if6���Ӟ��G���r96����q3���R~'��i�ۿ�6:������8 �0��'��W�n6ch�?H�@۪ �g�����B?��?���$������C!LLL ���0b7��p(�R��`6M'u��\�z��Mܼ�U���E��O���֎l�|y�`�?[�ǅ����U&8�tn�@�kh`` �l�u��zZ�s�!�_����P��i�K}xN^t������N�A���b�8�����zQ*������0�^/JJ���ڦ�'�y�	���jK���ן���u�-��Q�O;�"!�%��w��n�?f�f�	�����_?���������+صk< �z�*n߾�?��C�ڵbX͑PPP�P	h�k�S(t��={���?��|�O�J�؁@���E����R)��~�B!���w�}O��͛l\�ۚ�"���7�"jcccسg��3 ��OcB�Ll�����Ͻ{5��2�yl�2>�w�^a"(��Q�^f�1�A�}�m��w;u�����;�P��k���2q�:`.��S��E#�V��7o
y!��&��Z�ׄ&>�b�J�"j��A|q}S���dS{Er����Ӯ��-;��yA�4N�.  @��P�H$~~�O��V0����k�_(f�/� �z/:#���x� �3��OܥRI�~(�g��Ev�����zh���������?���*$�����׃[�O=t��F��I�7:��)�_���0+���>3
���	�ڷ=�������_�Fd�h>��l �ګ����H	����,q1`7����9���b>�h��V��.��2�'�Ǳ�O;�ڸ���x;�5fy�fsѴ�����P~��OY\\l�9 �#F��x/^�]sn�;틿�xS�6���M���^J��7s]�*���1Q���G�H�>|v`||\m�?Q���Y�3���Qϻ��X�*����Ml|ϳ�=�4�`g��g>5^UUf/�b���n����c\�ٟ  �IDATF�z�/2����3�g0Q�`����iv���OP��������5b�Ͽ����� c{k'���;����o�_�K���mi����{�^~		���U��N��!�b���'���D�u �U�f�O'������^~QhԞ[:ɸ6?R��d�б��!
�C���p��ɗ#�$����_/��v}�a~ U��6�͢`�\�g��.�1��׏"1��54�$P*��ia:���L#(��`�'��v`'��{j�6ѐ�����O�O>n��a�����`'�ީ�ɦ��1v���gN�m��k�	���3����,l0Nl�D�:�	�/�%�s�5vt�����K�N�?���L�z��"�N����嵋5K����;&wZ��������[E#�k)�:e�\ ��wR7 >W9 5�PQ��R��w�Y,�_��d;����L&�N�>����[:����m��"����W�^eaڗ�L�vjo�(�`0�j�?�0V��_�N6���1[(�Em��� ���8}>Fr#:��me'{��Q#x������^�~ �ߝ�Om�k� ����g�ռl)6���F'DT�Tr���8�(=w>����f��<���v@{��J%[�n�����*��6 �%��w'����?�N��$܍���Z![*;����-�=����"aֶ[� %��ix=��i� 4�$p4{�e��%y=��e,`����z4��ڵkʾa��p� ���.�/��u���]�~�@��}�X`�lt'�N"Mt;�|uf�3�Y,�_ lb��_ ��&�abD>{���d���E��=�Aj��fww���Au��_x�@��a6gD���������Z%�?3��r��Iu$7��}'mk�F_�}>�$�Ӳb)F��	@'z
�J%�f\͠�y-i�#��i���]f��p�����v�EA�K~��^~n�<���I�����bS�vwR>��݂����/f6��(��6Z~*:�������Q��_�xt+��0>>���b����E�m0f�5z&ve�����g�&����SUUw�����=���Q�ȥ(�n/@��A��n��f>nW�y�����N~��� ��Ӟ�vf��?m�OB�X��x~�����s�[�#:\�K~��.�z6�%�ճ�����;!۟{������ۍ�f��/�2�����e�Wh 8�ΰ{?������	Hh�(N`���m$�-�%~�&�Au�7l�����f�؅L&�$�J�9<�J�OQ[�_0TI�$>C�Jd���=�����o7}������	%���<&���,N�P�	v�HO�'�R���S�t����M"3=�kD��/�%�;���6B�%���$���^~;�4�^%Z�^�)��y�ɞV0::ZS�n��Nr���g߈���n���u�	������N��V�D<�(1�v8���_�K~�/���/�n���n8��%������4M�sQ.q    IEND�B`���  6�䟕'�M�F^�  Base Android 1.dmi DMI' ���1 ���   �������3 1 ���}}}���TTTiii�����ˌ����҅��***�3 �3 ������� 3###���[[[Z ! !888bbb111�33�3f�3��3� ��3��         '-
@ � � 1C C1C1@0C1@ � @ � @0�1�!�PB �P�  �!$�1 ��,2,�ʰͰ��˰ K�����q081�2 � �� � �p �4 4 �dP� � � UM0H0@0 0 �d� � � � � � ��� � ������� � � � � � Y0H� �     "-	
@ ��� �2(C �2\�2@0(�2@�500�@ ��� �נ00(�2 Ȁ �Ȱ\p,C3,�5 s-�2,�2 �u(��� סd�q� H�d4<� ��dK�� � �2� � �0)� � � � � �5X0 �4 �4X0 00�4X3 00�4X3 3 3 0 �4 �4 �4 �4 �d� Y0         � @�@0@ � B1@ � � C1�P��Q�!,� ��P���!��h�� m04��C��C3@��4H04��0,� K��� � � ��� � � � � �`I0       � @�@ � �P4@ � @0pC1pC!F �1�1� ,�� �!���th� L�4h�C3 ܴP3 �4@C3 �4@�IC3 0H� P�� � � � � ��� � � � � Y0       0@ � � 1C C1C1@0C1@ � @ � @0�1�!�PB �P�  �!$�1 ��,2,�ʰͰ��˰ K�����q081� 0 C4 �4 4H�1H0L5� � �0Q�4 �4 0 �d� � �`� ���`� �`� � � � � � � Y0H�       � 	/@ ��� �2(C �2\�2@0(�2@�500�@ ��� �נ00(�2 Ȁ �Ȱ\p,C3,4 �4,�2,4 �4(��� J�4 �4dK6 Ò-�2 0H0L�4 �4 äL0 0 �d� �`���`� � ����� � � � �5 �4 �d�     � -
@�@0@ � B1@ � � C1�P��Q�!,� ��P���!��h�� m04��C3l� 0@��0|� ��-� � �4 �2���@0��� � � � �4�� �4�0�8 �4 (� � J0X� � �     	   � -
@�@ � �P4@ � @0pC1pC!F �1�1� ,�� �!���th� L�4h�C3 ܴ� x44��4@0,� ��� �2��2 �,8,0H�� � � � 8H� � �0�8 �� � �0H0�0H� �     
   '-
@ � � 1C C1C1@0C1@ � @ � @0�1�!�PB �P�  �!$�1 ��,2,�ʰͰ��˰ K�����q081�2 � �� � �p �4 4 �dP� � � UM0H0@0 0 �d� � � � � � ��� � ������� � � � � � Y0H� �     "-	
@ ��� �2(C �2\�2@0(�2@�500�@ ��� �נ00(�2 Ȁ �Ȱ\p,C3,�5 s-�2,�2 �u(��� סd�q� H�d4<� ��dK�� � �2� � �0)� � � � � �5X0 �4 �4X0 00�4X3 00�4X3 3 3 0 �4 �4 �4 �4 �d� Y0         � @�@0@ � B1@ � � C1�P��Q�!,� ��P���!��h�� m04��C��C3@��4H04��0,� K��� � � ��� � � � � �`I0       � @�@ � �P4@ � @0pC1pC!F �1�1� ,�� �!���th� L�4h�C3 ܴP3 �4@C3 �4@�IC3 0H� P�� � � � � ��� � � � � Y0       � +@ � � 1C C1C1@0C1@ � @ � @0�1�!�PB �P�  �!$�1 ��,2,�ʰͰ��˰ K�� ��G1 4Ġ� �� � � � �AM0 �DU�� � �`�4 0X�4 �5H�`� � � � � � �`I�4 �%�      	,@ ��� �2(C �2\�2@0(�2@�500�@ ��� �נ00(�2 Ȁ �Ȱ\0H���p�p-�2,�2 �4\��)�p� סd�q��dK�� ��dK6@0H0L�4@0 äL4 �4 �5X4 �5H00�5H3 3X�400H000H0 �%� � �`I0    � ,	@�@0@ � B1@ � � C1�P��Q�!,� ��P���!��h�� m04��p��ۤp� .�  �� ��� ~0��7|0,� ߰��� � � � � �� � (�  0�0�� � � � � Y� �`      � .
@�@ � �P4@ � @0pC1pC!F �1�1� ,�� �!���th� �4h�)�� �L۰� -� Ұ@� 8|�7�0|�7�0,�7��� � � � � �  (� � �  8�0H0H� � � Y� � �        	 Meditate    )-
@ � � 1C C1C1@0C1@ � @ � @0�1�!�PB �P�  �!$�1 � ,2,���Ͱ��˰ K�� ��q0810 � �� � �p �4 4 �dP� � � UM0H0@0 0 �d� � � � � � ��� � ��� � � � � � � � �5 �d�          *-
@ � � 1C C1C1@0C1@ � @ � @0�1�!�PB �P�  �!$�1 � ,2,���Ͱ��$˰ K�� L�q08GB��3@2D2H0@�1� � �0�4 �4 �4 �DU� � � � � Y�5 �4 0H�5 �4 3H�500 3H�500 3 3 0 �4 �4 �4 �4 �d� Y0         +-
@ � � 1C C1C1@0C1@ � @ � @0�1�!�PB �P�  �!$�1 � ,2,���$C3,0,C2,�R00 �$��G1 �sq �Ѐр� �p0H0@0L5� � �0Q�4 �4 4 0 0H�`� � �`� ���`� ���`� ����� � � � � � Y0H� �        +-
@ � � 1C C1C1@0C1@ � @ � @0�1�!�PB �P�  �!$�1 � ,2,���ɰ��ː�� ��,L�G1 �sq �Ѐр� �p0H0@0L5� � �0Q�4 �4 4 0 0H�`� � �`� ���`� ���`� ����� � � � � � Y0H� �        +-
@ � � 1C C1C1@0C1@ � @ � @0�1�!�PB �P�  �!$�1 � ,2,���M2,0,�2$�R00 �0F�G1 �sq �Ѐр� �p0H0@0L5� � �0Q�4 �4 4 0 0H�`� � �`� ���`� ���`� ����� � � � � � Y0H� �        +-
@ � � 1C C1C1@0C1@ � @ � @0�1�!�PB �P�  �!$�1 � ,2,���͐�˰�R00 �0�0G1 �sq �Ѐр� �p0H0@0L5� � �0Q�4 �4 4 0 0H�`� � �`� ���`� ���`� ����� � � � � � Y0H� �        )-
@ � � 1C C1C1@0C1@ � @ � @0E8�!�PB �P�  �!$�1 � ,2,���Ͱ��˰ K�� ��q0810 � �� � �p �4 4 �dP� � � UM0H0@0 0 �d� � � � � � ��� � ��� � � � � � � � �5 �d�          )-
@ � � 1C C1C1@0C1@ � @ � @0�8�!�PB �P�  �!$�1 � ,2,���Ͱ��˰ K�� ��q0810 � �� � �p �4 4 �dP� � � UM0H0@0 0 �d� � � � � � ��� � ��� � � � � � � � �5 �d�          )-
@ � � 1C C1C1@0C1@ � @ � @0�8�!�PB �P�  �!$�1 � ,2,���Ͱ��˰ K�� ��q0810 � �� � �p �4 4 �dP� � � UM0H0@0 0 �d� � � � � � ��� � ��� � � � � � � � �5 �d�          )-
@ � � 1C C1C1@0C1@ � @ � @09�!�PB �P�  �!$�1 � ,2,���Ͱ��˰ K�� ��q0810 � �� � �p �4 4 �dP� � � UM0H0@0 0 �d� � � � � � ��� � ��� � � � � � � � �5 �d�          d	

@$A$�0�0$@�@A$�P�PA$�P�$@C1A$�0�$@FA	��P�$@2C1C$�p�pH$�Ȱ0G$0,C3,G$�2,Â,3$@2 �0CŐ ���@�� � �� 	��pG2HC$4$�dPӐҐ � �0Q�4$�4$@2@C2$@2$@2$� Y�5 � 	�	0H�5 � 	� 3H�50�	00�4X3 ɐ 3 3 	0 0H0H0H0H0H� �5 0       P
				
@$A$�0�0$@�@A$�P�PA$�P�$@CA
A$�0�	@�!� � 9$@���ǀ$@2 ˀs$@2 �24�r$@2,�2,�R0C$00c0�Q	��A�	�ЀрҐ � �p$�4$@2@C2L5� 	�ҐUMC2HC$4$C2$@2$�d֐Ґ ɐ�`� 	�� ��ɐ 	00�4X3$C$����	0 0H0H0H0H0H� �5 0    d	

@$A$�0�0$@�@A$�P�PA$�P�$@C1A$�0�$@FA	��P�$@2C1C$�p�pH$�Ȱ0G$0,C3,G$�2,Â,3$@2 �0CŐ ���@�� � �� 	��pG2HC$4$�dPӐҐ � �0Q�4$�4$@2@C2$@2$@2$� Y�5 � 	�	0H�5 � 	� 3H�50�	00�4X3 ɐ 3 3 	0 0H0H0H0H0H� �5 0       )-
@ � � 1C C1C1@0C1@ � @ � @09�!�PB �P�  �!$�1 � ,2,���Ͱ��˰ K�� ��q0810 � �� � �p �4 4 �dP� � � UM0H0@0 0 �d� � � � � � ��� � ��� � � � � � � � �5 �d�           )-
@ � � 1C C1C1@0C1@ � @ � @09�!�PB �P�  �!$�1 � ,2,���Ͱ��˰ K�� ��q0810 � �� � �p �4 4 �dP� � � UM0H0@0 0 �d� � � � � � ��� � ��� � � � � � � � �5 �d�            Blast !   -
@ � � 1C C1C1@0C1@ � @ � @0�1�!�PB �P� �p�p0@4 ��� � Ͱ� � �� � ��G1 4@10 4D2H0�� �AM0H0LT5� � � Y�5 �4 �4X0H00�4X3 00�4X3 00000 0H0H0H0H0H� �5 0    "   -	
@ ��� �2(C �2\�2@0(�2@�500�@ ��� �נ00(�2 Ȁ �Ȱ\p,C3,�5 s-�2,�2 �u(���� �u(�r� ҀdK6 �4 ǒ-�2 �4 äL0H0L�4 0 0H0H�`� � � ���`� ���`� � � � � � � � �5 �d�       #   � @�@0@ � B1@ � � C1�P��Q�!,� ��P���4H04��@�4H�4 �244@0(C34����hC34C3 �2(7 �"q��R��H0,4 �2H0H0H0H3 �40000 �4 �4 �%�  $   � @�@ � �P4@ � @0pC1pC!F �1�1� ,�� �pr40H�4L�����&� ��p����M� p�  '� t��� �2 �,0H�2 �4 �4 3H00�4 3 0H0H0H�        Flight )   � -�J@ � � 1C C1C1@0C1@ � @ � @0�1�!�PB �P�  �!$�1 � ,2,���Ͱ��˰ K�� ��q0810 � �� � � � �    *   � -	
��@ ��� �2(C �2\�2@0(�2@�500�@ ��� �נ00(�2 Ȁ �Ȱ\p,�5 8�0�8 8�0�8 8�0   +   � 	��@�@0@ � B1@ � � C1�P��Q�!,� ��P��� ���10,�����4� ���`I�P3 �4H�4H�4 �4m� � t�4       ,   � 	��@�@ � �P4@ � @0pC1pC!F �1�1� ,�� �!���thC3 �74C� ��� K���@��5 �4H�4H�4 ��M� �0            Train 5   H
		

			

		
@�@0@ %� C �@ � � P�1Cq %�P���1���!,� ���!�����!@	 C��� ,2,�1 &0 �24�2H`�2,Â,�4H�	��,��� �	�A�&�Ѐр &0@�1@	� �AMP�4 �DU� �� � �� �5XP0H�5 %00�4X3 %00�4X3 %0000P0 %0H0HP�4 �4 %0H� �5 0 6   H
							
		
@�@	� P�P4@ � @	�0 %pC1PG1�`@	�1@	C!�"@	� @	� � 2Z3 �	�Ȱ `�4,C3,0 � Ұ ˰� �� ���� �pq8`�� P�p� ��0Q�4 4 %0L5� @	� @	�`I0 %0X�4 P3X�40P3X�40P3 3 %0 P�4 �4 %0H0H0X� �4 0 7   H
		

			

		
@�@0@ %� C �@ � � P�1Cq %�P���1���!,� ���!�����!@	 C��� ,2,�1 &0 �24�2H`�2,Â,�4H�	��,��� �	�A�&�Ѐр &0@�1@	� �AMP�4 �DU� �� � �� �5XP0H�5 %00�4X3 %00�4X3 %0000P0 %0H0HP�4 �4 %0H� �5 0 8   H
							
		
@�@	� P�P4@ � @	�0 %pC1PG1�`@	�1@	C!�"@	� @	� � 2Z3 �	�Ȱ `�4,C3,0 � Ұ ˰� �� ���� �pq8`�� P�p� ��0Q�4 4 %0L5� @	� @	�`I0 %0X�4 P3X�40P3X�40P3 3 %0 P�4 �4 %0H0H0X� �4 0 9   K-	

					

@�@0@ %� C �@ � @	� %C1P�1�P@	�Q@	�"B1@	�P@	́�� 24�1!@	�2 ��0 %0 �24�2H0H�Y�2,Â,�4H�5�� ��q� �	�A��	<4 C4 � �p %0@0L5@	� UMP0H�`@	� � �� � ��@	� ��@	�����@	� �� � � � � Y0H� �     :   K-							
@�@	� P�P4@	�PP �@0PG1� %pC!F ��Q���1� ,���Q���!��@	 ӡ5�� �Ȱ P��4 �4,C3,0 �p� �˰�	� ���� �� �@�  C4 4<@	�1@P�D� � ��0U�4 �4 %0X�%� ��`� @	�`��� �@	�`��@	� � �� � � � � �`I0X� �     ;   K-	

					

@�@0@ %� C �@ � @	� %C1P�1�P@	�Q@	�"B1@	�P@	́�� 24�1!@	�2 ��0 %0 �24�2H0H�Y�2,Â,�4H�5�� ��q� �	�A��	<4 C4 � �p %0@0L5@	� UMP0H�`@	� � �� � ��@	� ��@	�����@	� �� � � � � Y0H� �     <   K-							
@�@	� P�P4@	�PP �@0PG1� %pC!F ��Q���1� ,���Q���!��@	 ӡ5�� �Ȱ P��4 �4,C3,0 �p� �˰�	� ���� �� �@�  C4 4<@	�1@P�D� � ��0U�4 �4 %0X�%� ��`� @	�`��� �@	�`��@	� � �� � � � � �`I0X� �     =   d

	

		
@�@	4@P� B1@	�PP �� P�1Cq %P�1�P@	��1��@	�"B1@	��!��@	́�� 24�1!@	�2 ��0�%0 �24�2H0���˰ � �p�� ��q� &0810 &�Ѐр %0@�1@	� �AMP%0H0LT5@	�� � �@	� Y�5 %P0H�5 %P3H�50P%00�4X3 %0000P0 %0H0H0H0H0H� �5 0    >   d

		

	
@	H �@ � %�0@C �@ � @	�0 %PG1� %PG1�`@	��Q��@	C!�"@	��Q���!��@	 ӡ5�� �Ȱ `� ��� �y� �˰�9H0c03 `pq8P�� P�p� �@	eL0@P%0L5� @	�� � �@	�`I0 %P�5H0 %P3X�40P3X�40P3 3 %0 0H0H0H0H0X� �4 0    ?   d

	

		
@�@	4@P� B1@	�PP �� P�1Cq %P�1�P@	��1��@	�"B1@	��!��@	́�� 24�1!@	�2 ��0�%0 �24�2H0���˰ � �p�� ��q� &0810 &�Ѐр %0@�1@	� �AMP%0H0LT5@	�� � �@	� Y�5 %P0H�5 %P3H�50P%00�4X3 %0000P0 %0H0H0H0H0H� �5 0    @   d

		

	
@	H �@ � %�0@C �@ � @	�0 %PG1� %PG1�`@	��Q��@	C!�"@	��Q���!��@	 ӡ5�� �Ȱ `� ��� �y� �˰�9H0c03 `pq8P�� P�p� �@	eL0@P%0L5� @	�� � �@	�`I0 %P�5H0 %P3X�40P3X�40P3 3 %0 0H0H0H0H0X� �4 0    A   T-
	
	

@�@0@ � B1@	�PP �@	� %P�1Cq %P%�P��@	�Q@	��!,� ��@	�P@	́�� 24�1!� ,2,�1 0 �24�2H0H�	˰�� �`00c0�1 �4 &0810 &�Ѐр 4��� �0�4 %P�4 �DU� �� �5XP0H�5 %0 3H�50P3H�50P3 3 %0 P�4 �4 %0H0H0H� �5 0    B   T-

			
@�@ � %�0@C �@	�PP �@	�0 %P%pC1P%pC!F �@	�1@	��1� ,���Q���!�� 2Z3 � �Ȱ `� ҰͰ� ��5H�4,�2,�2 &0H0c03 `pq8�р�� %p� @	��0Q�4 4 %0L5� @	�`I0 %0X�4 P3X�400 %00�5H3 %0000P0 %0H0H0H0H0X� �4 0    C   T-
	
	

@�@0@ � B1@	�PP �@	� %P�1Cq %P%�P��@	�Q@	��!,� ��@	�P@	́�� 24�1!� ,2,�1 0 �24�2H0H�	˰�� �`00c0�1 �4 &0810 &�Ѐр 4��� �0�4 %P�4 �DU� �� �5XP0H�5 %0 3H�50P3H�50P3 3 %0 P�4 �4 %0H0H0H� �5 0    D   T-

			
@�@ � %�0@C �@	�PP �@	�0 %P%pC1P%pC!F �@	�1@	��1� ,���Q���!�� 2Z3 � �Ȱ `� ҰͰ� ��5H�4,�2,�2 &0H0c03 `pq8�р�� %p� @	��0Q�4 4 %0L5� @	�`I0 %0X�4 P3X�400 %00�5H3 %0000P0 %0H0H0H0H0X� �4 0         Attack E   "	
@�@0@ � B1@ � � C1�P��Q�!,� ��P���! 24�1!� ,2,�1 0 �24�2H0H0,�2,�2H�4\�4 00c0�1 �4 0810 �Ѐр 4�� �AM0H0LT5� � � Y�5 0H�5 3H�5000�4X3 3 3 0 �4 �4 �4 �4 �d� Y0      F   "	
@�@ � �P4@ � @0pC1pC!F �1�1� ,�� �!�� 2Z3 � �Ȱ 0H0H�24�2 0H�5H�4,�2,�2 0H0c03 0 pq8�р�� �p� eL0@0L5� � � �`I0 �5H0 3X�4000�5H3 3 3 0 �4 �4 �4 �4 �%�`I0      G   "	
@�@0@ � B1@ � � C1�P��Q�!,� ��P���! 24�1!� ,2,�1 0 �24�2H0H0,�2,�2H�4\�4 00c0�1 �4 0810 �Ѐр 4�� �AM0H0LT5� � � Y�5 0H�5 3H�5000�4X3 3 3 0 �4 �4 �4 �4 �d� Y0      H   "	
@�@ � �P4@ � @0pC1pC!F �1�1� ,�� �!�� 2Z3 � �Ȱ 0H0H�24�2 0H�5H�4,�2,�2 0H0c03 0 pq8�р�� �p� eL0@0L5� � � �`I0 �5H0 3X�4000�5H3 3 3 0 �4 �4 �4 �4 �%�`I0      I   
	
@�@0@ � B1@ � � C1�P��Q�!,� ��P���! 24�1!� ,2,�1 0,C3,�4 0,�2,�2H�4\�4 00c0�1 �4 0810 �Ѐр 4�� �AM0H0LT5� � � Y�5 0H�5 3H�5000�4X3 3 3 0 �4 �4 �4 �4 �d� Y0   J   	
	
@�@ � �P4@ � @0pC1pC!F �1�1� ,�� �!�� 2Z3 �p0ˀ0 0H�24�2 0H�5H�4,�2,�2 0H0c03 0 pq8�р�� �p� eL0@0L5� � � �`I0 �5H0 3X�4000�5H3 3 3 0 �4 �4 �4 �4 �%�`I0   K   
	
@�@0@ � B1@ � � C1�P��Q�!,� ��P���! 24�1!� ,2,�1 0,C3,�4 0,�2,�2H�4\�4 00c0�1 �4 0810 �Ѐр 4�� �AM0H0LT5� � � Y�5 0H�5 3H�5000�4X3 3 3 0 �4 �4 �4 �4 �d� Y0   L   	
	
@�@ � �P4@ � @0pC1pC!F �1�1� ,�� �!�� 2Z3 �p0ˀ0 0H�24�2 0H�5H�4,�2,�2 0H0c03 0 pq8�р�� �p� eL0@0L5� � � �`I0 �5H0 3X�4000�5H3 3 3 0 �4 �4 �4 �4 �%�`I0   M   "
	
@�@0@ � B1@ � � C1�P��Q�!,� ��P���! 24�1!� ,2,�1 0 0,C3,�4H0 �2,Â,�4H�5H0 �0C0 �4 �sq �Ѐр 4�� �AM0H0LT5� � � Y�5 0H�5 3H�5000�4X3 3 3 0 �4 �4 �4 �4 �d� Y0      N   "
			
@�@ � �P4@ � @0pC1pC!F �1�1� ,�� �!�� 2Z3 � �p0ˀ0 0H�4,C3,0 �4\�4HÂ,�2,0H0 �A0�00 pq8�р�� �p� eL0@0L5� � � �`I0 �5H0 3X�4000�5H3 3 3 0 �4 �4 �4 �4 �%�`I0      O   "
	
@�@0@ � B1@ � � C1�P��Q�!,� ��P���! 24�1!� ,2,�1 0 0,C3,�4H0 �2,Â,�4H�5H0 �0C0 �4 �sq �Ѐр 4�� �AM0H0LT5� � � Y�5 0H�5 3H�5000�4X3 3 3 0 �4 �4 �4 �4 �d� Y0      P   "
			
@�@ � �P4@ � @0pC1pC!F �1�1� ,�� �!�� 2Z3 � �p0ˀ0 0H�4,C3,0 �4\�4HÂ,�2,0H0 �A0�00 pq8�р�� �p� eL0@0L5� � � �`I0 �5H0 3X�4000�5H3 3 3 0 �4 �4 �4 �4 �%�`I0           KB j   '-
@ � � 1C C1C1@0C1@ � @ � @0�1�!�PB �P�  �!$�1 ��,2,�ʰͰ��˰ K�����q081�2 � �� � �p �4 4 �dP� � � UM0H0@0 0 �d� � � � � � ��� � ������� � � � � � Y0H� �  n   �	
�� �� 4@0@4(0H4(0 08�� 0 r0˰ � �4H3 Á˰� 0X���0��0CA0 �d���0� e�`�C1� CE�`�C1� 0X�40"�1� �`�@0�p�1� �5H3 Á�2�0 0 r, 0 �R,� �� � � � �  r   '
-� �`I0X� � � � � � � � �`��� �`��� �`� � �`�4 0 0@0H0L5� � �0Q�4 4 �4 �p� Ҁр�� �rq80���� L� ˰� ��ˠ��,2,�  �!$�1 � � @ �P��QC �PB �PB C1C C1C1@01� � @  v   �
	�� � � � � ���  �,�2 0 �,r 0 �0Â�1 3H�5 �@�1ǰ0�0��� �Q20�4X0 �0C1	��T5 �0C1	��5 �`���0�4 D1�pC� � Y� ˰�1 3H�4 � ˰02 0 �280 0(4H0(4@0@4 � �       KO z   �	
�� �� 4@0@4(0H4(0 08�� 0 r0˰ � �4H3 Á˰� 0X���0��0CA0 �d���0� e�`�C1� CE�`�C1� 0X�40"�1� �`�@0�p�1� �5H3 Á�2�0 0 r, 0 �R,� �� � � � �                                                                                                                                                  �  7i���'�M���G�  Misc2.dmi �PNG

   IHDR  �       ��E   �zTXtDescription  x��̱�0��>�	��XE���� �>��[�A�)Ą�w01�v;�w���P5�u%�ƏvpP(K1N4(�Gb�H��
R$Ow��u&�sPiC��ux���H��h���e.�+�2��va���0���0����Г�3����+�D<|��+��  �IDATx��?l���?~x�)��.r'��xR����p#YgQ�6���(R��?���y���b�K/54�zr9��ZKam������N)�)��}�����)��~���qζmfK� i��i�@����m���,#x�uL�9~�?�� [[[�۷o��%��;�~�$X/�8s~z�?�����P����t_Y��t�X	>�o�g�_akk�Sb��4/�D��d
9�N�ry��B>Q!J�P9f� ��j/A�#2t�lG揳,����2��07jL�9|+>B/Lx2�����4� o�ڱ݇��U \��V��t; I�!<�(���l�	�7�O9��e� ��\�e7l>#Y�B�Rs)�l��%a�K��.>�B����Ӓն�]�f����8zAi�� �.B��c�&�����_=�&��d��*�&,��7��k�j��ae��?Q"�|}Qy�pD�����e�RI����͞���
66;y^� Bi��0k 5���)X��7�Y�F��r�r���8i��~�i�g�<��B݋i��9�c��� e�e�V�[��!&�a��d��zF"����z�>�F��UWs�֜�9?I��W�
����!_,���S�q�@	NO�8=�Ri�JI��H�_/�Lw 6���4����2n�0J��9�N��U���h������)�z:�0!H�_!����]�r%^Uװ209������u]\ם�:#	�m�sB��t)��	lZ��'�%<�e���S��b�<���l�V��S���S�w_�rF �ad�^�P�Q=�i�� �Ο)��:H�S�B���_8�B�k����BP@�}Ͽ����n���$�~wA�g��?,�aO]���7*��(TP��,Ŝ��TC�w����eY���}�����2@A��k�7~��  �����h��ӻ4����?��F�$�� O�?�W��{�$��$W���E,�nI������ɯ�_�?X��ш���L&C�ݾ;�J ��R)ZT�]���&U!t��x^�ϭ�-���g�6z��>h���K�|N��������)���I� �81��"����~/�ht��s���?�{��GY���7Dghl~U���� Ǎo����d����#��.��o*�/����X��%�ݾয়~�,
TṮ���f�|�I��n)Z������B�p�-�IDP����-�^ ZC�/B�\�G|j{-�����,w  ���e�U�=6h�QW�1į0H���4��{�w�����Ϟu��y����Y�A��H'��wW�l�eyΏ,>ԯ��,g�y8������;P ��W)Z�m������Ǌ�.칩��%`����%1�*�Qb�h�a/KcO{}=_>��X����� ���}ډxHM��=
���]�Q�q�iT���=�𚮏3�����.�����_�.}�������<KKK������C�O~f��cnnn�XX������+���m���a+@�ܠUn�/4����i��K,G;O�F3d|y/��D�+B�k�}���2(��l��'���/�\�h��q�B�U�,��?�l��I�Gq��O�?�ȫa�$����q%��i���^���B<�����f�������,//s{{��)�kkk��ܰv�o�~�e�A��c	N�
t��o�k�Հ���\�~��N ��.�����>U�h�/UM}i�X�>0Px&�B����	�0���8���H�?�;�>-~u,h��G\�QÞz�#��W�;�VqR�?8����ãq��Pݑў*�Ų,��w�S`i�=v�0??���;v�=��ₕ��oZ���x�EQ���݅����T���	�����m�ygc��0p��W(J�S�lH�;~)-?�ذ�AYd8}�Y�vk�\?�~ye��j��A ��+�j ���9'����-B��g�Q�a����vҎ�m����7� ����$� ��˥DsB�Ͼ��;��8v꼹��LF�����}���
�/ey~�A�t�'?��8�gy�_�l_H_<���Ͼﶏ�k���/APG��${�=�Wi�y)�aj{��t���Y�Ü:���\�}:��G���E��l����}-�4���a��N9_��q�]�v�'���6F<ɡ�*����~5�l���ѝ�H�jǓ�w�
O!$M���.xz�8(���.��|u�A�Y���E?�{w���s�|�c��V;����Pn����sT�`�zџ2��Pg�d�_V� ��)�P/č���R��|�qCY~n,�b��E���W(J��?�q����<����w\H�߶�9۶�NO#|`خ���N��&?�}<B���������)I��NOg
�a~?%<5--���T�/�WP}Ve�d�݅:���dؿ^�z�<���YN��<9�ѡk?�8�����eY=�W}Vz��50���mNt����l��Z�;��][�+���i�CwXq��8��4��}w�<-B��������7�}����ޢo�1��+!>�+�*-&��T��j����"���_�cc>���,���T�?�����͊��-��,���:/)���k[ɒ��'��~$b���\��X��j-VK0-~۶�Ԑb��8�&�m�s�6��k�]�G��s�y��7�w��=���q���΁���2�x�(����S%|����m�<׋l��^p�� ��*���S��Nh*!<}I�0�O
q�����;�,Ӫ{���� ԭ�{�
��g������]���5<\�iʏ���Y�^�s��sX��/;e�S +5���Lp�Wib��]N.�aST�gX�/����c]x���}J���P��Y�7��|��Ǐ����Y�W"��k8Y�֜���
�ae�{�M:��>
�e�� �O��!��[�@�%�Wi�j�9��+��]����q�4�$�OG��Z������r X�0L�~�?���}i�s�� ?����9_|�+++\\\���G���8yZ�E0�~�7t-?�;��b������gp��9�� Ɋ���v ҃.�?<����<��~�����a��PQ�2:��6�}Ȁe�E�L%~j�§7�Ki�M���ß���OXW��� `ee�7o���/^����B���]O���}��RBu<	�73bg```��Ɵ��W��b�(�·;x��/^���.//���ˏkGT�z�%~0��a�=��r;������v�Zm�Y�� �GZ ���U���y�'k�:AQT��)@�c,@��>�|�Y���*�sw�ޗ_	�����V�z���qo�y뻁������zu��!0ߙ�pQ������<-~p������`v���孭��T�OOz�\@M������9o߾���}�����9�ȡO%f�W��ړOYz�ԉ�s���F���}�    IEND�B`�~  �����'�M��F�}  Base Demon 2.dmi DMI ���***TTT   �  �3 MMMbbb����  ����  ???FFF���888f  
	���	������         Wi

 � � � � � � �0b�!��C�! �F"�@D1�CA $��D@DA@D1�A CA@ DA@ A"H8��䈀N A��� ���D���A� �DI A� ��BJ+!A�!��B� A�!  "A�#� H �t�	���$����F�h�� \a�8V ��cŁ "�     8i

� �#�<�#�<�#� ��z "�� �""��'� ���z� "�x�	" �<�# $  <� �^ � ri(�C�!�4H ��@�4i"� i�F���Gz��'
(���y���
(���l���
 �G$O5�H �@j��� E�BX E�B
S�
)L@D@    � .� �#�<�#�<"���z��y��G A� ���!zD�#� �$@FD�2��"2��"2�(�#�D	�#� �"���)c#��Jl�Jl@"�� ȓQ#�0r�� �#�A a��� ���
#� �      � 0� � �<�#� �#�<D�C��C� �����=�CD"���"@F��$���$���2�(����#� ���E9�#��X��b�&Y$� 2d�� ��� � "�y�F aE1� ��� � �      8I
 � � � � � � �0b�!��C�! �F"�@D1�CA $��D@DA@D1�A CA@ DA@ A"H8�79�A�A�p�!�&
b��HE�`#�D E��jAPBK��  �4�aH#��F�@i� i�4� ��
 �(V@Q� �b�F    +I
� �#�<�#�<�#� ���z "� �""��'� ���z� "�x�	" �<�# $  <� �^ � r9(�F�!�D9� �Ar9"� N8� r�qBC�pD ��:�@ ��j� H A�@9@ ���@`�0r�* 0R�*��Ha� �*�<�#�       � N
� �#�<�#�<"���z��y��G A� ���!zD�#� �$@FD�2��"2��"2�(y�(y�@�D(F� � "#H@@	H!� �RX�V�b��Ta�PXQ�@Za�V �   	   � P� � �<�#� �#�<D�C��C� �����=�CD"���"@F��$���$���2�(���G y�@�D  �D�@
" H � R(��B
�)V)�XQ�PXQ�PXi�� �   
   Wi

 � � � � � � �0b1��b�! �F#�@D1�CA $��D@DA@D1�A CA@ DA@ �"H���8D��D � �@� ��D��A� �DI A� ��BJ+!A�"  b
�$�)�  �� A$, ��	�,�@	 0"�h��p�9�Xq��cŁ "�     8i

� �#�<�#�<�#� ���z "� �""��'� ���z� "�x�	" �<�# $  <� �^ � r9(�F�!�AɃ���I#"� i�F���Gz��'
(���y���
��Bj��F
+��#��',�@i�X �4���
D�B
S�
)L@D@    � .� �#�<�#�<"���z��y��G A� ���!zD�#� �$@FD�2��"2��"2�(�#�D	�#� �"���)c#��Jl�Jl@"�� ȓQ#�0r�� �#�A a��� ���
#� �      � 0� � �<�#� �#�<D�C��C� �����=�CD"���"@F��$���$���2�(����#� ���E9�#��X��b�&Y$� 2d�� ��� � "�y�F aE1� ��� � �      8I
 � � � � � � �0b�!��C�! �F"�@D1�CA $��D@DA@D1�A CA@ DA@ �"H���!g<�A䠃E4r9�!(��F�	CDh)6D A���
B@ �
 FPC�4�0�HC�X`��F@`�� �0UH#�0U@a���T�F    +I
� �#�<�#�<�#� ��z "�� �""��'� ���z� "�x�	" �<�# $  <� �^ � ri(�C�!�DA� �A�9"� N8r�qBC�pD��Cj�(V@h�4�BQ�� �!��#��#@Q�F�(V�(V�#����#�<�#�       � N
� �#�<�#�<"���z��y��G A� ���!zD�#� �$@FD�2��"2��"2�(y�(y�@�D(F� � "#H@@	#�0 �0RX�V�b��Ta�PXQ�@Za�V �      � P� � �<�#� �#�<D�C��C� �����=�CD"���"@F��$���$���2�(���G y�@�D  �D�@
" H � �(�F�)Va�XQ�PXQ�PXi�� �       Flight    � �
�. � � � � � � �0b�!��C�! �F"�@D1�CA $��D@DA@^1��G O@� �@	���<H y��Ƀ��      � �)
� @ �A �! � � �D� h@ ��A� � "���� � ""h� b�!� �" �	�x" D �4H � +�7+,� $�A�"#       � �
	�q� #� � � � � � � � � �"�@�G"�0�=#�<D y� zD�#��w� �$�u��D)� B�HQC
��R<Q� �<RԐ��xE	�#�1d$�<!���"y�!i      � �


	
�m� �#� � � � � � � � ��@�#=#�<D y�0z� � �A�� �H�"O�w#@
"���0!�Q� "TO���bBU�#�U��Q&�P�<�xD�(�(��G��Gb�@ i        Train    DN
� �#�<�#�<"���z��y��G A� ���!zD�#� �$@FD�2��"2��"Ȉ�y$�p��#� �@	$:�  �	� A �$�@� A Q��VB�C Q�$�A�C@ D "�@GA�  @�	��H �@�4�a��q�8@�+�ǊAD       DP
� � �<�#� �#�<D�C��C� �����=�CD"���"@F��$���$���Ȉ��d$�� ��#� �AA �
�  
� A �$�@� A 1��VB�E@ �"�I	R$ "A$� HX ��
'X`�@`D4�H�
sı�+�ǊAD       DN
� �#�<�#�<"���z��y��G A� ���!zD�#� �$@FD�2��"2��"Ȉ�y$�p��#� �@	$:�  �	� A �$�@� A Q��VB�C Q�$�A�C@ D "�@GA�  @�	��H �@�4�a��q�8@�+�ǊAD       DP
� � �<�#� �#�<D�C��C� �����=�CD"���"@F��$���$���Ȉ��d$�� ��#� �AA �
�  
� A �$�@� A 1��VB�E@ �"�I	R$ "A$� HX ��
'X`�@`D4�H�
sı�+�ǊAD       0N
� �#�<�#�<"���z��y��G A� ���!zD�#� �$@FD�2��"2��"Ȉ�A�G�2 �@�<�H@ �@" @ A � D ":A@ �$�@� �
(��D"�H	 :"$��N8�X �X`4�HM�+�Ǌ��p�8D A@    0P
� � �<�#� �#�<D�C��C� �����=�CD"���"@F��$���$���2�(A �#/� P �<�� ( �@A 
� A H$�A� "PZ		R�NH�� �A"��@X8�p�H FD�4� �0G+��p�8D A@    0N
� �#�<�#�<"���z��y��G A� ���!zD�#� �$@FD�2��"2��"Ȉ�A�G�2 �@�<�H@ �@" @ A � D ":A@ �$�@� �
(��D"�H	 :"$��N8�X �X`4�HM�+�Ǌ��p�8D A@    0P
� � �<�#� �#�<D�C��C� �����=�CD"���"@F��$���$���2�(A �#/� P �<�� ( �@A 
� A H$�A� "PZ		R�NH�� �A"��@X8�p�H FD�4� �0G+��p�8D A@    :N

� �#�<�#�<"���z��y��G A� ���!zD�#� �$@FD�2��"2��"Ȉ�A�G�2� P �< �� P@���0" "�@" ^y���A D "�H	�*D��U�@"$�DD� �p:�F@`H`��D#M4AX �0G+�
s���@@        :P

� � �<�#� �#�<D�C��C� �����=�CD"���"@F��$���$���2�(A AF��" R@�<�H@"� � ($P@"����D@D8(�D �	�@i%$HQ@:I A�"�@D�  aᄃ�	X �M4�D��q�8�
s���@@         :N

� �#�<�#�<"���z��y��G A� ���!zD�#� �$@FD�2��"2��"Ȉ�A�G�2� P �< �� P@���0" "�@" ^y���A D "�H	�*D��U�@"$�DD� �p:�F@`H`��D#M4AX �0G+�
s���@@     !   :P

� � �<�#� �#�<D�C��C� �����=�CD"���"@F��$���$���2�(A AF��" R@�<�H@"� � ($P@"����D@D8(�D �	�@i%$HQ@:I A�"�@D�  aᄃ�	X �M4�D��q�8�
s���@@     "   0N
� �#�<�#�<"���z��y��G A� ���!zD�#� �$@FD�2��"2��"Ȉ�A�G�2� P �<$�@DH$ ���N@"�$� ��BJ+!A D"�H	 :"$��N8�X �X`4�HM�+�Ǌ��p�8D A@ #   0P
� � �<�#� �#�<D�C��C� �����=�CD"���"@F��$���$���2�(A AF��" �#�$  �
H PHA D��� H@I A� � "PZ		R�NH�� �A"��@X8�p�H FD�4� �0G+��p�8D A@ $   0N
� �#�<�#�<"���z��y��G A� ���!zD�#� �$@FD�2��"2��"Ȉ�A�G�2� P �<$�@DH$ ���N@"�$� ��BJ+!A D"�H	 :"$��N8�X �X`4�HM�+�Ǌ��p�8D A@ %   0P
� � �<�#� �#�<D�C��C� �����=�CD"���"@F��$���$���2�(A AF��" �#�$  �
H PHA D��� H@I A� � "PZ		R�NH�� �A"��@X8�p�H FD�4� �0G+��p�8D A@ &   7N


� �#�<�#�<"���z��y��G A� ���!zD�#� �$@FD�2��"2��"Ȉ�A�G�2� P �<$�	@""���@"	$F@T!��� �� ��D:H@ �� �A �t�	���$����F�h�� \a�8V ��cŁ "�  '   7P


� � �<�#� �#�<D�C��C� �����=�CD"���"@F��$���$���2�(A AF��" �#�$@A �A@ � a �$� Hp�+��JH�� �t�@�E 	�� A$, ��	�,�@	 0"�h��p�9�Xq��cŁ "�  (   7N


� �#�<�#�<"���z��y��G A� ���!zD�#� �$@FD�2��"2��"Ȉ�A�G�2� P �<$�	@""���@"	$F@T!��� �� ��D:H@ �� �A �t�	���$����F�h�� \a�8V ��cŁ "�  )   7P


� � �<�#� �#�<D�C��C� �����=�CD"���"@F��$���$���2�(A AF��" �#�$@A �A@ � a �$� Hp�+��JH�� �t�@�E 	�� A$, ��	�,�@	 0"�h��p�9�Xq��cŁ "�  *   /N
� �#�<�#�<"���z��y��G A� ���!zD�#� �$@FD�2��"2��"Ȉ�A�G�2� P �<$�	@""�D "�H	 ���JH@T!�t� �� �@D���  �t�	���$����F�h�� \a�8V ��cŁ "�  +   /P
� � �<�#� �#�<D�C��C� �����=�CD"���"@F��$���$���2�(A AF��" �#�$@A �A@D8(��DH$ ��� E D���(H �� A$, ��	�,�@	 0"�h��p�9�Xq��cŁ "�  ,   /N
� �#�<�#�<"���z��y��G A� ���!zD�#� �$@FD�2��"2��"Ȉ�A�G�2� P �<$�	@""�D "�H	 ���JH@T!�t� �� �@D���  �t�	���$����F�h�� \a�8V ��cŁ "�  -   /P
� � �<�#� �#�<D�C��C� �����=�CD"���"@F��$���$���2�(A AF��" �#�$@A �A@D8(��DH$ ��� E D���(H �� A$, ��	�,�@	 0"�h��p�9�Xq��cŁ "�      	 Meditate .   Mi
 � � � � � � �0b�!��C�! �F"�@D1�CA $��D@DA@D1�A CA@ DA@ A"H8��䈀N A��� ���D���A� �DI A� ��BJ+!A�!��B� A�!  "A�#� H �t�	���$����F�h�� �b�
 �� "   /   7i
	
 � � � � � � �0b�!��C�! �F"�@D1�CA $��D@DA@D1�A CA@ DA@ A"H8��䈀N A��� ���D���A� �DI A� ��BJ+!A�!��B� A�!  "� � H8�p# � H`4�HM �0GXq��  0   0i
	
 � � � � � � �0b�!��C�! �F"�@D1�CA $��D@DA@D1�A CA@ DA@ A"H8��䈀N A��� ���D���A� � �
(��)� �
H��)�� 0 �t�	��� ,�&i�	�p�9�Xq� W�#�8D A@ 1   /i



 � � � � � � �0b�!��C�! �F"�@D1�CA $��D@DA@D1�A CA@ DA@ A"H8
H �	�� �HA D "�H	�U�@"$H1@""tD	$��N8�X �X`4�HM�+�Ǌ��aŁ "�  2   ;i



 � � � � � � �0b�!��C�! �F"�@D1�CA $��D@DA@ CA@ DA@ ��䈀N �  �	� A �$�@� A Q��VB�C Q�$�A�C@ D "�@GA�  @�	��H �@�4�a��q�8@�+�V"�      3   =i

 � � � � � � �0b�!��C�! � "�A�!� ��C"���b�)�  b"A�	 � Gt$��@DH$� �DD@'�D "�H	�D"PZ		RD"�H	R��A��@ 	'�N`@ �X M4�D��
sı� �0GXq � � �   4   Vi

 � � � � � � �0b�!��C�! �F"�@D1�CA $��D@DA@D1�A CA@ DA@ A"H8��䈀N A��� ���D���A� �DI A� ��BJ+!A�!��B� A�!  "A�#� H �t�	���$����F�h�� \a�8V ��+@  5   Vi

 � � � � � � �0b�!��C�! �F"�@D1�CA $��D@DA@D1�A CA@ DA@ A"H8��䈀N A��� ���D���A� �DI A� ��BJ+!A�!��B� A�!  "A�#� H �t�	���$����F�h�� \a�8V ��+@       Attack 6   :N

� �#�<�#�<"���z��y��G A� ���!zD�#� �$@FD�2��"2��"Ȉ�A�G�2� P �< �� P@���0" "�@" ^y���A D "�H	�*D��U�@"$�DD� �p:�F@`H`��D#M4AX �0G+�
s���@@     7   :P

� � �<�#� �#�<D�C��C� �����=�CD"���"@F��$���$���2�(A AF��" R@�<�H@"� � ($P@"����D@D8(�D �	�@i%$HQ@:I A�"�@D�  aᄃ�	X �M4�D��q�8�
s���@@     8   :N

� �#�<�#�<"���z��y��G A� ���!zD�#� �$@FD�2��"2��"Ȉ�A�G�2� P �< �� P@���0" "�@" ^y���A D "�H	�*D��U�@"$�DD� �p:�F@`H`��D#M4AX �0G+�
s���@@     9   :P

� � �<�#� �#�<D�C��C� �����=�CD"���"@F��$���$���2�(A AF��" R@�<�H@"� � ($P@"����D@D8(�D �	�@i%$HQ@:I A�"�@D�  aᄃ�	X �M4�D��q�8�
s���@@          KB :   Wi

 � � � � � � �0b�!��C�! �F"�@D1�CA $��D@DA@D1�A CA@ DA@ A"H8��䈀N A��� ���D���A� �DI A� ��BJ+!A�!��B� A�!  "A�#� H �t�	���$����F�h�� \a�8V ��cŁ "�  ;   +�		x�  � "�" "  �

@	"� \D� H#� � A��b�� b� F �5DA1�	#� H@i%C����V:A1DA\#A�$"bF�9q�%�@�� �D1��@� F FPA� � A@F� @A a@X �X �    <   W

i � � � \a8V ��cŁ��h��&,�@	 � 'N �@""��D	 ��NH�� ���JH�� �DH$ 
� A A� ���pPH��D � ' @8�D 11�QL0E@DA@	b�!�"D�0�a"  ��C@@#�� � #�0#� "�  =   +x		��X �F @A@8AAA"�Ta�$ �A� ��@"�!��CF0b��HG�\ A�D��V:��0DAAD@i%#�`�D�D ��e"P@��D a� H8A"� H�М �@��
" � �  � � � �         KO >   +�		x�  � "�" "  �

@	"� \D� H#� � A��b�� b� F �5DA1�	#� H@i%C����V:A1DA\#A�$"bF�9q�%�@�� �D1��@� F FPA� � A@F� @A a@X �X �         Blast ?   :N

� �#�<�#�<"���z��y��G A� ���!zD�#� �$@FD�2��"2��"Ȉ�A�G�2� P �< �� P@���0" "�@" ^y���A D "�H	�*D��U�@"$�DD� �p:�F@`H`��D#M4AX �0G+�
s���@@     @   :P

� � �<�#� �#�<D�C��C� �����=�CD"���"@F��$���$���2�(A AF��" R@�<�H@"� � ($P@"����D@D8(�D �	�@i%$HQ@:I A�"�@D�  aᄃ�	X �M4�D��q�8�
s���@@     A   :N

� �#�<�#�<"���z��y��G A� ���!zD�#� �$@FD�2��"2��"Ȉ�A�G�2� P �< �� P@���0" "�@" ^y���A D "�H	�*D��U�@"$�DD� �p:�F@`H`��D#M4AX �0G+�
s���@@     B   :P

� � �<�#� �#�<D�C��C� �����=�CD"���"@F��$���$���2�(A AF��" R@�<�H@"� � ($P@"����D@D8(�D �	�@i%$HQ@:I A�"�@D�  aᄃ�	X �M4�D��q�8�
s���@@                                                                                                                                       