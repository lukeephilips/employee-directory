class AddProjectTable < ActiveRecord::Migration[5.0]
  def change
    create_table(:projects) do |t|
        t.column(:name, :string)
        t.column(:due_date, :date)
        t.column(:done, :boolean)
        t.timestamps
      end
      add_column(:employees, :project_id, :integer)
  end
end
