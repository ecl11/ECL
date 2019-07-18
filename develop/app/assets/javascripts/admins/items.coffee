# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

  $('.js-disc')
    .on 'cocoon:before-insert', (e, song_to_be_added) ->
      console.log('before insert')
      song_to_be_added.fadeIn('slow')
    .on 'cocoon:after-insert', (e, added_song) ->
      console.log('after insert')
      added_song.css("background","red")
    .on 'cocoon:before-remove', (e, song_to_be_removed) ->
      console.log('before remove')
      song_to_be_removed.fadeOut('slow')
    .on 'cocoon:after-remove', (e, removed_song) ->
      console.log('after remove')