module ProfileHelper
  def following_link(user)
    return "" if user == current_user
    link_text = if current_user.follows?(user)
      "Stop following #{user.display_name}"
    else
      "Follow #{user.display_name}"
    end
    link_text
  end
end
