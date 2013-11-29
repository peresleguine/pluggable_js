class PostsController < ApplicationController
  def index
    pluggable_js({ a:1, b:2 })
  end

  def new
  end
end
