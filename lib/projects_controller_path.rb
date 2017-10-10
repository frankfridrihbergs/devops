module HomePageRedirector
  module ProjectsControllerPath
    def self.included(base)
      base.class_eval do
        def index_with_redirector
          require_relative 'main_path'
		  if User.current.name == "Anonymous"
			redirect_to PATH_TO_LOGIN_PAGE
          else
			index_without_redirector
          end
        end
        alias_method_chain :index, :redirector 
      end
    end
  end
end