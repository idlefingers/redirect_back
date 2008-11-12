module ActionView
  module Helpers
    module UrlHelper
      
      # creates a link to the session[:return_to] uri if there is one and to the given block of params if not
      def link_back(text, *params)
        uri = session[:return_to_uri]
        session[:return_to_uri] = nil
        uri ? link_to(text, uri) : link_to(text, *params)
      end
      
    end
  end
end