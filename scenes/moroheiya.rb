require_relative 'item'
class Moroheiya < Item
	def initialize(*args)
		super
		self.name = "Moroheiya"
		self.image = Image.load("images/moroheiya.png")
	end
	def kouka(player)
		player.dx = 10
		player.timer = 6 * 60
		player.remove_kouka = Proc.new{
			#removeしたい処理
			player.dx = 1
		}
	end
end
