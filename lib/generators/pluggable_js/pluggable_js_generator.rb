class PluggableJsGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  argument :controller, type: :string
  argument :actions, type: :array, default: [], banner: 'action action'

  def create_pluggable_js_files
    actions.each do |action|
      @action = action
      template 'large_piece_of_code.js.coffee', File.join('app/assets/javascripts/pluggable', controller_name, "#{action}.js.coffee")
    end
  end

  private

  def controller_name
    controller.tableize
  end
  
end