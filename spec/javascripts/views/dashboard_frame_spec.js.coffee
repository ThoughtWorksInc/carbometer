describe 'Carbometer.View.DashboardFrame', ->
  beforeEach ->
    setFixtures("
      <div id='post-leaderboard'></div>
    ")
    @frame = new Carbometer.View.DashboardFrame

  describe '#render', ->
    describe 'by default', ->
      beforeEach ->
        @frame.render()

      it 'creates a post leaderboard', ->
        expect(@frame.postLeaderboard).not.toBeNull()
        expect(@frame.postLeaderboard.$el).toBeVisible()
