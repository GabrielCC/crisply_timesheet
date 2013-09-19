require httparty


HTTParty.get 'http://google.com'

# require 'rest_client'
# uri = 'https://gabrielcc.crisply.com/crisply_sources/sources/data?token=bCZtj0Mu7-Ugt2rrxy7y-A'
# options = '{"timestamp":"now","description":"am petrecut 4 ore pe issue 3","activity_type":"task","project":{"name":"Freelancer project","id":"Freelancer project"},"duration":4.0,"user":{"email":"admin@example.net","name":"Redmine Admin","id":"admin"}}'
# RestClient.post uri , options, :content_type => :json, :accept => :json

curl -X POST -H "Content-Type: application/json" -d '{"timestamp":"now","description":"testing this bug","user":{"name":"Redmine Admin","id":"admin","email":"admin@example.net"},"duration":3.0,"project":{"name":"other project","id":"other project"},"activity_type":"task"}' https://gabrielcc.crisply.com/crisply_sources/sources/data?token=V5nKwof4M7x2oMaUyOU9CA

curl -X POST -H "Content-Type: application/json" -d '{"timestamp":"now","description":"testing this bug","user":{"name":"Redmine Admin","id":"admin","email":"admin@example.net"},"duration":3.0,"project":{"name":"other project","id":"other project"},"activity_type":"task"}' https://gabrielcc.crisply.com/crisply_sources/sources/data?token=6UJJiZldFdp1Dz5VNZ49zA
