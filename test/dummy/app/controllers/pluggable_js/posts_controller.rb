module PluggableJs
  class PostsController < ApplicationController

    def index
    end

    def search
      render :index
    end

    def new
      pjs(marine_quote: 'You wanna piece of me, boy?')
    end

  end
end
