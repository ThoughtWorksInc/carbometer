window.Carbometer =
  Router: {}
  View: {}
  Model: {}
  Collection: {}
  Helper: {}

  initialize: ->
    dashboardRouter = new Carbometer.Router.Dashboard
    Carbometer.Posts = new Carbometer.Collection.Posts

    Backbone.history.start
      pushState: true

$ ->
  Carbometer.initialize()
