require_relative 'opening/director'
require_relative 'opening/slide'
require_relative 'opening/slide_proc'
require_relative 'game/director'
require_relative 'game2/director'
require_relative 'game3/director'
require_relative 'game4/director'
require_relative 'game_clear/director'
require_relative 'game_result/director'
require_relative 'ending1/director'
require_relative 'ending2/director'
require_relative 'ending3/director'
require_relative 'ending4/director'
require_relative 'ending5/director'

include Opening

slides = Director.class_eval { class_variable_get :@@slides }
Scene.add_scene(Director.new(slides),   :opening)
Scene.add_scene(Game::Director.new,  :game)
Scene.add_scene(Game2::Director.new,  :game2)
Scene.add_scene(Game3::Director.new,  :game3)
Scene.add_scene(Game4::Director.new,  :game4)
Scene.add_scene(Game_clear::Director.new,  :game_clear)
Scene.add_scene(Game_result::Director.new,  :game_result)
Scene.add_scene(Ending1::Director.new,  :ending1)
Scene.add_scene(Ending2::Director.new,  :ending2)
Scene.add_scene(Ending3::Director.new,  :ending3)
Scene.add_scene(Ending4::Director.new,  :ending4)
Scene.add_scene(Ending5::Director.new,  :ending5)

