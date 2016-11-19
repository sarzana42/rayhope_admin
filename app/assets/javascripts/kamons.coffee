$(document).on 'ready page:load', ->
  $('#kamon-tags').tagit
    fieldName: 'kamon[tag_list]'
    singleField: true
    availableTags: gon.available_tags
  
  if gon.kamon_tags?
    for tag in gon.kamon_tags
      $('#kamon-tags').tagit 'createTag', tag
      
  