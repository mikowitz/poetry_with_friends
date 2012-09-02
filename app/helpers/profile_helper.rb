module ProfileHelper
  def viewing_self?
    current_user == @view_user
  end
end
