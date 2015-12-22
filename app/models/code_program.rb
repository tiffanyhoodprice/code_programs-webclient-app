class CodeProgram

attr_accessor :id, :keywords, :organization_name, :website, :mission_description, :population_focus, :time_commitment, :cost, :languages_courses, :address, :city, :state, :zip, :locations, :leadership_contact, :title, :email, :phone_number, :when_founded

  def initialize(hash)
    @id = hash["id"]
    @keywords = hash["keywords"]
    @organization_name = hash["organization_name"]
    @website = hash["website"]
    @mission_description = hash["mission_description"]
    @population_focus = hash["population_focus"]
    @time_commitment = hash["time_commitment"]
    @cost = hash["cost"]
    @languages_courses = hash["languages_courses"] 
    @address = hash["address"]
    @city = hash["city"]
    @state = hash["state"]
    @zip = hash["zip"]
    @locations = hash["locations"]
    @leadership_contact = hash["leadership_contact"]
    @title = hash["title"]
    @email = hash["email"]
    @phone_number = hash["phone_number"]
    @when_founded = hash["when_founded"]
  end

  def self.find(id)
    code_program_hash = Unirest.get("#{ENV['API_BASE_URL']}/code_programs/#{id}.json").body
    CodeProgram.new(code_program_hash)
  end

  def self.all
    code_programs = []
    code_program_hashes = Unirest.get("#{ENV['API_BASE_URL']}/code_programs.json").body
    code_program_hashes.each do |code_program_hash|
      code_programs << CodeProgram.new(code_program_hash)
    end
    return code_programs
  end

  def destroy 
    Unirest.delete("#{ENV['API_BASE_URL']}/code_programs/#{id}.json").body
    # redirect_to "/api/v1/code_programs"
    #not self because this is an instance method
  end


  def self.create(attributes)
    code_program_hash = Unirest.post("#{ENV['API_BASE_URL']}/code_programs.json", headers: {"Accept" => "application/json"}, 
      parameters: attributes).body  
      #               keywords: params[:keywords], 
      #               organization_name: params[:organization_name], 
      #               website: params[:website],
      #               mission_description: params[:mission_description], 
      #               population_focus: params[:population_focus],
      #               time_commitment: params[:time_commitment], 
      #               cost: params[:cost], 
      #               languages_courses: params[:languages_courses], 
      #               address: params[:address], 
      #               city: params[:city], 
      #               state: params[:state], 
      #               zip: params[:zip], 
      #               locations: params[:locations], 
      #               leadership_contact: params[:leadership_contact], 
      #               title: params[:title], 
      #               email: params[:email], 
      #               phone_number: params[:phone_number], 
      #               when_founded: params[:when_founded]
      #             }
      # ).body
    CodeProgram.new(code_program_hash)
  end

  def update(attributes)
    code_program_hash = Unirest.patch("#{ENV['API_BASE_URL']}/code_programs/#{id}.json", headers: {"Accept" => "application/json"}, parameters: attributes).body
    # CodeProgram.new(employee_hash)
  end
end
