module PostsHelper
  def which_user(id)
    user=User.find(id)
  end
end
