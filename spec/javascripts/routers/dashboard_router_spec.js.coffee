describe 'Carbometer.Router.Dashboard', ->
  beforeEach ->
    setFixtures("
      <div id='dashboard-frame'></div>
    ")
    @router = new Carbometer.Router.Dashboard

  describe '#show', ->
    describe 'by default', ->
      beforeEach ->
        @router.show()

      it 'displays a dashboard frame', ->
        expect(@router.dashboardFrame).toBeDefined()
        expect(@router.dashboardFrame.$el).toBeVisible()
