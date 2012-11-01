class Carbometer.View.DashboardFrame extends Backbone.View
  el: '#dashboard-frame'

  postLeaderboard: null

  render: ->
    @postLeaderboard = new Carbometer.View.PostLeaderboard
      collection: Carbometer.Posts
    @postLeaderboard.render()

    @
