ActiveAdmin.register Video do

permit_params :title, :picture, :code, :league, tags_attributes: [:name], taggings_attributes: [:video_id, :tag_id]

    index do
        column :id
        column :league
        column :code
    end

    form do |f|
        
        inputs 'videos' do
          input :title
          input :league, as: :select, collection: ['apl', 'seria-a', 'bundesliga', 'laliga', 'chempions-league']
          input :picture, as: :file
          input :code
        end
        inputs 'Выбрать теги из списка' do
            f.has_many :taggings, new_record: 'Выбрать тег' do |t|
                t.input :tag, as: :select, collection: Tag.all
            end
        end
        inputs 'Добавить недостающие теги' do
            f.has_many :tags, new_record: 'Добавить новый тег' do |t|
                t.input :name
            end
        end
        actions
    end

end
