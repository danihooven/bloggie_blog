class ArticlesController < ApplicationController
   
    before_action :set_article, only: [:show, :edit, :update, :destroy]
    
    
    
    
    def show
    end
    
    
    
    
    def index
        @articles = Article.all
    end
    
    
    
    
    def edit
    end
    
    
    
    
    def new
        @article = Article.new
    end
    
    
    
    
    def create
        @article = Article.new(article_params)
        @article.user = User.first
        
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
end