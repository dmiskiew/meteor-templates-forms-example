if Meteor.isClient
  Template.projects.onCreated ->
    instance = this
    instance.subscribe('projects')
    instance.subscribe('tasks')