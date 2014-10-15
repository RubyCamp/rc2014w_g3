module Ending1
  class Shimanekko < Sprite
    def initialize(x, y, image = nil)
      image = Image.load("images/shimanekko!!.png")
      image.set_color_key([0, 0, 0])
      super
      @dx = 1
    end

    def update
      self.x += @dx
      @dx = -@dx if self.x > (Window.width - self.image.width) || self.x < 0
      self.y += Math.sin(self.x / 10) * 5
    end

    def hit(obj)
      @dx = -@dx
    end
  end
end
