class Carbometer.View.PostRow extends Backbone.View
  className: 'post-row'

  initialize: ->
    pageUrl = @$el.data('permalink')
    @tweetCount = new Carbometer.Model.TweetCount pageUrl: pageUrl
    @tweetCount.on 'change:count', @renderTweetCount, @

  render: ->
    @authorName = @$('.post-author-name').text()
    @avatar = @$('.avatar')
    @renderAvatar()

  renderAvatar: ->
    avatarURL = @gravatarURL(@authorEmail())
    @avatar.css 'background-image', "url(#{avatarURL})"

  authorEmail: ->
    firstName = @authorName.split(' ')[0]
    "#{firstName}@carbonfive.com"

  gravatarURL: (email) ->
    Gravtastic email

  renderTweetCount: ->
    @$('.tweets').text("#{@tweetCount.get('count')}")
