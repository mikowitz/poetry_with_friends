module ApplicationHelper
  def display_name_genitive(user)
    user == current_user ? "My" : "#{user.display_name}'s"
  end

  def display_name_accusative(user)
    user == current_user ? "Me" : user.display_name
  end
end
