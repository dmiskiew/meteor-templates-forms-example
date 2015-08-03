if Meteor.isClient
  Template.textField.helpers
    skipLabel: ->
      this.skipLabel || false
    disabled: ->
      instance = Template.instance()
      if instance.loading && instance.loading.get()
        return "disabled"