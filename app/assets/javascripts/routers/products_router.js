WalmartStore.Routers.Products = Backbone.Router.extend({
  routes: {
    '': 'index',
    'produtos/novo': 'new',
    'produtos/:id': 'edit'
  },
  initialize: function() {
    this.collection = new WalmartStore.Collections.Products();
    return this.collection.fetch({reset: true});
  },
  index: function() {
    var view = new WalmartStore.Views.ProductsIndex({
      collection: this.collection
    });
    return $('#container').html(view.render().el);
  },
  new: function() {
    var view = new WalmartStore.Views.ProductsNew({
      collection: this.collection
    });
    return $('#container').html(view.render().el);
  },
  edit: function(id) {
    var view = new WalmartStore.Views.ProductsNew({
      collection: this.collection,
      id: id
    });
    return $('#container').html(view.render().el);
  }
});
