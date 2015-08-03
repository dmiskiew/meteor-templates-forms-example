Router.route('/', ->
  this.render('projects', {
    layoutTemplate: 'defaultLayout'
  })
)
      
# Router.map ->
#   @route 'home',
#     path: '/'
#     template: 'projects'