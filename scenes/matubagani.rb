#coding:utf-8
require_relative 'item'
class Matubagani < Item
	def initialize(*args)
		super
		self.image = Image.load("images/Matubagani.png")
		self.name = "Matubagani"
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
