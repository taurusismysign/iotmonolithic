RAILS_ENV  = "production"
require File.expand_path('../config/boot', __FILE__)
require File.expand_path('../config/environment', __FILE__)

require 'clockwork'

module Clockwork
  handler do |job|
    puts "Running #{job}"
  end

  every(15.minutes, 'Twitter.job'){
    execute_rake "tsync.rake", 'tsync'
  }


  def self.execute_rake(file,task)
    require 'rake'
    rake = Rake::Application.new
    Rake.application = rake
    Rake::Task.define_task(:environment)
    load "#{Rails.root}/lib/tasks/#{file}"
    rake[task].invoke
  end

end
