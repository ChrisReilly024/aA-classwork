class UserController < ApplicationController
    def show
        render :show
    end

    def new
        @user = User.new
        render :new
    end

end