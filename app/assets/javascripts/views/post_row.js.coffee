class Carbometer.View.PostRow extends Backbone.View
  className: 'post-row'

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
