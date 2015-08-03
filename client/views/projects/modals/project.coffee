if Meteor.isClient
  Template.projectModal.helpers
    modalLabel: ->
      Session.get('projectModalLabel')
      
  Template.projectModal.rendered = ->
    $('#projectModal').on 'hidden.bs.modal', (e) ->
      $('#projectModal .modal-body-wrapper').html('')