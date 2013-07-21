module PluggableJs
  class Railtie < Rails::Railtie
    initializer "pluggable_js" do
      ActionView::Base.send :include, PluggableJs
    end
  end
end