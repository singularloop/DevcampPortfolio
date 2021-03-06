module ApplicationHelper
  def login_helper
    if current_user.is_a?(GuestUser)
     (link_to "register", new_user_registration_path) +
     "<br>".html_safe +
     (link_to "login", new_user_session_path)
    else
     (link_to "logout", destroy_user_session_path, method: :delete) +
     "<br>".html_safe +
     (link_to "edit profile", edit_user_registration_path)
    end
  end

  def source_helper(layout_name)
    if session[:source]
     greeting = "Thanks for finding me on #{session[:source]}. You are on the #{layout_name} layout."
     content_tag(:p, greeting, class: "source-greeting")
    end
  end
  
  def copyright_generator
    @copyright = DevcampViewToolAvery::Renderer.copyright 'Kalyn Avery', 'All rights reserved'
  end
end
