module Game3
	class Background
		attr_accessor :x
		def initialize(x,y,key)
			@image = Image.load("images/bg3.jpg")
			@x, @y,@key = x, y,key
		end

		def move

			@x = -@key.x if @key.x>0&&@key.x<700
	end

		def draw
			Window.draw(@x, @y, @image)
		end
	end
end
