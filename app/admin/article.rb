ActiveAdmin.register Article do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or

    form do |f|
        
        inputs 'Article' do
          input :picture, as: :file
          input :title
          input :summary
          input :description
        end
        inputs 'aditional content' do
            f.has_many :pictures, new_record: 'Create aditional content' do |picture|
              picture.input :picture, as: :file
              picture.input :description
            end
            actions
        end
    end


permit_params do
  params.permit!
end


end
