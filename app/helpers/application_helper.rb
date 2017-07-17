module ApplicationHelper
  def login_helper
   if current_user.is_a?(User)
     (link_to "logout", destroy_user_session_path, method: :delete) +
     "<br>".html_safe +
     (link_to "edit profile", edit_user_registration_path)
   else
     (link_to "register", new_user_registration_path) +
     "<br>".html_safe +
     (link_to "login", new_user_session_path)
    end
  end

def source_helper(layout_name)
   if session[:source]
     greeting = "Thanks for finding me on #{session[:source]}. You are on the #{layout_name} layout."
     content_tag(:p, greeting, class: "source-greeting")
    end
  end
end
