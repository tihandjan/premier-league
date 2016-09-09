FactoryGirl.define do
  factory :article do
    title "MyString MyString MyString"
    summary "MyString MyString MyString"
    description "MyString MyString MyString"
    category "article"
    picture { fixture_file_upload(Rails.root.join('spec', 'photos', 'test.png'), 'image/png') }
    factory :news do
      category "news"
    end
  end
end
