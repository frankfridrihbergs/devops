Redmine::Plugin.register :redmine_home_page_redirector do
  name 'Auto-login plugin'
  author 'Valdlens Antonovics'
  description 'When a user is signed-in. All links sends to login page.'
  version '0.0.3'

  require_dependency 'home_page_redirector'
  require_dependency 'issues_controller_path'
  require_dependency 'projects_controller_path'
  require_dependency 'search_controller_path'
  require_dependency 'members_controller_path'
  require_dependency 'issue_statuses_controller_path'
  require_dependency 'issue_relations_controller_path'
  require_dependency 'issue_categories_controller_path'
  

if Gem::Version.new("3.0") > Gem::Version.new(Rails.version) then
  Dispatcher.to_prepare do
    WelcomeController.send(:include, HomePageRedirector::HomePageRedirector)
	IssuesController.send(:include, HomePageRedirector::IssuesControllerPath)
	ProjectsController.send(:include, HomePageRedirector::ProjectsControllerPath)
	SearchController.send(:include, HomePageRedirector::SearchControllerPath)
	MembersController.send(:include, HomePageRedirector::MembersControllerPath)
	IssueStatusesController.send(:include, HomePageRedirector::IssueStatusesControllerPath)
	IssueRelationsController.send(:include, HomePageRedirector::IssueRelationsControllerPath)
	IssueCategoriesController.send(:include, HomePageRedirector::IssueCategoriesControllerPath)
  end
else
  Rails.configuration.to_prepare do
    WelcomeController.send(:include, HomePageRedirector::HomePageRedirector)
	IssuesController.send(:include, HomePageRedirector::IssuesControllerPath)
	ProjectsController.send(:include, HomePageRedirector::ProjectsControllerPath)
	SearchController.send(:include, HomePageRedirector::SearchControllerPath)
	MembersController.send(:include, HomePageRedirector::MembersControllerPath)
	IssueStatusesController.send(:include, HomePageRedirector::IssueStatusesControllerPath)
	IssueRelationsController.send(:include, HomePageRedirector::IssueRelationsControllerPath)
	IssueCategoriesController.send(:include, HomePageRedirector::IssueCategoriesControllerPath)
  end
end

end