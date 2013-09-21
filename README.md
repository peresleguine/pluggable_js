
# PluggableJs

This gem provides simple functionality of loading page specific javascript (for Rails >= 3.1 with asset pipeline enabled). Keep desired js code in controller related files as action based functions. They will be triggered only when matching controller and action parameters.

## Installation

* Add `gem 'pluggable_js'` to Gemfile and run `bundle` command to install it
* Add `<%= javascript_pluggable_tag %>` to application layout file after `<%= javascript_include_tag 'application' %>` line

Next steps are necessary only if you want to use generator for large pieces of js code (see usage):

* Add `pluggable/*` to assets precompile configuration in production.rb (and staging.rb if you have one), e.g.: `config.assets.precompile += %w(pluggable/*)`
* Be sure that `pluggable` folder is out of `require_tree` statement in application.js

## Usage

Simply define functions in your controller related file (e.g. posts.js.coffee) like so:

```coffeescript
window.Post ||= {}
Post.index = () ->
  # your code goes here
Post.new = () ->
  # and here
```
Or, in rare cases, if you have large piece of code (maybe external lib) that you don't want to define as a function, choose controller and actions you want to use and run generator, e.g.:
    
    rails generate pluggable_js Post index new

It will create two files where you may add your code (don't forget to follow necessary installation steps):
    
    app/assets/javascripts/pluggable/posts/index.js.coffee
    app/assets/javascripts/pluggable/posts/new.js.coffee

## Config

Let's say you've created action `search` that renders `index` template. Most likely we still need to trigger `Post.index()` function. In such situation you may create `config/initializers/pluggable_js.rb` and use pair actions config:

```ruby
PluggableJs.config do |config|
  config.pair_actions = { 'search' => 'index' }
end
```

`{ 'create' => 'new', 'update' => 'edit' }` is a default REST configuration.
