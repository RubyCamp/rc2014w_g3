require_relative 'opening_loader'

module BenrixRuby
	STANDARD_FONT = Font.new 60
	MINI_FONT = Font.new 40
	
	def bg_set r, g, b
		bgcolor = Image.new Window.width, Window.height, color = [ 255, r, g, b ] unless @bgcolor
		Window.draw 0, 0, bgcolor
	end
	
	def sound_play filename
		@s = Sound.new filename
		@s.loopCount = -1
		@s.play
	end
	 
	module Effects
		
		def blink frame, &block
			# module_evalを用いてOpeningからクラス変数をget
			elapsed_frame = Opening.module_eval { class_variable_get :@@elapsed_frame }
			if (elapsed_frame / frame) % 2 == 0
				block.call
			end
		end
		
=begin
		module Transitions
			def left_slide_in from, to, second = 1
				(second * 60).times do |i|
					move = ( Window.width.to_f / (second * 60) ) * i # 動く幅
					#Window.draw 0 - move, 0, from
					#Window.draw Window.width - move, 0, to
					sleep( 1.0 / 60 )
				end
			end
		end
		
		include Transitions
=end
	end
	
	module Backgrounds # 0: OK, 
		def circle_chaos color, volume = 5, _radius = 5..15
			volume.times do
				radius = _radius.class == Range ? rand(_radius.last) + _radius.first : _radius
				cir = Image.new(radius * 2, radius * 2)
											.circleFill( radius, radius, radius, color )
				Window.draw rand(Window.width), rand(Window.height), cir
			end
		end
	end
	
	include Effects
	include Backgrounds
	
end