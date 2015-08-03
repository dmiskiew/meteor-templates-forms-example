if Meteor.isClient
  titleize = (string) ->
    string.charAt(0).toUpperCase() + string.slice(1)
  listToOptions = (list) ->
    _.map(
      list, 
      ((value) -> return { valueAttribute: value, text: titleize(value) } ));
    
  Template.select.helpers
    skipLabel: ->
      this.skipLabel || false
    formattedOptions: ->
      options = this.options || []
      if options.length > 0
        unless (typeof options[0] == 'object')
          options = listToOptions(options)
      options
    disabled: ->
      instance = Template.instance()
      if instance.loading && instance.loading.get()
        return "disabled"