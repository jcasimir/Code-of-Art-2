require 'rinda/ring'

def setup
  @params = load_parameters
  size @params[:width], @params[:height]
end

def load_parameters
  defaults = {
    :background => 255,
    :line_height => 8,
    :character_width => 5,
    :rotation => radians(-90),
    :font => load_font("fonts/Silkscreen-8.vlw"),
    :font_color => 0,
    :text => "default text",
    :file_name => "default",
    :file_type => "png"
  }
  
  defaults[:width] = defaults[:line_height]
  defaults[:height] = (defaults[:text].length + 1) * defaults[:character_width]
  defaults
end

def draw
  background @params[:background]
    
  translate @params[:line_height] - 2, @params[:height]
  rotate @params[:rotation]
  
  fill @params[:font_color]
  text_font @params[:font]
  text @params[:text], 0, 0
  
  save @params[:file_name] + "." + @params[:file_type]
  exit
end