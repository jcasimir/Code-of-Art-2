def setup
  @params = load_parameters
  size @params[:width], @params[:height]
end

def load_parameters
  default_text = "Week 6 Quiz"
  default_file_name = "output"
  default_file_type = "png"
  default_font = load_font "fonts/Silkscreen-8.vlw"
  default_font_size = 8
  default_line_height = default_font_size
  default_font_color = 0
  default_rotation = radians -90
  default_background = 255
  default_character_width = 5
  default_character_height = 3

  default_x_max = default_character_height + 4
  default_y_max = default_text.length * default_character_width

  
  params = {
    :text => "Week 6 Quiz",
    :height => default_y_max,
    :width => default_x_max,
    :font_size => default_font_size,
    :file_type => default_file_type,
    :line_height => default_line_height,
    :rotation => default_rotation,
    :font => default_font,
    :file_name => default_file_name,
    :background => default_background,
    :font_color => default_font_color
  }
end

def draw
    # Set the background and text colors
    background @params[:background]
    
    # Move the origin and rotate the plane
    translate @params[:line_height] -2, @params[:height]
    rotate @params[:rotation]

    #text_align LEFT
    fill @params[:font_color]
    text_font @params[:font]
    text @params[:text], 0, 0

    save @params[:file_name] + "." + @params[:file_type]
    exit
end