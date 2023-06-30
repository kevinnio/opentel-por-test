require "sidekiq/job"
require "httpclient"

class MyJob
  include Sidekiq::Job

  def perform
    conn = HTTPClient.new
    logger.info conn.get("https://api.sampleapis.com/beers/ale")

    MyJob.perform_in Time.now+5*60 # 5 seconds later
  end
end
