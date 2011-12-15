class DashboardsController < ApplicationController
  # GET /dashboards
  # GET /dashboards.json
  def index
    @projects = [
      {
        :name => "Blockbridge",
        :team => [ "Ingar", "Christian", "Jim", "Sean", "Elias" ]
      },
      {
        :name => "Consulting MD",
        :team => [ "Dave H.", "Suzanna S.", "Courtney", "Mike P.", "Steven H." ]
      },
      {
        :name => "JobYou",
        :team => [ "Jon C." ]
      },
      {
        :name => "Booty Log",
        :team => [ "August", "Jonah", "Rudy", "Rit", "Eric I." ]
      },
      {
        :name => "Pocket Gems",
        :team => [ "Clark", "Winston" ]
      },
      {
          :name => "C5 Website",
          :team => [ "Kasha" ]
      },
      {
        :name => "Timesheet",
        :team => [ "James" ]
      }
    ]

  end
end