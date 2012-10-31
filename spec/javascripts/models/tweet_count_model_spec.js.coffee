describe 'Carbometer.Model.TweetCount', ->

  beforeEach ->
    @pageUrl = 'http://cnn.com'
    @expectedCountAPIUrl = "http://urls.api.twitter.com/1/urls/count.json?url=#{encodeURIComponent @pageUrl}"

  describe '#initialize', ->
    describe 'given a post URL', ->
      beforeEach ->
        @getJSONSpy = sinon.spy($, 'getJSON')

        @tweetCount = new Carbometer.Model.TweetCount pageUrl: @pageUrl

      afterEach ->
        $.getJSON.restore()

      it 'fetches the count for that page', ->
        expect(@getJSONSpy.called).toBeTruthy()
        expect(@getJSONSpy.getCall(0).args[0]).toEqual(@expectedCountAPIUrl + '&callback=?')

      describe 'given it receives the count', ->
        beforeEach ->
          @expectedCount = Math.floor((Math.random() * 1000) + 1)

          @getJSONSpy.getCall(0).args[1](count: @expectedCount)

        it 'updates the count value', ->
          expect(@tweetCount.get 'count').toEqual(@expectedCount)

  describe '#url', ->
    describe 'given a post url', ->
      beforeEach ->
        @model = new Carbometer.Model.TweetCount pageUrl: @pageUrl

      it 'returns the API URL to retrieve the tweet count for that page', ->
        expect(@model.url()).toEqual(@expectedCountAPIUrl)
