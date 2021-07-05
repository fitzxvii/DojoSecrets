FactoryBot.define do
    factory :user do
        name { "Fitz Villegas" }
        email { "fitz@gmail.com" }
        password {"password" }
        password_confirmation { "password" }
    end
end
