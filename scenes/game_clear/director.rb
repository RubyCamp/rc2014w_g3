#coding:shift_jis

module Game_clear
  class Director
    @@bgm_path = "sounds/shinyday.wav"
  
    def initialize
      @bg_img = Image.load("images/__3.jpg")
      @timer = 4 * 60
      
      @bgm = Sound.new @@bgm_path
      @bgm.loopCount = -1
      @bgm_played = false
    end

    def play
      play_bgm unless @bgm_played
      
      Window.draw(0, 0, @bg_img)
      image = Image.load('images/shimanekko!!!.png')
      Window.draw(30, 260, image)
      font = Font.new(64)
      Window.drawFont(200, 150, "ゲームクリア☆", font, color:[255, 0, 0])
      font = Font.new(40)
      Window.drawFont(200, 300, "どんなアイテムが集まったかな？", font)
      Window.drawFont(200, 400, "確認してみよう！", font)
      font = Font.new(16)
      Window.drawFont(700, 580, "知夫村　赤壁", font)
      @timer -= 1
      if @timer <= 0
        @bgm.stop
        @bgm.dispose
        Scene.set_current_scene(:game_result)
      end
    end
    
    def play_bgm
      @bgm.play
      @bgm_played = true
    end
  end
end
