# Define somewhere in your controller related js file (e.g. posts.js.coffee):
# 
# window.Post ||= {}
# Post.index = () ->
#   # your code goes here

jQuery ->
  # whatever you want will be triggered from here  
  # only if this filepath matches current 
  # controller and action parameters  
  Post.index()
