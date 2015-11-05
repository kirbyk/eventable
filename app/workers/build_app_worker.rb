class BuildAppWorker

  include Sidekiq::Worker
  
  #TODO: add a variable to indicate what template to build
  def perform(options)
    
    puts "starting app for #{options["event"].type}"

    Rake::Task['build_app:set_event_id'].invoke(options["event"].id)

    case options["event"].type
    when "Wedding"
      `cd public/wedding-template && ionic emulate ios`
    when "Hackathon"
      `cd public/hackathon-template && ionic emulate ios`
    when "Conference"
      `cd public/conference-template && ionic emulate ios`
    end
  end

end
