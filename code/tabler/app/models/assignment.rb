class Assignment < ActiveRecord::Base
  attr_accessible :name
  has_many :grades
  
  after_save :generate_header_image
  def generate_header_image
    bs = Beanstalk::Pool.new(['0.0.0.0:11300'])
    body = {:file_name => image_file_name, :text => self.name}.to_yaml
    bs.put(body)
  end
  
  def image_file_name
    "assignment_id_#{self.id}"
  end

  def image_path
    "generated/#{image_file_name}.png"
  end
end
