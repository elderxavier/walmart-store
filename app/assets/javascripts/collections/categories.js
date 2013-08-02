WalmartStore.Collections.Categories = Backbone.Collection.extend({
  model: WalmartStore.Models.Category,
  url: '/api/categories'
});
