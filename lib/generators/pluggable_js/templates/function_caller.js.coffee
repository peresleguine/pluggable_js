# Define somewhere in your controller related js file (e.g. <%= controller_name %>.js.coffee):
# 
# window.<%= model_name %> ||= {}
# <%= model_name %>.<%= @action %> = () ->
#   # your code goes here

jQuery ->
  # whatever you want will be triggered from here  
  # only if this filepath matches current 
  # controller and action parameters  
  <%= model_name %>.<%= @action %>()