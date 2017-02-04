class BigBasket.Item
  constructor: (options) ->
    @container = options.container
    @parent = options.parent
    @bindEvents()

  bindEvents: () =>
    @container.find('.delete-item').click (e)=>
      @deleteItem()

  deleteItem: () =>
    $.ajax
      type: "delete"
      url: '/items/' + @container.data('id')
      success: (data) =>
        if @container.closest('table').find('.item').length == 1
          window.location.reload()
        else
          @container.remove()
        console.log(data.message)
      error: (data) =>
        console.log('can not delete.')