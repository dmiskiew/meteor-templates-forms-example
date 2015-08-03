if Meteor.isServer
  Meteor.publish 'projects', ->
    Projects.find()

  assignTasks = (projectId, tasks) ->
    Meteor.call('assignTasksToProject', projectId, tasks)

  Meteor.methods
    saveProjectWithTasks: (project) ->
      tasks = project.tasks
      delete project.tasks
      
      result = Projects.upsert({_id: project._id}, {$set: project})
      projectId = result.insertedId || project._id
      
      assignTasks(projectId, tasks)