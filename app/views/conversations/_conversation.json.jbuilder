json.extract! conversation, :id, :topic, :user_id, :trainer_id, :created_at, :updated_at
json.url conversation_url(conversation, format: :json)