# frozen_string_literal: true

class AddBranchOfficeToMovieTimes < ActiveRecord::Migration[7.0]
  def change
    add_column :movie_times, :branch_office, :integer, default: 0, null: false
  end
end
