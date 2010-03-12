#  ACTUAL STEPS       ALGORITHM
#
# ✓. Superstructure   ✓. Superstructure
# ✓. Options          ✓. Options
# ✓. Create Window    ✓. Create Window
# ✓. Write Text       ✓. Move Origin
# ✓. Move Origin      ✓. Rotate Plane
# ✓. Rotate Plane     ✓. Write Text
# ✓. Save File        ✓. Save File

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
    :font => load_font("fonts/Silkscreen-8.vlw"), 
    :font_color => 0,                             
    :text => "default text",
    :rotation => radians(-90),
    :file_name => "default",                          # <-- NEW
    :file_type => "png"                               # <-- NEW
  }
end

def draw
  background @params[:background]
  
  # Move the Origin & Rotate
  translate @params[:line_height] -2, @params[:height]  
  rotate @params[:rotation]                           
  
  # Write Text
  fill @params[:font_color]                       
  text_font @params[:font]
  text @params[:text], 0, 0
  
  # Save the File & Exit
  save @params[:file_name] + "." + @params[:file_type] # <-- NEW
  exit                                                 # <-- NEW
end