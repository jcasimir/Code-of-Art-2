#  ACTUAL STEPS       ALGORITHM
#
# ✓. Superstructure   ✓. Superstructure
# ✓. Options          ✓. Options
# ✓. Create Window    ✓. Create Window
# ✓. Write Text       ✓. Move Origin
# ✓. Move Origin      5. Rotate Plane
# 6. Rotate Plane     ✓. Write Text
# 7. Save File        7. Save File

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
    :text => "default text"                       
  }
end

def draw
  background @params[:background]
  
  # Move the Origin
  translate @params[:line_height] -2, @params[:height]  # <-- NEW
  
  # Write Text
  fill @params[:font_color]                       
  text_font @params[:font]
  text @params[:text], 0, 0                             # <-- MODIFIED
end