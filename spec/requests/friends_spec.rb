require 'rails_helper'

describe "Friends API", type: :request do
  it "gets a list of all profiles" do
    Friend.create(name: 'Bob', age: 20, enjoys: 'CoD')
    get '/friends'
    json = JSON.parse(response.body)
    expect(response).to have_http_status(:ok)
    expect(json.length).to eq 1
  end

  it "creates a profile" do
    friend_params = {
      friend: {
        name: 'Jimbo',
        age: 16,
        enjoys: "sleeping"
      }
    }

    post '/friends', params: friend_params
    expect(response).to have_http_status(:ok)
    new_friend = Friend.first
    expect(new_friend.name).to eq('Jimbo')
  end

  it "doesn't create a profile without a name" do
    friend_params = {
      friend: {
        age: 15,
        enjoys: 'apple pie'
      }
    }

    post '/friends', params: friend_params
    expect(response.status).to eq 422
    json = JSON.parse(response.body)
    expect(json['name']).to include "can't be blank"
  end

end
