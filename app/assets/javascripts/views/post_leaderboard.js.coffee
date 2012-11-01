class Carbometer.View.PostLeaderboard extends Backbone.View
  el: '#post-leaderboard'
  postRows: null

  initialize: ->
    @postRows = []

  render: ->
    @collection.fetch
      error: (collection, response) =>
        console.log("error")
      success: (collection, response) =>
        _.each response, (post, index) =>
          postRow = new Carbometer.View.PostRow
            id: "post_#{index+1}"
          postRow.render()
          @postRows.push postRow

