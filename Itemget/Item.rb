class Item < Sprite
	attr_accessor :name
	def initialize(x,y,image,name)
		self.image = image
		self.name = name
		self.x = x
		self.y = y
	end
end