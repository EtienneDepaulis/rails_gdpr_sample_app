ActiveAdmin.register User do

  actions :index

  index do
    id_column
    column :email
    column :created_at
  end

  filter :id
  filter :email

end
