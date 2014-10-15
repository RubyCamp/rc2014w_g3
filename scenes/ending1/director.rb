#coding:shift_jis

require_relative 'sprite_shimanekko.rb'

module Ending1
  @@bgm_path = "sounds/shinyday.wav"
  
  class Director
    def initialize
      @char = Shimanekko.new(rand(250), rand(50) + 100)
      @bg_img = Image.load("images/_________b_v___i_____j.jpg")
      @timer = 7 * 60
      
      @bgm = Sound.new @@bgm_path
      @bgm.loopCount = -1
      @bgm_played = false
    end

    def play
      play_bgm unless @bgm_played
      
      Window.draw(0, 0, @bg_img)
      Sprite.update(@char)
      Sprite.draw(@char)
      #Sprite.check(@chars, @chars)
      font = Font.new(52)
      Window.drawFont(150, 440, "おめでとう！やったね♪", font)
      font = Font.new(16)
      Window.drawFont(750, 580, "安来市", font)
      @timer -= 1
      
      if @timer <= 0
        @bgm.stop
        @bgm.dispose
        Scene.set_current_scene(:ending2)
      end
    end
    
    def play_bgm
      @bgm.play
      @bgm_played = true
    end
  end
end
