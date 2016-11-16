json.extract! register_school, :id, :school_name, :address, :city, :state, :pin_code, :affiliated_board, :created_at, :updated_at
json.url register_school_url(register_school, format: :json)