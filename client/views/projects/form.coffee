if Meteor.isClient
  taskSchema = new SimpleSchema
    _id:
      type: String
      optional: true
    name:
      type: String
      instructions: "Name"
    category:
      type: String
    cost:
      type: Number
      min: 0
      
  projectSchema = new SimpleSchema
    name:
      type: String
      max: 20
      label: "Name"
    description:
      type: String
      label: "Description"
    tasks:
      type: [taskSchema],
      minCount: 0

  saveProject = (elements, callbacks, changed) ->
    console.log("[forms] Action running!");
    console.log("[forms] Form data!", this);
    console.log("[forms] HTML elements with `.reactive-element` class!", elements);
    console.log("[forms] Callbacks!", callbacks);
    console.log("[forms] Changed fields!", changed);
    
    Meteor.call('saveProjectWithTasks', this)
    $("#projectModal").modal('hide')
      
  addTaskRow = ->
    tasks = Template.instance().tasks.get()
    tasks.push({})
    Template.instance().tasks.set(tasks)
    
  removeTaskRow = (e) ->
    $target = $(e.target)
    index = $target.closest('.js-task-fields').data('index')
    
    tasks = Template.instance().tasks.get()
    tasks.splice(index, 1);
    Template.instance().tasks.set(tasks)


  Template.projectForm.helpers
    schema: ->
      return projectSchema
    formData: ->
      data = Projects.findOne(Session.get('currentProjectId')) || {}
      data.tasks = Template.instance().tasks.get()
      data
    save: ->
      return saveProject

  Template.projectForm.onCreated ->
    this.tasks = new ReactiveVar(Tasks.find({projectId: Session.get('currentProjectId')}).fetch())

  Template.projectForm.rendered = ->
    instance = this
    $('#projectModal').on 'hide.bs.modal', (e)->
      Session.set('currentProjectId', '')
      Session.set('projectModalLabel', '')
      
  Template.projectForm.events
    'click .js-add-task': (e, tpl) ->
      addTaskRow()
    'click .js-remove-task': (e, tpl) ->
      removeTaskRow(e)