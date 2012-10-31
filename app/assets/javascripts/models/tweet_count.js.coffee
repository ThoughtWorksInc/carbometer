class Carbometer.Model.TweetCount extends Backbone.Model
  url: ->
    "http://urls.api.twitter.com/1/urls/count.json?url=#{encodeURIComponent @get('pageUrl')}"

  initialize: ->
    @fetch()

  fetch: ->
    $.getJSON "#{@url()}&callback=?", (data) =>
      @set count: data['count']
