@['posts#index'] = (data) ->
  $('.protoss-quotes').append("<p>#{data.zealot_quote}</p>")
  $('.protoss-quotes').append('<p>You have not enough minerals.</p>' if data.minerals_size < 1000)
  $('.protoss-quotes').append('<p>Base is under attack.</p>') if data.base_is_under_attack
  $('.protoss-quotes').append("<p>#{data.alert.join(' ')}</p>")
  for key, value of data.ground_units_quotes
    $('.protoss-quotes').append("<p>#{key}: #{value}</p>")
  for unit in data.air_units_quotes
    for key, value of unit
      $('.protoss-quotes').append("<p>#{key}: #{value}</p>")

@['posts#new'] = (data) ->
  $('.terran-quotes').append("<p>#{data.marine_quote}</p>")
