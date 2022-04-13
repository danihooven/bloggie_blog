class SessionsController < ApplicationController

    def new
        # @user = User.new
    end

    def create 
        user = User.find_by(username: params.dig(:session,:username))
        
         respond_to do |format|
            if user && user.authenticate(params[:session][:password])
                session[:user_id] = user.id
                format.html {redirect_to user, notice: "Logged in successfully" }
            else
                format.html {redirect_to login_path, alert: "Incorrect Login", status: :unprocessable_entity}
            end
        end
        
    end
    
    def destroy
        respond_to do |format|
            session[:user_id] = nil
            format.html {redirect_to root_path, notice: "Logged Out" }
        end
    end
end
