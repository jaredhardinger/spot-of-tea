class RemoveStatusFromSubscription < ActiveRecord::Migration[6.1]
  def change
    remove_column :subscriptions, :status, :string
  end
end
