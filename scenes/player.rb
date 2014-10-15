require_relative 'item' 

class Player < Item
	attr_accessor :remove_kouka,:item_timer
	def initialize(*args)
		super
		self.name = "Shimanekko"
		self.image = Image.load("images/chara1.png")
		@item_timer = 0
	end
	def kouka(player)
	end
	def update
		#puts Window.fps
		#タイマーが0になったとき効果が消える
	#	@timer -= 1 if @timer > 0
	#	if @timer == 0
	#		@remove_kouka.call if @remove_kouka
	#	end
	end
	def move  
      self.x = @key.x+100 if (@key.x>-100)&&(@key.x<0)
      self.x = @key.x-600 if (@key.x>700)&&(@key.x<Window.width+600)
      self.y = 500+@key.y
    end
end
