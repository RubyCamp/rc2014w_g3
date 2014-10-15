require_relative 'module_opening'

module Opening

	@@slides = []

	@bg_img1 = Image.load("images/20050903123948.jpg")
	@bg_img2 = Image.load("images/pb05_2.png")
	@bg_img3 = Image.load("images/00260_2.png")
	@bg_img4 = Image.load("images/toripi.png")
	# スライド定義

	@@slides[0] = Opening::Slide.new 10, K_SPACE, 1 do # OK

		team3_height = 30
		team3_str = "TEAM3"
		
		bg_set 255, 255, 255
		Backgrounds::circle_chaos [255,0,112,74], 16, 15
		
		logo_stb = Image.load 'images/opening/shigeki_stb.png'
		Window.draw (Window.width / 2 - logo_stb.width / 2), (Window.height / 2 - logo_stb.height / 2), logo_stb
		
		Font.install SPACE_FONT_FILE
		
		team3 = Font.new team3_height, SPACE_FONT_NAME
		team3_width = team3.getWidth team3_str
		Window.drawFontEx (Window.width - team3_width - 30) , 30, team3_str, team3, color: [ 20, 20, 20 ]
		 
		
	  str = "PUSH SPACE KEY"
		push_space = Font.new 45, "Gears Of Peace", weight: true
	  psx = push_space.getWidth str
	  
	  # 文字背景
	  str_bg = Image.new Window.width, push_space.size + 10, color = [ 230, 0, 112, 74 ]
	  Window.draw 0, (Window.height - push_space.size * 2 - 50), str_bg
	  
		Effects::blink 10 do
			Window.drawFontEx (Window.width / 2 - psx / 2), (Window.height - push_space.size * 2 - 50) + 5, str, push_space, color: [255,255,255]
		end

	end

	@@slides[0].set_once_action do
		#puts 'AAAAAAAAA'
		#sound_play "sounds/n29.wav"
		#puts 'BBBBBBBBB'
		
	end
	
	@@slides[1] = Opening::Slide.new 6, K_SPACE, 2 do # X
		str_height = 50
		strs_top_margin = 300
		shima = Font.new str_height
	    
	  stb_ma2e = Image.load 'images/opening/stb_ma2e_bigbig.jpg'
		Window.draw 0, -50, stb_ma2e
	  
	  # 文字をまとめる
	  str = "島根には"
	  str2 = "ス○バがあります。"
	  psx = shima.getWidth str2
	  
	  str_bg = Image.new psx + 25, str_height * 2 + 50, color = [ 200, 79, 76, 18 ]
	  Window.draw 0, strs_top_margin - 25, str_bg
	  
	  Window.drawFontEx 20, strs_top_margin, str, shima, color: [255,255,255]
	  Window.drawFontEx 20, strs_top_margin + 10 + 50, str2, shima, color: [255,255,255]
	
	  neko = Image.load 'images/opening/neko_medium.png'
		Window.draw (Window.width - neko.width * 1.5), (Window.height / 2), neko
	end
	
	@@slides[2] = Opening::Slide.new 3, K_SPACE, 3 do
	  bg_set 20, 20, 20
	
	  str = "だが鳥取は..."
	  ippoux = STANDARD_FONT.getWidth str
	  Window.drawFontEx (Window.width / 2 - ippoux / 2), (Window.height / 2 - STANDARD_FONT.size / 2), str, STANDARD_FONT
	end

	@@slides[3] = Opening::Slide.new 3, K_SPACE, 4 do
	  Window.draw(0, 0, @bg_img1)
	  Window.drawFont(230, 100, "鳥取にも", STANDARD_FONT, color: [0,0,0])
	  Window.drawFont(230, 200, "ス○バがほしい", STANDARD_FONT, color: [0,0,0] )
	end
	
	@@slides[4] = Opening::Slide.new 3, K_SPACE, 5 do
		bg_set 0, 255, 0
	  Window.draw(0, 400, @bg_img2)
	  Window.draw(650, 300, @bg_img4)
	  Window.drawFont(200, 200, "トリPがせめて", STANDARD_FONT)
	  Window.drawFont(450, 300, "きた！", STANDARD_FONT)
	end

	@@slides[5] = Opening::Slide.new 3, K_SPACE, 6 do
	  bg_set 255, 0, 0
	  Window.draw(100, 50, @bg_img3)
	  Window.drawFont(250, 220, "トリPから", STANDARD_FONT, color: [0,0,0])
	  Window.drawFont(300, 300, "逃げろ！！", STANDARD_FONT, color: [0,0,0])
	end
	
	@@slides[6] = Opening::Slide.new ENDLESS, K_RETURN, "NEXT" do
		bg_set 0, 0, 0
		
		Backgrounds::circle_chaos [100,0,112,74], 5, 15
		
		str2 = "ゲームが始まります"
		Effects::blink 30 do
			Window.drawFontEx (Window.width / 2 - MINI_FONT.getWidth(str2) / 2),
												(Window.height / 2 - 100),
												str2, MINI_FONT, color: [255,255,255]
		end
		#Font.install SPACE_FONT_FILE
		#fnt = Font.new 60, SPACE_FONT_NAME
		str = "ENTERキーでスタート"
		Window.drawFontEx (Window.width / 2 - STANDARD_FONT.getWidth(str) / 2),
											(Window.height / 2 - STANDARD_FONT.size / 2),
											str, STANDARD_FONT,
											{color: [255,255,255],
											shadow: true,
											shadow_color: [255,255,255],
											shadow_x: 0, shadow_y: 0}
	end
	
end