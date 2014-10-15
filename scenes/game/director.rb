require 'dxruby'
require_relative '../stage_module'
require_relative 'bg'
require_relative '../keybord_Input'
require_relative '../player'
require_relative '../item' 
require_relative '../enemy'
require_relative '../sijimi'
require_relative '../iwagaki'
require_relative '../matubagani'
require_relative '../hiougigai'
include StageModule
module Game
  @@bgm_path = "sounds/cx.wav"
	class Director
    def initialize
			#取得したアイテムを入れる配列
			$got_items = []
			toripy_image = Image.load("images/torip.png")
    	@@key = Keybord.new()
    	@bg = Background.new(0,0,@@key)
    	
			@toripys =[]
			#自キャラ、敵キャラ初期化
			@player = Player.new(100,400,"島根っこです",@@key)
			5.times {@toripys << Enemy.new(rand(300),rand(200),toripy_image,"sutaba")}

			#特産品を入れる配列	
			@tokusans = []
			#特産品を初期化
			
			@bgm = Sound.new @@bgm_path
  		@bgm.loopCount = -1
  		@bgm_played = false

			4.times { @tokusans << Sijimi.new(0,rand(600),"大和しじみ",@@key)}
			4.times { @tokusans << Iwagaki.new(0,rand(600),"いわがき",@@key)}
			4.times { @tokusans << Matubagani.new(0,rand(600),"マツバガニ",@@key)}
			4.times { @tokusans << Hiougigai.new(0,rand(600),"ひおうぎ貝",@@key)}
			@font = Font.new(16)
			#@titlefont = Font.new(50,"HGS行書体")
			@@font_exist = 200
			@@collision_timer = 0
			$item_timer = 0
			$item_name=nil
			$item_font = Font.new(14)
			$fukidashi = Image.load("images/fukidashi.png")
    end

    def play
			play_bgm unless @bgm_played
			show_title(@@font_exist,"稲佐の浜")
			#p @@font_exist
			@@font_exist -= 1
			@@key.move
    	@bg.move
      @bg.draw
      @player.move
      @player.draw
			Sprite.update(@toripys)
			Sprite.draw(@toripys)
			
			#描画と衝突処理
			zahyox = 100
		  @tokusans.each do |tokusan|
				tokusan.x = @bg.x + zahyox
				tokusan.draw
				collision_action(@player,tokusan)
				zahyox += 100
			end
			if @@collision_timer < 0
			  @toripys.each do |toripy|
			  	collision_enemy(@player,toripy)
			  end
			end
			if $item_timer > 0
				Window.draw(@player.x+60,@player.y-10,$fukidashi)
				Window.drawFont(@player.x+70,@player.y,$item_name,$item_font,color:[0,0,0])
				Window.drawFont(@player.x+70,@player.y+15,"をとったにゃん！",$item_font,color:[0,0,0])
				#@@key.@@Speed = 10
			end
			#次の画面へ遷移
	    if @@key.x  == Window.width+550
				@bgm.stop
        @bgm.dispose
        Scene.set_current_scene(:game2)
      end
			@@collision_timer -= 1
			$item_timer-=1
			#Window.draw_font(0,25,$got_items.inspect.to_s,@font)
			score_font = Font.new(36,"Gothic720")
			Window.draw_font(500,20,"ITEMS : " + $got_items.count.to_s,score_font)
    end
	  def play_bgm
			@bgm.play
			@bgm_played = true
		end	
		#敵と衝突したら
		def collision_enemy(player,enemy)
			if player === enemy
				$got_items.pop
				@@collision_timer = 60
			end
		end
  end
end
