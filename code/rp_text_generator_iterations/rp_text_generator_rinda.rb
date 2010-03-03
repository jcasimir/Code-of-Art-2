require 'rinda/ring'

class JobFinder
  include DRbUndumped
  
  def initialize
    DRb.start_service
    ring_server = Rinda::RingFinger.primary
    ring_server.write([:text_generator, :JobFinder,])
  end
  
  def find_job
    1000.times do |i|
      if i % 100 == 0
        warn "Waiting..."
      end
    end
    {:params => {:text => "Job Goes Here"}}
  end  
end

def setup
  @job_finder = JobFinder.new
  #size @params[:width], @params[:height]
  size 10, 100
end

def load_parameters(job)
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

  defaults.merge(job[:params])
end

def draw
  job = @job_finder.find_job
  params = load_parameters(job)
  background params[:background]
    
  translate params[:line_height] - 2, params[:height]
  rotate params[:rotation]
  
  fill params[:font_color]
  text_font params[:font]
  text params[:text], 0, 0
  
  save params[:file_name] + "." + params[:file_type]
  exit
end

