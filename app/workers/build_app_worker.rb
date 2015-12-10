class BuildAppWorker
  include Sidekiq::Worker
  
  #TODO: add a variable to indicate what template to build
  def perform(options)
    puts "starting app for #{options["event_type"]}"

    Rake::Task['build_app:set_event_id_and_name'].reenable
    Rake::Task['build_app:set_event_id_and_name'].invoke(options["event_id"], options["event_name"])

    rtn = case options["event_type"]
    when "Wedding"
      `cd public/wedding-template && ionic upload`
    when "Hackathon"
      `cd public/hackathon-template && ionic upload`
    when "Conference"
      `cd public/conference-template && ionic upload`
    end

    @event = Event.find(options["event_id"])
    @event.ionic_id = rtn.match(/\(.+\)/).to_s[1..-2]
    @event.save
  end
end
