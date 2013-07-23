# PluggableJs

Sometimes you need to use javascript only in specific view files but you don't want to change DOM or write code in a view. This gem provides simple functionality of loading javascript only in certain pages based on controller and action parameters. Keep your js code in controller related files as action based functions (still in asset pipeline). It will be triggered only if needed.

## Installation

1. Add `gem 'pluggable_js'` to Gemfile and run `bundle` command to install it
2. Add `<%= javascript_pluggable_tag %>` to layout
3. Add `pluggable/*` to to assets precompile configuration in production.rb (and staging.rb if you have one), e.g.: `config.assets.precompile += %w(pluggable/*)`
4. Be sure that `pluggable` folder is out of `require_tree` statement in application.js

## Usage

Choose controller and actions you want to use for pluggable js and run generator, e.g.:
    
    rails generate pluggable_js Post index new

It will create two files (just function callers):
    
    app/assets/javascripts/pluggable/posts/index.js.coffee
    app/assets/javascripts/pluggable/posts/show.js.coffee

Now you simply have to define `Post.index` and `Post.show` functions in controller related js file (e.g. posts.js.coffee). They will be triggered only when matching controller and action parameters. Take a look at generated files for additional info.

## Config

Lets say you've created action `search` that renders `index` template. Most likely we still need to trigger `Post.index()` function. In such situation you may create `config/initializers/pluggable_js.rb` and use pair actions config:

    PluggableJs.config do |config|
      config.pair_actions = { 'search' => 'index' }
    end

`{ 'create' => 'new', 'update' => 'edit' }` is a default REST configuration.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
