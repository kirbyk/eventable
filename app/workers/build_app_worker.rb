class BuildAppWorker

  include Sidekiq::Worker

  def perform(options)
    `cd public/hackathon-template && ionic emulate ios`
  end

end
