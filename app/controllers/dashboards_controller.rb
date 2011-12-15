class DashboardsController < ApplicationController
  # GET /dashboards
  # GET /dashboards.json
  def index
    @people = {
      :sean => {
        :name => "Sean D.",
        :email => "sean@sdurham.net"
      },
      :winston => {
        name: "Winston W.",
        email: "winston@carbonfive.com"
      }
    }

    def team_members(members)
      members.map { |m| @people[m] }
    end

    @projects = [
      {
        :name => "Blockbridge",
        :image => "blockbridge.png",
        :team => team_members([:winston, :sean])
      }
      #{
      #  :name => "Consulting MD",
      #  :team => [ "Dave H.", "Suzanna S.", "Courtney", "Mike P.", "Steven H." ]
      #},
      #{
      #  :name => "JobYou",
      #  :team => [ "Jon C." ]
      #},
      #{
      #  :name => "Booty Log",
      #  :team => [ "August", "Jonah", "Rudy", "Rit", "Eric I." ]
      #},
      #{
      #  :name => "Pocket Gems",
      #  :image => "PocketGems.png",
      #  :team => [ "Clark", "Winston" ]
      #},
      #{
      #    :name => "C5 Website",
      #    :team => [ "Kasha" ]
      #},
      #{
      #  :name => "Timesheet",
      #  :team => [ "James" ]
      #}
    ]

  end
end