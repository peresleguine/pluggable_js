// Define somewhere in your controller related js file (e.g. <%= controller_name %>.js):
// 
// window.<%= model_name %> || (window.<%= model_name %> = {});
// <%= model_name %>["<%= @action %>"] = function() {
//   // your code goes here
// };
// 
// Or if you use coffeescript:
// 
// window.<%= model_name %> ||= {}
// <%= model_name %>.<%= @action %> = () ->
//   # your code goes here

jQuery(function() {
  // whatever you want will be triggered from here  
  // only if this filepath matches current 
  // controller and action parameters
  return <%= model_name %>.<%= @action %>();
});