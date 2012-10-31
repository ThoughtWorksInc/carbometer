describe 'Carbometer.View.PostRow', ->
  beforeEach ->
    @pageUrl = 'http://cnn.com'
    setFixtures """
      <div class='post-row' data-permalink=#{@pageUrl}>
        <li class='tweets'></li>
      </div>
    """

    @view = new Carbometer.View.PostRow el: $('.post-row')

  describe '#initialize', ->
    it 'creates a tweet count for the post', ->
      expect(@view.tweetCount).toBeDefined()
      expect(@view.tweetCount.get('pageUrl')).toEqual(@pageUrl)

  describe '#render', ->
    beforeEach ->
      spyOn @view, 'renderAvatar'
      @view.render()

    it 'renders the author avatar', ->
      expect(@view.renderAvatar).toHaveBeenCalled()

  describe '#authorEmail', ->

    describe 'given an author name', ->
      beforeEach ->
        @authorName = 'Rob Pak'

      it 'returns the email address for the author', ->
        @view.authorName = 'Rob Pak'
        expect(@view.authorEmail()).toEqual('Rob@carbonfive.com')

  describe '#renderTweetCount', ->
    beforeEach ->
      @count = 9
      @view.tweetCount.set count: @count

    it 'updates the tweet count', ->
      expect(@view.$('.tweets')).toHaveText("#{@count}")
