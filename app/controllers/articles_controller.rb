class ArticlesController < ApplicationController
   
    before_action :set_article, only: [:show, :edit, :update, :destroy]
    before_action :require_user, except: [:show, :index]
    before_action :require_same_user, only: [:edit, :update, :destroy]
    
    
    
    def show
    end
    
    
    
    
    def index
        @articles = Article.paginate(page: params[:page], per_page: 8)
    end
    
    
    
    
    def edit
    end
    
    
    
    
    def new
        @article = Article.new
    end
    
    
    
    
    def create
        @article = Article.new(article_params)
        @article.user = current_user
        
        respond_to do |format|
            if @article.save
                format.html {redirect_to @article, notice: 'Article was created successfully' }
            else
                format.html {render :new, status: :unprocessable_entity}
            end
        end
    end
    
    
    
    
    def update
        
            respond_to do |format|
                if @article.update(article_params)
                    format.html {redirect_to @article, notice: 'Article was updated successfully' }
                else
                    format.html {render :edit, status: :unprocessable_entity}
                end
            end
    end
    
    
    
    def destroy
        @article.destroy
        redirect_to articles_path
    end
    
    
    
    private
    
    def set_article
        @article = Article.find(params[:id])
    end
    
    def article_params
        params.require(:article).permit(:title, :description)
    end
    
    def require_same_user
        if current_user != @article.user
            flash[:alert] = "You can only edit or delete your own article"
            redirect_to @article
        end
    end
end