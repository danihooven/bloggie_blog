class UsersController < ApplicationController

    before_action :set_user, only: [:show, :edit, :update]

    def show
        @articles = @user.articles.paginate(page: params[:page], per_page: 3)
    end
    
    def index
        @users = User.paginate(page: params[:page], per_page: 4)
    end
    
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)

        respond_to do |format|
            if @user.save
                session[:user_id] = @user.id
                format.html {redirect_to articles_path, :notice => 'Welcome to Bloggie Blog ' + @user.username + ', you have successfully signed up' }
            else
                format.html {render :new, status: :unprocessable_entity}
            end
        end
    end
    
    
    
    
    def edit
        
    end
    
    
    def update
        respond_to do |format|
            if @user.update(user_params)
                format.html {redirect_to user_path, notice: 'Account was updated successfully' }
            else
                format.html {render :edit, status: :unprocessable_entity}
            end
        end
    end    
     
     
     
     
    private
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
    
    def set_user
        @user = User.find(params[:id])
    end
    

end
