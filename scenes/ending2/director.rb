#coding:shift_jis

module Ending2
  class Director
    @@bgm_path = "sounds/shinyday.wav"
  
    def initialize
      @bg_img = Image.load("images/densya.jpg")
      @timer = 4 * 60
      
      @bgm = Sound.new @@bgm_path
      @bgm.loopCount = -1
      @bgm_played = false
    end

    def play
      play_bgm unless @bgm_played
      
      Window.draw(0, 0, @bg_img)
      font = Font.new(40)
      Window.drawFont(180, 100, "��������", font)
      Window.drawFont(180, 200, "���܂˂����̊��􂪂���", font)
      Window.drawFont(180, 300, "�������͕��a�����߂���", font)
      font = Font.new(16)
      Window.drawFont(750, 580, "�l�c�s", font)
      @timer -= 1
      if @timer <= 0
        @bgm.stop
        @bgm.dispose
        Scene.set_current_scene(:ending3)
      end
    end
    
    def play_bgm
      @bgm.play
      @bgm_played = true
    end
  end
end
