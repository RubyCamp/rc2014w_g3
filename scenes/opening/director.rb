require_relative 'slide'
require_relative 'module_opening'
require_relative 'dxruby_benri'

module Opening
  @@elapsed_frame = 0
  @@bgm_path = "sounds/n29.wav"
  
  include BenrixRuby
  
  class Director

    def initialize slides_arr
      
      @timer = 0
      # Slideの取得
      @@slides = slides_arr
      
      # フレーム計算
      @slide_frames = @@slides.collect { |slide| slide.second * FPS }
      @all_prev_slide_frames = []
      @slide_frames.each_with_index do |frames, index|
        if index == 0
          @all_prev_slide_frames[0] = frames
          next
        end
        @all_prev_slide_frames[index] = @slide_frames[0..index].inject :+ # (( array[0] + array[1] ) + array[2] ) + arr...
      end
      print "ALL_PREVIOUS_SLIDE_FRAMES: "
      pp @all_prev_slide_frames
      @scene_frame = @all_prev_slide_frames.last
      
      @@slides.each_with_index do |slide, number|
        self.class.send :define_method, "slide#{number}" do
          @@slides[number].action
          if @@slides[number].key && Input.keyPush?(@@slides[number].key)
            puts "PUSHED! GOTO:#{@@slides[number].to}"
            puts @timer
            jump_to @@slides[number].to
          end
        end
        puts 'CLASS: ' + slide.class.to_s
      end
#     if @@slides[0].instance_variable_get :@once_block
#         @@slides[0].once_action
#     end
      jump_to 0
      puts methods.grep(/^scene/)
      @bgm = Sound.new @@bgm_path
      @bgm.loopCount = -1
      @bgm_played = false
      
      @stoped_time = false
    end

    def play
      play_bgm unless @bgm_played
      
      #Window.draw 0, 0, @bgcolor if @bgcolor
      
      @all_prev_slide_frames.each_with_index do |frame, slide_number|
        if @timer < frame
          @@elapsed_frame = @timer - @all_prev_slide_frames[slide_number - 1]
          self.send "slide#{slide_number}"
          break
        end
      end
      
      if @timer < @scene_frame
        @timer += 1 unless @stoped_time
      else
        puts "BGM STOP and DISPOSE"
        @bgm.stop # BGMをストップ
        @bgm.dispose
        Scene.set_current_scene(:game)
      end
      puts @timer
    end
    
    def jump_to slide
      puts slide
      current_slide = 0
      @timer = case slide
                when "NEXT"
                  @all_prev_slide_frames.each_with_index do |frame, slide_number|
                    if @timer < frame
                      current_slide = slide_number
                    end
                  end
                @all_prev_slide_frames.last
                
                when 0
                  0
                
                else
                  @all_prev_slide_frames[slide.to_i - 1]
               end
      #stop_time { Effects::Transitions.left_slide_in @@slides[current_slide], @@slides[slide] }
      
      #@s.stop if @s
      #@timer = slide == "NEXT" ? @all_prev_slide_frames.last : @all_prev_slide_frames[slide.to_i - 1]
      return if slide == "NEXT"
      if @@slides[slide].instance_variable_get :@once_block
        @@slides[slide].once_action
      end
      #self.send "slide#{number}"
    end
    
    def play_bgm
      @bgm.play
      @bgm_played = true
    end
    
    def stop_time &block
      @stoped_time = true
      block.call
      @stoped_time = false
    end
    
    #def current_slide
  end
end