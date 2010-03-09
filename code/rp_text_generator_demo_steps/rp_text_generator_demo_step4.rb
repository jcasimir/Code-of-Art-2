#  ACTUAL STEPS       ALGORITHM
#
# ✓. Superstructure   ✓. Superstructure
# ✓. Options          ✓. Options
# ✓. Create Window    ✓. Create Window
# ✓. Write Text       4. Move Origin
# 5. Move Origin      5. Rotate Plane
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
    :line_height => 8,                            # <-- NEW
    :font => load_font("fonts/Silkscreen-8.vlw"), # <-- NEW
    :font_color => 0,                             # <-- NEW
    :text => "default text"                       # <-- NEW
  }
end

def draw
  background @params[:background]
  
  # Write Text
  fill @params[:font_color]                       # <-- NEW
  text_font @params[:font]                        # <-- NEW
  text @params[:text], 0, 10                      # <-- NEW
end