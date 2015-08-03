if Meteor.isClient
  # Register components
  # -------------------

  ReactiveForms.createFormBlock
    template: 'modalForm'
    submitType: 'normal'
    
  ReactiveForms.createElement
    template: 'textField'
    passThroughData: true
    validationEvent: 'keyup'

  ReactiveForms.createElement
    template: 'textArea'
    passThroughData: true
    validationEvent: 'keyup'

  ReactiveForms.createElement
    template: 'hiddenField'
    passThroughData: true
    validationEvent: 'change'
    
  ReactiveForms.createElement
    template: 'select'
    passThroughData: true
    validationEvent: 'change'