class UsersController < ApplicationController

    def new

    end

    def create
        @user = User.create(user_params)
        if @user.save
            redirect_to controller: 'welcome', action: 'home'
        else
            redirect_to controller: 'users', action: 'new'
        end
        session[:user_id] = @user.id
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end

end