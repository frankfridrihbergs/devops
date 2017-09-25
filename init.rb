Redmine::Plugin.register :auto_login do
  name 'Auto_login'
  author 'Vladlens Antonovics'
  description 'Auto Log in'
  version '0.0.1'

   require_dependency 'auto_login'
  
  if Gem::Version.new("3.0") > Gem::Version.new(Rails.version) then
    Dispatcher.to_prepare do
      WelcomeController.send(:include, AutoLoginRedirector::AutoLoginRedirector)
    end
  else
    Rails.configuration.to_prepare do 
      WelcomeController.send(:include, AutoLoginRedirector::AutoLoginRedirector)
    end
  end
end
