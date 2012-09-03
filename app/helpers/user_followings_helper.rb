module UserFollowingsHelper
  def follow_link(user)
    if current_user.follows?(user)
      text = "Stop following"
      class_name = 'unfollow'
    else
      text = "Follow"
      class_name = 'follow'
    end
    content_tag(:a, "#{text} #{user.display_name}", href: "#", class: "user-follow-link #{class_name}",
                data: { 'user-id' => user.id })
  end
end
