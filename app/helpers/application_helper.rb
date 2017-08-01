module ApplicationHelper
  def login_helper style = ' '
    if current_user.is_a?(GuestUser)
     (link_to "Register", new_user_registration_path, class: style) +
     " ".html_safe +
     (link_to "Login", new_user_session_path, class: style)
    else
     (link_to "Logout", destroy_user_session_path, method: :delete, class: style) +
     " ".html_safe +
     (link_to "Edit Profile", edit_user_registration_path, class: style)
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
