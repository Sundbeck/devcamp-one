module ApplicationHelper
  def login_helper
    if current_user.is_a?(GuestUser)
      (link_to "Register", new_user_registration_path) +
      "<br>".html_safe +
      (link_to "Login", new_user_session_path)
      
    else
      link_to "Logout", destroy_user_session_path, method: :delete
    end
  end
  
  def source_helper(layout_name)
    if session[:source]
      greeting = "Thanks for visiting me from #{session[:source]} and your are on the #{layout_name}"
      content_tag(:p, greeting, clas: "source_greeting")
    end
  end
  
  def copyright_generator
    SundbeckViewTool::Renderer.copyright 'Kevin Sundbeck','All rights reserved'
  end
end
