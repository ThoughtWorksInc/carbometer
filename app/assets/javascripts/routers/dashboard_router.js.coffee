class Carbometer.Router.Dashboard extends Backbone.Router
  dashboardFrame: null

  routes:
    'dashboard': 'show'

  show: ->
    @dashboardFrame = new Carbometer.View.DashboardFrame
    @dashboardFrame.render()
