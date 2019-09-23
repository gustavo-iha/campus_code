class IdeasController < ApplicationController
    def index
        # render plain: 'Olá'
    end

    def new
        @idea = Idea.new(active: true)
    end

    def create
        @idea = Idea.new(parse_params)
        if @idea.save()
            redirect_to root_path
        else
            # deu erro
        end
    end

    private
    def parse_params
        params.require(:idea).permit(:title, :details, :recommended, :active)
    end
end