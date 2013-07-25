WalmartStore.Views.ProductsIndex = Backbone.View.extend({

  template: JST['products/index'],
  initialize: function() {
    this.collection.on('reset', this.render, this);
    this.collection.on('destroy', this.render, this);
  },
  events: {
    'click .destroy': 'destroy'
  },
  render: function() {
    $(this.el).html(this.template({
      products: this.collection
    }));
    return this;
  },
  destroy: function(event) {
    var index = $('#'+event.target.id).data('id')
    this.collection.at(index).destroy();
  }
});
