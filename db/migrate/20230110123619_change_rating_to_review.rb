class ChangeRatingToReview < ActiveRecord::Migration[7.0]
  def change
    rename_table :ratings, :reviews
  end
end
