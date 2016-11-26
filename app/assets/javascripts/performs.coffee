$(document).on 'ready page:load', ->
  $('#perform-tags').tagit
    fieldName: 'perform[tag_list]'
    singleField: true
    availableTags: gon.available_tags
  
  if gon.perform_tags?
    for tag in gon.perform_tags
      $('#perform-tags').tagit 'createTag', tag
      
  