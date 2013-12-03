class PostsController < ApplicationController
  before_action :init_pluggable_js, only: [:index, :search]

  def index
  end

  def search
    render :index
  end

  def new
  end

  private

  def init_pluggable_js
    pluggable_js({ 
      zealot_quote: 'My life for aiur.',
      minerals_size: 999,
      base_is_under_attack: true,
      alert: ['Nuclear', 'launch', 'detected.'],
      units: { 'Zealots' => 12, 'Dragoons' => 6, 'Archons' => 1 }
    })
  end

end
