WalmartStore.Collections.Products = Backbone.Collection.extend({
  model: WalmartStore.Models.Product,
  url: '/api/products'
});
