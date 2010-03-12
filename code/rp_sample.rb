def setup
  @x_max = 200
  @y_max = 400
  size @x_max, @y_max
end

def draw
  background 255
  fill rand(255),rand(255),rand(255)
  oval 100,200,200, 200
  #save "sample2.png"
  #exit
end