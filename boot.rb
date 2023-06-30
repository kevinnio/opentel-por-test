require "bundler/setup"
Bundler.require(:default)

OpenTelemetry::SDK.configure do |c|
  c.service_name = 'opentel-por-test'
  c.use 'OpenTelemetry::Instrumentation::HttpClient'
  # c.use 'OpenTelemetry::Instrumentation::Sidekiq'
end

require_relative "my_job"
MyJob.perform_async
