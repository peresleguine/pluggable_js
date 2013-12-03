
# PluggableJs

This gem provides simple functionality of loading page specific javascript and passing data (for Rails >= 3.1 with asset pipeline enabled). Keep desired js code in controller related files as action based functions. They will be triggered only when matching controller and action parameters and when DOM is loaded.

## Installation

* Add `gem 'pluggable_js'` to Gemfile and run `bundle` command to install it
* Add `<%= javascript_pluggable_tag %>` to application layout file after `<%= javascript_include_tag 'application' %>` line

Next steps are necessary only if you want to use generator for large pieces of js code (see usage):

* Add `pluggable/*` to assets precompile configuration in production.rb (and staging.rb if you have one), e.g.: `config.assets.precompile += %w(pluggable/*)`
* Be sure that `pluggable` folder is out of `require_tree` statement in application.js

## Usage

Simply define functions in your controller related file (e.g. posts.js.coffee) like so:

```coffeescript
window.posts = {}
posts.index = () ->
  # your code goes here
posts.new = () ->
  # and here
```
Or, in rare cases, if you have large piece of code (maybe external lib) that you don't want to define as a function but include on a certain page, choose controller and actions you want to use and run generator, e.g.:
    
    rails generate pluggable_js posts index new

It will create two files where you may add your code (don't forget to follow necessary installation steps):
    
    app/assets/javascripts/pluggable/posts/index.js.coffee
    app/assets/javascripts/pluggable/posts/new.js.coffee

## Passing data

Starting with version 0.0.7 you may pass data to javascript using `pluggable_js` helper in a controller. See example below:

```ruby
class PostsController < ApplicationController
  def index
    pluggable_js({ 
      string: 'string',
      integer: 1,
      boolean: true,
      array: [1, 2, 3],
      hash: { a: 1, b: 2, c: 3 }
    })
  end
end
```

Now you can access data in posts.js.coffee:

```coffeescript
window.posts = {}
posts.index = () ->
  if pluggable_js.boolean
    console.log pluggable_js.string
    console.log pluggable_js.integer
    console.log pluggable_js.array
    console.log pluggable_js.hash
```

## Config

Let's say you've created action `search` that renders `index` template. Most likely we still need to trigger `posts.index()` function. In such situation you may create `config/initializers/pluggable_js.rb` and use pair actions config:

```ruby
PluggableJs.config do |config|
  config.pair_actions = { 'search' => 'index' }
end
```

`{ 'create' => 'new', 'update' => 'edit' }` is a default REST configuration.

If you passing data, move `pluggable_js` helper into a separate private method and use `before_action :your_private_method, only: [:index, :search]` (`before_filter` in Rails < 4).

## Upgrade

If you are upgrading from version `<= 0.0.6` to `0.0.7`, all you have to do is rename old construction `window.Post` to new `window.posts` (see usage).
