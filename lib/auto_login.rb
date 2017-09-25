module AutoLoginRedirector
  module AutoLoginRedirector
    def self.included(base)
      base.class_eval do
        # Insert overrides here, for example:
        def check_for_login
          unless User.current.anonymous?
			original_url = request.original_url
			login_url = 'https://rit.accenture.com/redmine/login'
            redirect_to login_url
			redirect_to original_url
          else
            index_without_redirector
          end
        end
        alias_method_chain :index, :redirector 
      end
    end
  end
end