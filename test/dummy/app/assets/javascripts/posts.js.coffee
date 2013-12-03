window.posts = {}
posts.index = () ->
  $('.protoss-quotes').append("<p>#{pluggable_js.zealot_quote}</p>")
  $('.protoss-quotes').append('<p>You have not enough minerals.</p>' if pluggable_js.minerals_size < 1000)
  $('.protoss-quotes').append('<p>Base is under attack.</p>') if pluggable_js.base_is_under_attack
  $('.protoss-quotes').append("<p>#{pluggable_js.alert.join(' ')}</p>")
  for key of pluggable_js.units
    $('.protoss-quotes').append("<p>#{key}: #{pluggable_js.units[key]}.</p>")
