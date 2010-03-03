def setup
  @params = load_parameters
  size @params[:width], @params[:height]
end

def load_parameters
  defaults = {
    :width => 100,
    :height => 100,
    :background => 255,
    :line_height => 8
  }
end

def draw
  background @params[:background]
  
  translate @params[:line_height] -2, @params[:height]
end