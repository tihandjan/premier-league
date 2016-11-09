ActiveAdmin.register Video do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :title, :picture, :youtube_link, :code, :league


    form do |f|
        
        inputs 'videos' do
          input :title
          input :league, as: :select, collection: ['apl', 'seria-a', 'bundesliga', 'laliga', 'chempions-league']
          # input :team, as: :select, collection: select_team 
          input :picture, as: :file
          input :code
        end
    end


end
