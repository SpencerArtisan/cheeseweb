// Generated by CoffeeScript 1.3.3
(function() {

  window.Movie = Backbone.Model.extend();

  window.Movies = Backbone.Collection.extend({
    model: Movie,
    url: "/movies",
    comparator: function(movie) {
      return -movie.get('rating');
    }
  });

  window.library = new Movies();

  window.MovieView = Backbone.View.extend({
    tagName: 'li',
    className: 'movie',
    initialize: function() {
      return this.template = _.template($('#movie-template').html());
    },
    render: function() {
      var renderedContent;
      renderedContent = this.template(this.model.toJSON());
      $(this.el).html(renderedContent);
      return this;
    }
  });

  window.LibraryMovieView = MovieView.extend();

  window.LibraryView = Backbone.View.extend({
    tagName: 'section',
    className: 'library',
    initialize: function() {
      _.bindAll(this, 'render');
      this.template = _.template($('#library-template').html());
      return this.collection.bind('reset', this.render);
    },
    render: function() {
      var $movies, collection;
      collection = this.collection;
      $(this.el).html(this.template());
      $movies = this.$('.movies');
      collection.each(function(movie) {
        var view;
        view = new LibraryMovieView({
          model: movie,
          collection: collection
        });
        return $movies.append(view.render().el);
      });
      return this;
    }
  });

  window.BackboneMovies = Backbone.Router.extend({
    routes: {
      '': 'home'
    },
    initialize: function() {
      return this.libraryView = new LibraryView({
        collection: window.library
      });
    },
    home: function() {
      var $container;
      $container = $('#container');
      $container.empty();
      return $container.append(this.libraryView.render().el);
    }
  });

  $(function() {
    window.App = new BackboneMovies();
    return Backbone.history.start();
  });

}).call(this);
