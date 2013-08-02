WalmartStore.Views.BaseView = Backbone.View.extend({
    translation: {name: 'Nome'},
    handleServerErrors: function(model, error) {
      model.off('sync');
      var parent = this;
      $.each(jQuery.parseJSON(error.responseText), function(key, value) {
       alert(parent.translation[key] + ' ' + value);
      });
    }
});