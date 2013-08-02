WalmartStore.Views.ProductsNew = Backbone.View.extend({

  template: JST['products/new'],

  render: function() {
    this.current_model = this.collection.get(this.id);
    if (typeof current_model === "undefined") {
      
    }
    $(this.el).html(this.template({categories: this.categories}));
    return this;
  },
  
  initialize: function() {
    this.collection.on('add', this.navigateBack, this);
    this.categories = new WalmartStore.Collections.Categories();
    this.categories.fetch({async: false});
  },
  
  navigateBack: function() {
    // update comparator function
    this.collection.comparator = function(model) {
        return model.get('name');
    }

    // call the sort method
    this.collection.sort();
    return Backbone.history.navigate('', {trigger: true});
  },
  
  new_attribute: function(event) {
    $('#new_attribute_btn').before(JST['products/attribute_entry']());
  },
  
  destroy: function(event) {
    event.preventDefault();
    event.target.parentNode.remove();
  },

  events: {
    'submit #new_product': 'createProduct',
    'click #new_attribute_btn': 'new_attribute',
    'click .destroy': 'destroy'
  },
  
  getAttributes: function() {
    var attributes = {}
    var attr_keys = $('input[name="attribute_key\\[\\]"]')
    var attr_values = $('input[name="attribute_value\\[\\]"]')
    for(var i=0; i < attr_keys.length; i++) {
      attributes[attr_keys[i].value] = attr_values[i].value;
    }
    return attributes;
  },
  
  createProduct: function(event) {
    event.preventDefault();
    product = this.collection.create({
      name: $('#new_product_name').val(),
      description: $('#new_product_description').val(),
      category_id: $('#new_product_category').val(),
      price: $('#new_product_price').val(),
      custom_attributes: this.getAttributes()
    });
    return product;
  }

});
