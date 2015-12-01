module ApplicationHelper
  
  def gravatar_for(chef, size = 80)
    gravatar_id = Digest::MD5::hexdigest(chef.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: chef.chefname, class: "gravatar")
  end
  
  def current_user
    @current_user ||= Chef.find(session[:chef_id]) if session[:chef_id]
  end
  
  def logged_in?
    !!current_user
  end
  
end
