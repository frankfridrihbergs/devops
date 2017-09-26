Redmine::Plugin.register :redmine_home_page_redirector do
  name 'Auto-login plugin'
  author 'Valdlens Antonovics'
  description 'When a user is signed-in. All links sends to login page.'
  version '0.0.2'

  require_dependency 'home_page_redirector'
  require_dependency 'issues_controller_patch'
  require_dependency 'projects_controller_patch'
  require_dependency 'search_controller_patch'
  

if Gem::Version.new("3.0") > Gem::Version.new(Rails.version) then
  Dispatcher.to_prepare do 
    WelcomeController.send(:include, HomePageRedirector::HomePageRedirector)
	IssuesController.send(:include, HomePageRedirector::IssuesControllerPatch)
	ProjectsController.send(:include, HomePageRedirector::ProjectsControllerPatch)
	SearchController.send(:include, HomePageRedirector::SearchControllerPatch)
  end
else
  Rails.configuration.to_prepare do
    WelcomeController.send(:include, HomePageRedirector::HomePageRedirector)
	IssuesController.send(:include, HomePageRedirector::IssuesControllerPatch)
	ProjectsController.send(:include, HomePageRedirector::ProjectsControllerPatch)
	SearchController.send(:include, HomePageRedirector::SearchControllerPatch)
  end
end

end