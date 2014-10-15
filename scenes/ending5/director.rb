#coding:shift_jis

module Ending5
  class Director
    @@bgm_path = "sounds/shinyday.wav"

    def initialize
      @bg_img = Image.load("images/1030.jpg")
      @timer = 4 * 60
      
      @bgm = Sound.new @@bgm_path
      @bgm.loopCount = -1
      @bgm_played = false
    end

    def play
      play_bgm unless @bgm_played
      
      Window.draw(0, 0, @bg_img)
      font = Font.new(64)
      Window.drawFont(300, 260, "E N D", font)
      font = Font.new(16)
      Window.drawFont(750, 580, "宍道湖", font)
      @timer -= 1
      if @timer <= 0
        @bgm.stop
        @bgm.dispose
        exit
      end
    end
    
    def play_bgm
      @bgm.play
      @bgm_played = true
    end
  end
end
