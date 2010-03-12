load_library "video"
import "processing.video" 

def setup
  size 640, 480
  
  @video = Capture.new(self, width, height, 30)
  @params = load_parameters
end

def load_parameters
  defaults = {
    :background => 255,
    :line_height => 8,
    :character_width => 5,
    :font => load_font("fonts/Silkscreen-8.vlw"),
    :font_color => 255,
    :text => "Secret Property of Mountain West Ruby Conf"
  }
  
  values = defaults
  
  values[:length] = ((values[:text].length + 1)* values[:character_width] * 1.1).to_i
  values
end

def draw
  @video.read if @video.available
  image @video, 0, 0
  
  # Bar
  fill 0
  rect_mode CORNER
  rect 0, height - (@params[:line_height] * 3), width, height
    
  fill @params[:font_color]
  text_font @params[:font]
  text @params[:text], (width - @params[:length]), (height - @params[:line_height])
end
