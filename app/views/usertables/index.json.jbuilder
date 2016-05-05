json.array!(@usertables) do |usertable|
  json.extract! usertable, :id, :name, :pwd
  json.url usertable_url(usertable, format: :json)
end
