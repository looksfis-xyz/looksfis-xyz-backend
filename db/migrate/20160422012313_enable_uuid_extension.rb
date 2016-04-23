# http://blog.arkency.com/2014/10/how-to-start-using-uuid-in-activerecord-with-postgresql/
class EnableUuidExtension < ActiveRecord::Migration
  def change
    enable_extension 'uuid-ossp'
  end
end
