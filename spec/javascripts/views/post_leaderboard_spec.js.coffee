describe 'Carbometer.View.PostLeaderboard', ->
  beforeEach ->
    setFixtures "
      <div class='post-leaderboard'>
        <div class='post-row'></div>
      </div>
    "
    @view = new Carbometer.View.PostLeaderboard

  describe '#render', ->
    beforeEach ->
      @view.render()

    it 'creates post row subviews', ->
      expect(@view.postRows).toBeDefined()
      expect(@view.postRows.length).toEqual(1)
