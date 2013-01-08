
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :youtube, YOUTUBE_KEY, YOUTUBE_SECRET, { access_type: 'online', approval_prompt: ''}
end

OmniAuth.config.on_failure do |env|
  exception = env['omniauth.error']
  error_type = env['omniauth.error.type']
  strategy = env['omniauth.error.strategy']
 
  Rails.logger.error("OmniAuth Error (#{error_type}): #{exception.inspect}")
    #ErrorNotifier.exception(exception, :strategy => strategy.inspect, :error_type => error_type)
 
  new_path = "#{env['SCRIPT_NAME']}#{OmniAuth.config.path_prefix}/failure?message=#{error_type}"
 
  [301, {'Location' => new_path, 'Content-Type'=> 'text/html'}, []]
end