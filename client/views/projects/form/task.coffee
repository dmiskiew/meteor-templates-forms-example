if Meteor.isClient
  Template.taskByProject.helpers
    categories: ['easy', 'medium', 'hard']
