class Item < Sprite
	attr_accessor :name,:detail
	def initialize(x,y,detail,key)
		#self.image = image
		#self.name = name
		self.x = x
		self.y = y
		self.detail = detail
		@key = key
		#self.dx = dx
		#self.dy = dy
	end
	
	#def update
	#	self.x +=Input.x * self.dx
#		self.y += Input.y * self.dy
	#	self.x = Window.width - self.image.width if self.x > (Window.width - self.image.width)
	#	self.x = 0 if self.x < 0
	#	self.y = Window.height - self.image.height if self.y > (Window.height - self.image.height)
	#	self.y = 0 if self.y < 0
	#	@dx = -@dx if self.x > (Window.width - self.image.width) || self.x < 0
	#end
	def kouka(player)
		#player.dx = 2	
	end
end
