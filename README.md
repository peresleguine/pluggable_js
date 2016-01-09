# PluggableJs

[![Build Status](https://travis-ci.org/peresleguine/pluggable_js.svg?branch=master)](https://travis-ci.org/peresleguine/pluggable_js) [![Gem Version](https://badge.fury.io/rb/pluggable_js.svg)](http://badge.fury.io/rb/pluggable_js)

This gem provides simple functionality of loading page specific javascript and allows to pass data from a controller. It requires only Rails >= 3.1 with asset pipeline enabled. Keep desired js code in controller related files as action based functions. They will be triggered only when matching controller and action parameters and when DOM is ready.

## Installation

1. Add `gem 'pluggable_js', '~> 2.2.0'` to Gemfile and run `bundle` command to install it
2. Add `<%= javascript_pluggable_tag %>` helper to application layout file above the closing `</body>` tag

The place for the helper is important. Primarily it serves the DOM ready purpose and completely necessary if you decided to use turbolinks.

## Usage

Simply define functions in your controller related file (e.g. posts.coffee) like so:

```coffeescript
@['posts#index'] = (data) ->
  # your code goes here
@['posts#new'] = (data) ->
  # and here
```

You may pass data to javascript function using `pluggable_js` helper in rails controller (`pjs` is an alias method). See example below:

```ruby
class PostsController < ApplicationController
  def index
    pluggable_js(
      string: 'string',
      integer: 1,
      boolean: true,
      array: [1, 2, 3],
      hash: { a: 1, b: 2, c: 3 },
      array_of_hashes: [{a: 1}, {b: 2}, {c: 3}]
    )
  end
end
```

If you feel like this logic doesn't belong to a controller, safely move it to a view. Then you can access data in posts.coffee:

```coffeescript
@['posts#index'] = (data) ->
  console.log data.string
  console.log data.integer
  console.log data.boolean
  console.log data.array
  console.log data.hash
  console.log data.array_of_hashes
```

CoffeeScript used here just for the sake of simplicity. You may implement the same with plain JavaScript.

## Config

Let's say you've created action `search` that renders `index` template. Most likely we still need to trigger `@['posts#index'](data)` function. In such situation you may create `config/initializers/pluggable_js.rb` and use pair actions config:

```ruby
PluggableJs.config do |config|
  config.pair_actions = { 'search' => 'index' }
end
```

`{ 'create' => 'new', 'update' => 'edit' }` is a default REST configuration.

## Upgrade

* [from <= v0.0.6 to v1.0.0](https://github.com/peresleguine/pluggable_js/wiki/Upgrade-from-v0.0.6-or-less-to-v1.0.0)
* [from v1.0 to v2.0](https://github.com/peresleguine/pluggable_js/wiki/Upgrade-from-v1.0-to-v2.0)
* [from v2.0 to v2.1](https://github.com/peresleguine/pluggable_js/wiki/Upgrade-from-v2.0-to-v2.1)

## Development notes

To run the test suite:

```
bundle exec cucumber
```

## Sublime Text Snippet

Go to `Sublime Text > Preferences > Browse Packages...` and save under `User` directory `pjs.sublime-snippet` with the following content:

```xml
<snippet>
  <content><![CDATA[
@['$1#$2'] = (data) ->
  $0
]]></content>
  <tabTrigger>pjs</tabTrigger>
  <scope>source.coffee</scope>
</snippet>
```

Thereafter `pjs` snippet will be available in coffeescript files.
