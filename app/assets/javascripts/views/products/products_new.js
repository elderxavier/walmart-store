WalmartStore.Views.ProductsNew = Backbone.View.extend({

  template: JST['products/new'],
  render: function() {
    $(this.el).html(this.template({}));
    return this;
  },
  
  initialize: function() {
    return this.collection.on('add', this.navigateBack, this);
  },
  
  navigateBack: function() {
    return Backbone.history.navigate('/', {trigger: true, replace: false});
  },
  
  events: {
    'submit #new_product': 'createProduct'
  },
  
  createProduct: function(event) {
    event.preventDefault();
    product = this.collection.create({
      name: $('#new_product_name').val(),
      description: $('#new_product_description').val(),
      category: $('#new_product_category').val(),
      image_url: $('#new_product_image_url').val(),
      price: $('#new_product_price').val()
    });
    this.collection.sync();
    return product;
  }

});
