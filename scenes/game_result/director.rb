#encoding : shift_jis
require 'dxruby'
module Game_result
	@@bgm_path = "sounds/shinyday.wav"
	
  class Director
    def initialize
      @bg = Image.load("images/bg6.jpg")
      @timer = 0
      #@order = Dynamics.new()
      @choice = 0
      @font1 = Font.new(30)
      @font2 = Font.new(45,"HGSçsèëëÃ")
      @bgm = Sound.new @@bgm_path
      @bgm.loopCount = -1
      @bgm_played = false

    end

    def play
	play_bgm unless @bgm_played
        @timer -= 1
	if Input.keyPush? K_SPACE
		@timer = 0
	end
        if @timer <= 0
	        @timer = 5 * 60
		if $got_items[@choice] == nil
			@bgm.stop
        		@bgm.dispose
           		Scene.set_current_scene(:ending1)
		else
			@mozi = []
			@image2 = []
			@image = Image.load("images/picture/#{$got_items[@choice]}.jpg")
			f = open("textfile/#{$got_items[@choice]}.txt")
			f.each_with_index do |line,index| 
				if (index == 0)||(index == 1) 
					@image2 << line
				else
					@mozi << line
				end
			end
 		f.close
			#@correct = $got_items[@choice]
			
		@choice += 1
			
			#@order.change(@choice)
		end
        end
	Window.draw(0, 0, @bg)
        @mozi.each_with_index do |line, i|
		Window.drawFont(20,i*30+410, line, @font1,color:[0,30,0])
	end
	if $got_items[@choice-1] == "Ruby"
		Window.draw(543, 60, @image)
        else	
		Window.draw(50, 105, @image)
	end
        @image2.each_with_index do |line, i|
		Window.drawFont(15,15+45*i, line, @font2,color:[0,0,0])
	end
    end
    
    def play_bgm 
		@bgm.play
		@bgm_played = true
	end
  end
end
