# Original idea from http://ethilien.net/archives/better-redirects-in-rails/ and it's comments
module RedirectBack
    
  # Save an action's uri in the session so it can be used to return to
  # Use a before_filter to run this on actions which will be redirected back to later on
  def store_return_point
    session[:return_to_uri] = request.request_uri
  end

  # Redirects to the session[:return_to] uri if there is one and to the given block of params if not
  def redirect_back(*params)
    uri = session[:return_to_uri]
    session[:return_to_uri] = nil
    uri ? redirect_to(uri) : redirect_to(*params)
  end

  # Redirect somewhere that will eventually return back to here
  def redirect_away(*params)
    store_return_point
    redirect_to(*params)
  end
  
end