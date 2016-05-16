def sign_in(user=nil)
  session[:user_id] = user ? user.id : Fabricate(:user).id
end