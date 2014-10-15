class Enemy < Sprite
	attr_accessor :name,:comment
	def initialize(x,y,image,comment)
		self.image = image
		self.x = x
		self.y = y
		self.comment = comment
		super
		@dx,@dy = 1,1
	end
	def update
		self.x +=(rand(10) + 1) * @dx
		self.y +=(rand(4) + 1) * @dy
		@dx = -@dx if self.x > (Window.width - self.image.width) || self.x < 0
		@dy = -@dy if self.y > (Window.height - self.image.height) || self.y < 0
	end
end
