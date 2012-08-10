class Carbometer.View.DashboardFrame extends Backbone.View
  el: '#dashboard-frame'

  postLeaderboard: null

  render: ->
    @postLeaderboard = new Carbometer.View.PostLeaderboard
    @postLeaderboard.render()

    @
