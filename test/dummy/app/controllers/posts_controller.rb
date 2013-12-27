class PostsController < ApplicationController
  before_action :init_pluggable_js, only: [:index, :search]

  def index
  end

  def search
    render :index
  end

  def new
    pjs({marine_quote: 'You wanna piece of me, boy?'})
  end

  private

  def init_pluggable_js
    pluggable_js({ 
      zealot_quote: 'My life for aiur.',
      minerals_size: 999,
      base_is_under_attack: true,
      alert: ['Nuclear', 'launch', 'detected.'],
      ground_units_quotes: { 'Dragoon' => 'Make use of me.', 'High Templar' => 'It shall be done.', 'Archon' => 'We burn...' },
      air_units_quotes: [{'Scout' => 'Awaiting command.'}, {'Arbiter' => 'We feel your presence.'}, {'Carrier' => 'Affirmative.'}]
    })
  end

end
