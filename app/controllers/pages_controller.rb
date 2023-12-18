class PagesController < ApplicationController
    def index
        @pages = Page.all
    end

    def show
        @page = Page.find(params[:id])
        # render plain: @page.title
    end

    def new 
        @page = Page.new
    end

    def create
        page_params = params.require(:page).permit(:title, :body, :slug)
        @page = Page.new(page_params)
        @page.save
        redirect_to @page
        # @page = Page.new(params)
        # skipping render text: params.to_json
    end
end
