module ProfileHelper
  def possessive_display_name(user)
    user == current_user ? "My" : "#{user.display_name}'s"
  end
end
