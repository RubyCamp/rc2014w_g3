class Director
	def initialize
		@items=[]
		
		image = Image.new(100,100,C_WHITE)
		moroheiya_image = Image.load("images/moroheiya.png")
		shimanekko_image = Image.load("images/shimanekko.jpg")
		asukko_image = Image.load("images/asukko.jpg")
		
		@s = Item.new(100,100,asukko_image,"asukko")
		@m = Item.new(0,0,shimanekko_image,"shimanekko")
		@n = Item.new(50,50,moroheiya_image,"Moroheiya")

		@font = Font.new(32)
		@score = 0
	end

	def play
		@m.x,@m.y = Input.mouse_pos_x, Input.mouse_pos_y

		@s.draw
		@m.draw
		@n.draw

		if @m === @s
			Window.draw_font(0,0,"hit!",@font)
			@items << @s.name
			@s.x = -400
			@s.y = -400
		end
		if @m === @n
			Window.draw_font(0,0,"hit!",@font)
			@items << @n.name
			@n.x = -400
			@n.y = -400
		end
		Window.draw_font(0,25,@items.inspect.to_s,@font)
		if @items.count == 2
			Window.draw_font(0,0,"Clear!",@font)
		end
	end
end