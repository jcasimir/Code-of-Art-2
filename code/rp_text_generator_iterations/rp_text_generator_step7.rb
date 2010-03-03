def setup
  @params = load_parameters
  size @params[:width], @params[:height]
end

def load_parameters
  defaults = {
    :width => 100,
    :height => 100,
    :background => 255,
    :line_height => 8,
    :rotation => radians(-90),
    :font => load_font("fonts/Silkscreen-8.vlw"),
    :font_color => 0,
    :text => "default text",
    :file_name => "default",
    :file_type => "png"
  }
end

def draw
  background @params[:background]
    
  translate @params[:line_height] -2, @params[:height]
  rotate @params[:rotation]
  
  fill @params[:font_color]
  text_font @params[:font]
  text @params[:text], 0, 0
  
  save @params[:file_name] + "." + @params[:file_type]
  exit
end