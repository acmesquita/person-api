
## Execute this migration just PostgreSQL
class AddingKindToContact < ActiveRecord::Migration[8.0]
  def up
    # execute <<-SQL
    #   CREATE TYPE contact_kinds AS ENUM ('phone', 'email');
    # SQL
    # add_column :contact, :kind, :contact_kinds
  end

  def down
    # remove_column :contact, :kind
    # execute <<-SQL
    #   DROP TYPE contact_kinds;
    # SQL
  end
end
