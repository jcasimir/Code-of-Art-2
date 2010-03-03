Dir.glob(File.join("vendor", "gems", "*", "lib")).each do |lib|
  $LOAD_PATH.unshift(File.expand_path(lib))
end

require 'beanstalk-client'
require 'yaml'

TARGET_DIR = "./tabler/public/images/generated/"

def setup
  size 200,200
  @beanstalk = Beanstalk::Pool.new(['0.0.0.0:11300']) 
end

def load_parameters()
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

  job = @beanstalk.reserve
  values = defaults.merge(YAML.load(job.body))
  job.delete
  
  values[:width] = values[:line_height]
  values[:height] = ((values[:text].length + 1) * values[:character_width] * 1.1).to_i
  values
end

def draw
  @params = load_parameters  
  size @params[:width], @params[:height]
  background @params[:background]
    
  translate @params[:line_height] - 2, @params[:height]
  rotate @params[:rotation]
  
  fill @params[:font_color]
  text_font @params[:font]
  text @params[:text], 0, 0
  
  save TARGET_DIR + @params[:file_name] + "." + @params[:file_type]
end

