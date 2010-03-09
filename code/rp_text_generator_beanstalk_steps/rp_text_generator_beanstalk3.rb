#  BEANSTALK STEPS  
#
# ✓. LOAD_PATH and REQUIRES 
# ✓. Modify the SETUP
# ✓. Find the Job and Load It        
# 4. Calculate Image Size 
# 5. Load Params & Size Once Each DRAW          
# 6. Set the TARGET Directory   

Dir.glob(File.join("vendor", "gems", "*", "lib")).each do |lib|
  $LOAD_PATH.unshift(File.expand_path(lib))
end

require 'beanstalk-client'
require 'yaml'

def setup
  size 200,200                                          
  @beanstalk = Beanstalk::Pool.new(['0.0.0.0:11300'])   
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
    :file_name => "default",                          
    :file_type => "png"                           
  }
  
  job = @beanstalk.reserve                        # <-- NEW
  values = defaults.merge(YAML.load(job.body))    # <-- NEW
  job.delete                                      # <-- NEW
  
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
  save @params[:file_name] + "." + @params[:file_type] 
  exit                                                 
end