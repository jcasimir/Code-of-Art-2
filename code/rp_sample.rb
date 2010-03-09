def setup
  @x_max = 100
  @y_max = 200
  size @x_max, @y_max
end

def draw
  background 255
  fill rand(255),rand(255),rand(255)
  oval 50,100,100, 50
  save "sample.png"
  exit
end