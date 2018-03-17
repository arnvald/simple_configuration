class Application

  def root_path
    raise NotImplementedError
  end

  def supported_formats
    %i(json xml)
  end

  def authentication(_)
    false
  end

end

class AdminApplication < Application

  def root_path
    '/admin'
  end

  def supported_formats
    %i(html)
  end

  def authentication(request)
    AdminAuthentication.(request)
  end

end

class ApiApplication < Application

  def root_path
    '/'
  end

  def authentication(request)
    request.headers[:api_key] = ENV['API_KEY']
  end

end

class DashboardApplication < Application

  def root_path
    '/dashboard'
  end

  def authentication(_)
    true
  end

end

