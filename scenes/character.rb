class Character
  attr_accessor :x
  def initialize(x,y,key)
    @image = Image.load("images/chara1.png")
    @x, @y,@key = x, y,key
  end

  def move  
     @x = @key.x+100 if (@key.x>-100)&&(@key.x<0)
     @x = @key.x-600 if (@key.x>700)&&(@key.x<Window.width+600)
     @y = 500+@key.y
  end

  def draw
    Window.draw(@x, @y, @image)
  end
end