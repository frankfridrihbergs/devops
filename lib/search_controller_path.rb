module HomePageRedirector
  module SearchControllerPath
    def self.included(base)
      base.class_eval do
        def index_with_redirector
		  original_link = request.original_url
          
		  if User.current.name == "Anonymous"
			redirect_to "http://127.0.0.1:81/redmine/login"
          else
			index_without_redirector
          end
		  
		  if request.original_url == original_link
		   def nothing
		     end
		  else
		    redirect_to original_link
		  end
		  
        end
        alias_method_chain :index, :redirector 
      end
    end
  end
end