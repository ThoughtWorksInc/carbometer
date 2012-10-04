class Carbometer.View.PostLeaderboard extends Backbone.View
  el: '#post-leaderboard'
  postRows: null

  initialize: ->
    @postRows = []

  render: ->
    @$('.post-row').each (index, post) =>
      postRow = new Carbometer.View.PostRow el: post
      postRow.render()
      @postRows.push postRow
