class DashboardsController < ApplicationController
  # GET /dashboards
  # GET /dashboards.json
  def index
    authorize!(params[:action], DashboardsController)
    
    @people = {
      alex: { name: 'Alex C.', email: 'alex@carbonfive.com' },
      august: { name: 'August J.', email: 'august@carbonfive.com' },
      christian: { name: 'Christian C.', email: 'christian@carbonfive.com' },
      clark: { name: 'Clark C.', email: 'clark@carbonfive.com' },
      courtney: { name: 'Courtney H.', email: 'courtney@carbonfive.com' },
      danny: { name: 'Danny K.', email: 'danny@carbonfive.com' },
      david: { name: 'David H.', email: 'david@carbonfive.com' },
      don: { name: 'Don T.', email: 'don@carbonfive.com' },
      erik: { name: 'Erik I.', email: 'erik@carbonfive.com' },
      elias: { name: 'Elias C.', email: 'elias@carbonfive.com' },
      ingar: { name: 'Ingar S.', email: 'ingar@carbonfive.com' },
      james: { name: 'James B.', email: 'james@carbonfive.com' },
      jim: { name: 'Jim R.', email: 'jim@carbonfive.com' },
      jared: { name: 'Jared C.', email: 'jared@carbonfive.com' },
      jon_c: { name: 'Jon C.', email: 'joncooper@carbonfive.com' },
      jonah: { name: 'Jonah W.', email: 'jonah@carbonfive.com' },
      kasha: { name: 'Kasha S.', email: 'kasha@carbonfive.com' },
      mike_w: { name: 'Mike W.', email: 'mike@carbonfive.com' },
      mike_p: { name: 'Mike P.', email: 'mperham@carbonfive.com' },
      rit: { name: 'Rit L.', email: 'rit@carbonfive.com' },
      rob: { name: 'Rob P.', email: 'rob@carbonfive.com' },
      rudy: { name: 'Rudy J', email: 'rudy@carbonfive.com' },
      sean: { name: 'Sean D.', email: 'sean@sdurham.net' },
      steven_h: { name: 'Steven H.', email: 'steven@carbonfive.com' },
      suzanna: { name: 'Suzanna S.', email: 'suzanna@carbonfive.com' },
      winston: { name: 'Winston W.', email: 'winston@carbonfive.com' }
    }
    puts @people

    def team_members(members)
      members.map { |m| @people[m] }
    end

    @projects = [
      {
        :name => "Blockbridge",
        :image => "blockbridge.png",
        :team => team_members([:ingar, :jim, :christian, :elias, :sean])
      },
      {
          :name => "Booty Log",
          :team => team_members([:august, :jonah, :rudy, :rit, :erik])
      },
      {
          :name => "C5 Website",
          :team => team_members([:kasha,])
      },
      {
        :name => "Consulting MD",
        :team => team_members([:david, :suzanna, :courtney, :mike_p, :steven_h])
      },
      {
        :name => "JobYou",
        :team => team_members([:alex, :jon_c, :james])
      },

      {
        :name => "Pocket Gems",
        :image => "PocketGems.png",
        :team => team_members([:clark, :winston])
      }
    ]

  end
end
