if Meteor.isClient
  openModal = (e) ->
    id = $(e.target).closest('tr').data('id')
    Session.set('currentProjectId', id)
    Session.set('projectModalLabel', $(e.target).attr('data-label'))
    Blaze.render(Blaze.Template.projectForm, $("#projectModal .modal-body-wrapper").get(0))
  
  Template.projects.helpers
    projects: ->
      Projects.find()
  
  Template.projects.events
    'click .js-open-modal': (e, tpl) ->
      openModal(e)
