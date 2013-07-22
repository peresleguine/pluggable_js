module PluggableJs
  class Railtie < Rails::Railtie
    initializer "pluggable_js.helpers" do
      ActionView::Base.send :include, Helpers
    end
  end
end