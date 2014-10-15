require 'dxruby'
require_relative 'item'
require_relative 'director'
director = Director.new
Window.loop do
	director.play
end