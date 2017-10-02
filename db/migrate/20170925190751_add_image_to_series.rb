class AddImageToSeries < ActiveRecord::Migration[5.1]
  def change
    add_column :series, :image_url, :string
  end
end
