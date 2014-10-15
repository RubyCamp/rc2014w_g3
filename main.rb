# encoding : UTF-8
require 'dxruby'

require_relative 'scene'
require_relative 'scenes/load_scenes'
#require_relative 'player.rb'


Window.caption = "しんげきのすたぁば"
Window.width   = 800
Window.height  = 600

=begin
s = Sound.new "sounds/n29.wav"
s.loopCount = -1
s.play
=end

Scene.set_current_scene(:opening)

Window.loop do
  break if Input.keyPush?(K_ESCAPE) # ESCキーでWindowを消去

  Scene.play_scene
  #Player_class.loop
end
