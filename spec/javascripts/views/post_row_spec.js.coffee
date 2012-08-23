describe 'Carbometer.View.PostRow', ->
  beforeEach ->
    @view = new Carbometer.View.PostRow

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
