module RedirectBackHelper
  
  # Creates a link to the session[:return_to] uri or to the given block if there is no stored return point
  # Does not wipe :return_to_uri after it's been used.
  def link_back(text, *params)
    session[:return_to_uri] ? link_to(text, session[:return_to_uri]) : link_to(text, *params)
  end
  
end