WalmartStore.Views.ProductsNew = Backbone.View.extend({

  template: JST['products/new'],
  render: function() {
    $(this.el).html(this.template({}));
    return this;
  },
  createEntry: function(event) {
    event.preventDefault();
    return this.collection.create({
      name: $('#new_product_name').val()
    });
  }

});
