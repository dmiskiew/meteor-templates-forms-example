if Meteor.isServer
  Meteor.publish 'tasks', ->
    Tasks.find()

  removeExcluded = (projectId, taskIds) ->
    Tasks.remove({projectId: projectId, _id: {$nin: taskIds}})

  Meteor.methods
    assignTasksToProject: (projectId, tasks) ->
      Log("tasks: ")
      Log(tasks)
      if tasks
        taskIds = (task._id for task in tasks)
        removeExcluded(projectId, taskIds)
      
        for key of tasks
          task = tasks[key]
          task.projectId = projectId
          Tasks.upsert({_id: task._id}, {$set: task})
