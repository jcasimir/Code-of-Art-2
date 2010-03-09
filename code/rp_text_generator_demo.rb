#  ACTUAL STEPS       ALGORITHM
#
# ✓. Superstructure   ✓. Superstructure
# ✓. Options          ✓. Options
# ✓. Create Window    ✓. Create Window
# 4. Write Text       4. Move Origin
# 5. Move Origin      5. Rotate Plane
# 6. Rotate Plane     6. Write Text
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
    :line_height => 8       # <-- NEW
  }
end

def draw
  background @params[:background]
  
end