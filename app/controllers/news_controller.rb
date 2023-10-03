class NewsController < ApplicationController
    before_action :set_news, only: [:show, :edit, :update, :destroy]
  
    def index
      @news = News.all
    end
  
    def show
    end
  
    def new
      @news = News.new
    end
  
    def create
      @news = News.new(news_params)
  
      if @news.save
        redirect_to news_path(@news), notice: 'Noticia creada exitosamente.'
      else
        render 'new'
      end
    end
  
    def edit
    end
  
    def update
      if @news.update(news_params)
        redirect_to news_path(@news), notice: 'Noticia actualizada exitosamente.'
      else
        render 'edit'
      end
    end
  
    def destroy
      @news.destroy
      redirect_to news_index_path, notice: 'Noticia eliminada exitosamente.'
    end
  
    private
  
    def set_news
      @news = News.find(params[:id])
    end
  
    def news_params
      params.require(:news).permit(:title, :content, :date)
    end
  end
  