# PluggableJs

Sometimes you need to use javascript only in specific view files but you don't want to change DOM or write code in a view. This gem provides simple functionality of loading javascript only in certain pages based on controller and action parameters. Keep your js code in one controller related file as action based functions. They will be triggered only if needed.

## Installation

1. Add `gem 'pluggable_js'` to Gemfile and run `bundle` command to install it
2. Add `<%= javascript_pluggable_tag %>` to layout
3. Add `pluggable/*` to to assets precompile configuration in production.rb (and staging.rb if you have one), e.g.: `config.assets.precompile += %w(pluggable/*)`
4. Be sure that `pluggable` folder is out of require_tree statement in application.js

## Usage

TODO: Write usage instructions here

## Config

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
