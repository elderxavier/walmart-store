WalmartStore.Collections.TreeCategories = Backbone.Collection.extend({
  model: WalmartStore.Models.Category,
  url: '/api/categories/tree'
});
