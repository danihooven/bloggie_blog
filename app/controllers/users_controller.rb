class UsersController < ApplicationController

    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)

        respond_to do |format|
            if @user.save
                format.html {redirect_to articles_path, notice: 'Welcome to Bloggie Blog #{@user.username}, you have successfully signed up' }
            else
                format.html {render :new, status: :unprocessable_entity}
            end
        end
    end
    
    
    
    
    def edit
        @user = User.find(params[:id])
    end
    
    
    
    def update
        @user = User.find(params[:id])
        respond_to do |format|
            if @user.update(user_params)
                format.html {redirect_to articles_path, notice: 'Account was updated successfully' }
            else
                format.html {render :edit, status: :unprocessable_entity}
            end
        end
    end    
     
     
     
     
    private
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
    

end
