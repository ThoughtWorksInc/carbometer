window.Carbometer =
  Router: {}
  View: {}
  Model: {}
  Collection: {}
  Helper: {}

  initialize: ->
    dashboardRouter = new Carbometer.Router.Dashboard

    Backbone.history.start
      pushState: true

$ ->
  Carbometer.initialize()
