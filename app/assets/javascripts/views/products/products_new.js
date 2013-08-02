WalmartStore.Views.ProductsNew = Backbone.View.extend({

  template: JST['products/new'],

  render: function() {
    if (typeof this.id != "undefined") {
      this.currentModel = new WalmartStore.Models.Product({_id: this.id});
      new WalmartStore.Collections.Products([this.currentModel]);
      this.currentModel.fetch({async:false});
      var formName = 'edit_product';
    } else {
      this.currentModel = new WalmartStore.Models.Product();
      var formName = 'new_product';
    }
    $(this.el).html(this.template({categories: this.categories, currentModel: this.currentModel, formName: formName}));
    return this;
  },
  
  initialize: function() {
    this.categories = new WalmartStore.Collections.Categories();
    this.categories.fetch({async: false});
  },
  
  navigateBack: function() {
    (new WalmartStore.Routers.Products).navigate('', {trigger: true});
  },
  
  new_attribute: function(event) {
    $('#new_attribute_btn').before(JST['products/attribute_entry']({key: '', value:''}));
  },
  
  destroy: function(event) {
    event.preventDefault();
    event.target.parentNode.remove();
  },

  events: {
    'submit #new_product': 'createProduct',
    'submit #edit_product': 'editProduct',
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
    this.currentModel = this.collection.create(this.buildProduct());
    this.currentModel.on('sync', this.navigateBack(), this);
  },
  
  editProduct: function(event) {
    event.preventDefault();
    this.currentModel = new WalmartStore.Models.Product($.extend({_id: this.id}, this.buildProduct()));
    new WalmartStore.Collections.Products([this.currentModel]);
    this.currentModel.save();
    this.currentModel.on('sync', this.navigateBack(), this);
  },
  
  buildProduct: function() {
    return {
      name: $('#new_product_name').val(),
      description: $('#new_product_description').val(),
      category_id: $('#new_product_category').val(),
      price: $('#new_product_price').val(),
      custom_attributes: this.getAttributes()
    }
  }

});
