class BigBasket.Items
  constructor: (@container) ->
    @initItems()

  initItems: () =>
    @container.find('.item').each (index, field) =>
      medicalSchool = new (BigBasket.Item)({container: $(field),parent: @})

