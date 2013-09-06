# PluggableJs

This gem provides simple functionality of loading page specific javascript (for Rails >= 3.1 with asset pipeline enabled). Keep desired js code in controller related files as action based functions. They will be triggered only when matching controller and action parameters.

## Installation

1. Add `gem 'pluggable_js'` to Gemfile and run `bundle` command to install it
2. Add `<%= javascript_pluggable_tag %>` to application layout file after `<%= javascript_include_tag 'application' %>` line
3. Add `pluggable/*` to assets precompile configuration in production.rb (and staging.rb if you have one), e.g.: `config.assets.precompile += %w(pluggable/*)`
4. Be sure that `pluggable` folder is out of `require_tree` statement in application.js

## Usage

Choose controller and actions you want to use for pluggable js and run generator, e.g.:
    
    rails generate pluggable_js Post index new

It will create two files (just function callers):
    
    app/assets/javascripts/pluggable/posts/index.js.coffee
    app/assets/javascripts/pluggable/posts/new.js.coffee

Now you simply have to define `Post.index` and `Post.new` functions in posts.js.coffee:

```coffeescript
window.Post ||= {}
Post.index = () ->
  # your code goes here
Post.new = () ->
  # and here
```

## Config

Let's say you've created action `search` that renders `index` template. Most likely we still need to trigger `Post.index()` function. In such situation you may create `config/initializers/pluggable_js.rb` and use pair actions config:

```ruby
PluggableJs.config do |config|
  config.pair_actions = { 'search' => 'index' }
end
```

`{ 'create' => 'new', 'update' => 'edit' }` is a default REST configuration.
