class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

    def facebook
      @user = User.find_for_facebook_oauth request.env["omniauth.auth"]
      if @user.persisted?
        flash[:notice] = "Вы успешно вошли с помощью Facebook"
        sign_in_and_redirect @user, :event => :authentication
      else
        flash[:notice] = "Что то пошло не так дразяка, попробуй позже)))"
        redirect_to root_path
      end
    end

end
