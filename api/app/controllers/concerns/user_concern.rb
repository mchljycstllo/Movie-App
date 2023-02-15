module UserConcern
  def fetch_all_users
    users = User.where(deleted: false)
  end
end