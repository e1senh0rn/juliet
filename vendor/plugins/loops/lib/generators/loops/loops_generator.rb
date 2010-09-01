require 'rails/generators'

class LoopsGenerator < Rails::Generators::Base
  
  def self.source_root
    File.join(File.dirname(__FILE__), 'templates')
  end
  
  def install_basic_samples
    # m.directory 'app'
    # m.directory 'app/loops'
    copy_file      'app/loops/APP_README',     'app/loops/README'
    copy_file      'app/loops/simple_loop.rb', 'app/loops/simple_loop.rb'
    copy_file      'app/loops/queue_loop.rb',  'app/loops/queue_loop.rb'
  end
  
  def install_script
    copy_file      'script/loops',             'script/loops'
  end
  
  def install_config
    copy_file      'config/loops.yml',         'config/loops.yml'
  end
  
protected

  def banner
    "Usage: #{$0} loops"
  end

end
