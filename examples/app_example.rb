require_relative '../lib/simple_configuration'

class Application
  extend SimpleConfiguration

  config :root_path
  config :supported_formats, %i(json xml)
  config(:authentication) { |_| false }

end

class AdminApplication < Application

  root_path '/admin'
  supported_formats %i(html)
  authentication { |request| AdminAuthentication.(request) }

end

class ApiApplication < Application

  root_path '/'
  authentication { |request| request.headers[:api_key] = ENV['API_KEY'] }

end

class DashboardApplication < Application

  root_path '/dashboard'
  authentication { |_| true }

end
