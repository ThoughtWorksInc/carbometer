describe 'Carbometer.View.PostLeaderboard', ->
  beforeEach ->
    setFixtures "
      <div id='post-leaderboard'>
        <div class='post-row'></div>
      </div>
    "
    @testPostCollection = new Carbometer.Collection.Posts
    spyOn(@testPostCollection,'fetch').andCallFake (params) ->
      params.success([
        {'title': 'fake title','path': 'http://fake.path.com'}
        {'title': 'fake title2','path': 'http://fake.path2.com'}
      ])

    @view = new Carbometer.View.PostLeaderboard
      collection: @testPostCollection

  describe '#render', ->
    beforeEach ->
      @view.render()

    it 'fetches posts', ->
      expect(@testPostCollection.fetch).toHaveBeenCalled()

    it 'creates post row subviews', ->
      expect(@view.postRows).toBeDefined()
      expect(@view.postRows.length).toEqual(2)
