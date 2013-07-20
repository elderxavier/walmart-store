WalmartStore.Routers.Products = Backbone.Router.extend({
  routes: {
    '': 'index',
    'produtos/:id': 'show'
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
  show: function(id) {
    return alert("Entry " + id);
  }
});
