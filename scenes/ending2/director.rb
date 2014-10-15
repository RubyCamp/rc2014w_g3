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
      Window.drawFont(180, 100, "こうして", font)
      Window.drawFont(180, 200, "しまねっこの活躍があり", font)
      Window.drawFont(180, 300, "島根県は平和を取り戻した", font)
      font = Font.new(16)
      Window.drawFont(750, 580, "浜田市", font)
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
