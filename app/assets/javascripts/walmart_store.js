window.WalmartStore = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    new WalmartStore.Routers.Products;
    Backbone.history.start();
  }
};

$(document).ready(function(){
  WalmartStore.initialize();
});
