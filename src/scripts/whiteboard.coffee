puts = -> console?.log.apply console, arguments

$ ->
  x = -1
  y = -1
  down = no
  
  html = $('html')
  canvas = $('#whiteboard')
  .mousedown (evt) ->
    offset = canvas.offset().left
    x = evt.pageX - canvas.offset().left
    y = evt.pageY
    html.addClass 'unselectable'
    down = yes
  
  $(document)
  .mousemove (evt) ->
    offset = canvas.offset().left
    if down
      context.beginPath()
      context.moveTo x, y
      context.lineTo x = evt.pageX - offset, y = evt.pageY
      context.stroke()
  .mouseup (evt) ->
    if down
      html.removeClass 'unselectable'
      down = no
  
  context = canvas[0].getContext '2d'
  context.strokeStyle = '#000'
  
  canvas[0].width  = canvas.width()
  canvas[0].height = canvas.height()

$ ->
  sections = 'whiteboard lessons admin'.split ' '
  elements = {}
  for section in sections then elements[section] = $ ".#{section}"
  all = $ (".#{section}" for section in sections).join ','
  a = $('nav a').click ->
    a.removeClass 'active'
    $(this).addClass 'active'
    all.hide()
    elements[$(this).attr 'data-click'].show()
  if hash = document.location.hash.substring 1
    a.eq(i).click() for section, i in sections when section is hash
  $('.to-whiteboard').click -> a.eq(0).click()

$ ->
  img = $('#toolbar img').click ->
    img.removeClass 'active'
    $(this).addClass 'active'