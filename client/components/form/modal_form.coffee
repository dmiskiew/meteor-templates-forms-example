if Meteor.isClient
  Template.modalForm.onRendered ->
    instance = this
    unless (instance.rendered)
      instance.rendered = true
      $(instance.firstNode).closest('.modal').on 'hidden.bs.modal', (e) ->
        Blaze.remove(instance.view)