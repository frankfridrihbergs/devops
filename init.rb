Redmine::Plugin.register :redmine_home_page_redirector do
  name 'Auto-login plugin'
  author 'Valdlens Antonovics'
  description 'When a user is signed-in. All links sends to login page.'
  version '0.0.5'

  require_dependency 'home_controller_path'
  require_dependency 'projects_controller_path'
  require_dependency 'search_controller_path'
  require_dependency 'members_controller_path'
  require_dependency 'wiki_controller_path'
  require_dependency 'my_controller_path'
  require_dependency 'issues_controller_path'
#  require_dependency 'account_controller_path' doesn't work
#  require_dependency 'calendars_controller_path'


if Gem::Version.new("3.0") > Gem::Version.new(Rails.version) then
  Dispatcher.to_prepare do
    WelcomeController.send(:include, HomePageRedirector::HomePageRedirector)
	ProjectsController.send(:include, HomePageRedirector::ProjectsControllerPath)
	SearchController.send(:include, HomePageRedirector::SearchControllerPath)
	MembersController.send(:include, HomePageRedirector::MembersControllerPath)
	WikiController.send(:include, HomePageRedirector::WikiControllerPath)
	MyController.send(:include, HomePageRedirector::MyControllerPath)
	IssuesController.send(:include, HomePageRedirector::IssuesControllerPath)
#	CalendarsController.send(:include, HomePageRedirector::CalendarsControllerPath)
#	AccountController.send(:include, HomePageRedirector::AccountControllerPath)
  end
else
  Rails.configuration.to_prepare do
    WelcomeController.send(:include, HomePageRedirector::HomePageRedirector)
	ProjectsController.send(:include, HomePageRedirector::ProjectsControllerPath)
	SearchController.send(:include, HomePageRedirector::SearchControllerPath)
	MembersController.send(:include, HomePageRedirector::MembersControllerPath)
	WikiController.send(:include, HomePageRedirector::WikiControllerPath)
	MyController.send(:include, HomePageRedirector::MyControllerPath)
	IssuesController.send(:include, HomePageRedirector::IssuesControllerPath)
#	CalendarsController.send(:include, HomePageRedirector::CalendarsControllerPath)
#	AccountController.send(:include, HomePageRedirector::AccountControllerPath)
  end
end
end