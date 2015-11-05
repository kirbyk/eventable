class BuildAppWorker

  include Sidekiq::Worker
  
  #TODO: add a variable to indicate what template to build
  def perform(options)
    
    puts "starting app for #{options["event_type"]}"

    Rake::Task['build_app:set_event_id'].reenable
    Rake::Task['build_app:set_event_id'].invoke(options["event_id"])

    case options["event_type"]
    when "Wedding"
      `cd public/wedding-template && ionic emulate ios`
    when "Hackathon"
      `cd public/hackathon-template && ionic emulate ios`
    when "Conference"
      `cd public/conference-template && ionic emulate ios`
    end
  end

end
