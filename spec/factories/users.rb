FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 { Faker::Internet.free_email }
    password              {'aaa111'}
    encrypted_password    {"aaa111"}
    password_confirmation {password}
    last_name {"山田"}
    last_name_kana {"ヤマダ"}
    first_name {"太郎"}
    first_name_kana {"タロウ"}
    birth_date {"2000-01-01"}
  end
end