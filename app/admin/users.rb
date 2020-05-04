ActiveAdmin.register User do
  permit_params :email,
                :encrypted_password,
                :reset_password_token,
                :reset_password_sent_at,
                :remember_created_at,
                :created_at,
                :updated_at,
                :index_users_on_email,
                :index_users_on_reset_password_token
end