class BuildAppWorker

  include Sidekiq::Worker
  
  #TODO: add a variable to indicate what template to build
  def perform(options)
    `cd public/hackathon-template && ionic emulate ios`
  end

end
