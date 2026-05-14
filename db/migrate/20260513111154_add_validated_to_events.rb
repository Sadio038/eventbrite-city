class AddValidatedToEvents < ActiveRecord::Migration[7.2]
  def change
    add_column :events, :validated, :boolean, default: nil
  end
end
