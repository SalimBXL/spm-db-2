# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

user_admin = User.where(email: 'admin@user').first_or_initialize
user_admin.update!(
  role: :admin,
  password: 'password',
  password_confirmation: 'password'
)

user_regular = User.where(email: 'regular@user').first_or_initialize
user_regular.update!(
  role: :regular,
  password: 'password',
  password_confirmation: 'password'
)

settings = Setting.create([
    {key: 'depository', value: '/home/pet/Database'}, 
    {key: 'file_spm_base', value: 'SPM_classic.pdf'}, 
    {key: 'file_spm_mirror', value: 'SPM_mirror.pdf'}, 
    {key: 'xterm', value: 'xterm -e'},
    {key: 'download_directory', value: '/home/pet/Downloads'},
    {key: 'dicom_server_url', value: '127.0.0.1:8042'},
    {key: 'matlab', value: 'matlab'},
    {key: 'scripts_matlab', value: '/home/pet/spm/scripts_matlab'},
    {key: 'startup_matlab', value: '/home/pet/Documents/MATLAB/startup.m'},
    {key: 'cam1_nom', value: 'PET-CT'},
    {key: 'cam1_script', value: 'all_petct'},
    {key: 'cam2_nom', value: 'PET-MR'},
    {key: 'cam2_script', value: 'all_petmr'}
])