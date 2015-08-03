if Meteor.isClient
  Template.hiddenField.helpers
    disabled: ->
      instance = Template.instance()
      if instance.loading && instance.loading.get()
        return "disabled"