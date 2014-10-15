#coding:shift_jis

module Ending4
  class Director
    @@bgm_path = "sounds/shinyday.wav"
    
    def initialize
      @bg_img = Image.new(800,600,color=[0,0,0])
      @timer = 2 * 60
      
      @bgm = Sound.new @@bgm_path
      @bgm.loopCount = -1
      @bgm_played = false
    end

    def play
      play_bgm unless @bgm_played
      
      Window.draw(0, 0, @bg_img)
      image = Image.load('images/neko.png')
      Window.draw(700, 340, image)
      font = Font.new(96)
      Window.drawFont(150, 300, ". . . のか！？", font)
      @timer -= 1
      if @timer <= 0
        @bgm.stop
        @bgm.dispose
        Scene.set_current_scene(:ending5)
      end
    end

    def play_bgm
      @bgm.play
      @bgm_played = true
    end
  end
end
