class CodeProgramsController < ApplicationController
  
  def index
      @code_programs = CodeProgram.all
  end

  def show
    @code_program = CodeProgram.find(params[:id])
  end
  

  def create
    @code_program = CodeProgram.create(keywords: params[:keywords], 
                    organization_name: params[:organization_name], 
                    website: params[:website],
                    mission_description: params[:mission_description], 
                    population_focus: params[:population_focus],
                    time_commitment: params[:time_commitment], 
                    cost: params[:cost], 
                    languages_courses: params[:languages_courses], 
                    address: params[:address], 
                    city: params[:city], 
                    state: params[:state], 
                    zip: params[:zip], 
                    locations: params[:locations], 
                    leadership_contact: params[:leadership_contact], 
                    title: params[:title], 
                    email: params[:email], 
                    phone_number: params[:phone_number], 
                    when_founded: params[:when_founded])
    redirect_to "/code_programs/#{@code_program.id}"
  end


  # def create
  #   @code_program = Unirest.post("http://localhost:3000/code_programs.json", headers: {"Accept" => "application/json"}, 
  #     parameters: { 
  #                   keywords: params[:keywords], 
  #                   organization_name: params[:organization_name], 
  #                   website: params[:website],
  #                   mission_description: params[:mission_description], 
  #                   population_focus: params[:population_focus],
  #                   time_commitment: params[:time_commitment], 
  #                   cost: params[:cost], 
  #                   languages_courses: params[:languages_courses], 
  #                   address: params[:address], 
  #                   city: params[:city], 
  #                   state: params[:state], 
  #                   zip: params[:zip], 
  #                   locations: params[:locations], 
  #                   leadership_contact: params[:leadership_contact], 
  #                   title: params[:title], 
  #                   email: params[:email], 
  #                   phone_number: params[:phone_number], 
  #                   when_founded: params[:when_founded]
  #                 }).body

  #   redirect_to "/code_programs/#{@code_program['id']}"
  # end

  def new
  end

  def edit
    @code_program = CodeProgram.find(params[:id])
  end

  def search
    search_params = params[:search_params]  
    @code_programs = CodeProgram.search(search_params)
    # p @code_programs
    if @code_programs.empty?
      flash[:notice] = "Your search returned no results."
    end
    render :index
    
  end
  
  def update #doing something on particular code program, so instance method)
    @code_program = CodeProgram.find(params[:id])
    if @code_program.update(keywords: params[:keywords], 
                    organization_name: params[:organization_name], 
                    website: params[:website],
                    mission_description: params[:mission_description], 
                    population_focus: params[:population_focus],
                    time_commitment: params[:time_commitment], 
                    cost: params[:cost], 
                    languages_courses: params[:languages_courses], 
                    address: params[:address], 
                    city: params[:city], 
                    state: params[:state], 
                    zip: params[:zip], 
                    locations: params[:locations], 
                    leadership_contact: params[:leadership_contact], 
                    title: params[:title], 
                    email: params[:email], 
                    phone_number: params[:phone_number], 
                    when_founded: params[:when_founded]) 
                    p "In update action of webclient"  
      redirect_to "/code_programs/#{@code_program.id}"
    else
      redirect_to "/"
    end
  end


  def destroy
    # Unirest.delete("http://localhost:3000/code_programs/#{params[:id]}.json").body  - #Instance method for this one.
    @code_program = CodeProgram.find(params[:id])
    p "this is the object: #{@code_program}"
    @code_program.destroy

    # Unirest.delete("http://localhost:3000/code_program/#{params[:id]}.json").body
    redirect_to "/code_programs"
  end
end
