UI.registerHelper('addIndex', (all) ->
  _.map(all, (val, index) ->
    {index: index, value: val}
  )
)

UI.registerHelper('nestedFieldOptions', (name, kw) ->
  kw.hash.field = name.replace(/\$/, this.index)
  kw.hash
)

UI.registerHelper('markIfSelected', (a, b) ->
  if (a && b && (a == b)) then 'selected' else ''
)
