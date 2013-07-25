WalmartStore.Views.ProductsNew = Backbone.View.extend({

  template: JST['products/new'],
  render: function() {
    this.current_model = this.collection.get(this.id);
    if (typeof current_model === "undefined") {
      
    }
    $(this.el).html(this.template({}));
    return this;
  },
  
  initialize: function() {
    this.collection.on('add', this.navigateBack, this);
    this.collection.on('reset', this.render, this);
  },
  
  navigateBack: function() {
    // update comparator function
    this.collection.comparator = function(model) {
        return model.get('name');
    }

    // call the sort method
    this.collection.sort();
    return Backbone.history.navigate('', {trigger: true, replace: false});
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
    return product;
  }

});
