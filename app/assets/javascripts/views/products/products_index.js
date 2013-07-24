WalmartStore.Views.ProductsIndex = Backbone.View.extend({

  template: JST['products/index'],
  initialize: function() {
    this.collection.on('reset', this.render, this);
  },
  render: function() {
    $(this.el).html(this.template({
      products: this.collection
    }));
    return this;
  }
});
