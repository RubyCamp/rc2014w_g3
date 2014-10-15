class Keybord
  @@Speed = 5
  attr_accessor :x
  attr_accessor :y
  def initialize ()
      @x = 0
      @y = 0
  end
  def move
       
      @x += Input.x*@@Speed
      @y += Input.y*@@Speed
      @x = -100 if @x < -100
      @x = Window.width+550 if @x > Window.width+550
      @y = -500 if @y < -500
      @y = Window.height-575 if @y > Window.height-575
  end
end
