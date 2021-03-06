class CoursesController < ApplicationController
  before_action :set_course, only: %i[ show edit update destroy ]

  # GET /courses or /courses.json
  def index
    @department = Department.find(params[:department_id])
    @course = @department.courses.create(course_params)
    @courses = Course.all
  end

  # GET /courses/1 or /courses/1.json
  def show
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses or /courses.json
 
    #@article = Article.find(params[:article_id])
    #@comment = @article.comments.create(comment_params)
   # redirect_to article_path(@article)
  #end

    def create
      @department = Department.find(params[:department_id])
      @course = @department.courses.create(course_params)
         
    #@course = Course.new(course_params)
    redirect_to department_path(@department)
    #respond_to do |format|
     # if @course.save
      #  format.html { redirect_to @course, notice: "Course was successfully created." }
       # format.json { render :show, status: :created, location: @course }
      #else
       # format.html { render :new, status: :unprocessable_entity }
        #format.json { render json: @course.errors, status: :unprocessable_entity }
      #end
    #end
  end

  # PATCH/PUT /courses/1 or /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: "Course was successfully updated." }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1 or /courses/1.json
 
  def destroy
    @department = Department.find(params[:course_name])
   
    @course = @department.courses.find(course_params)
    @course.destroy
    redirect_to department_path(@department)
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def course_params
      params.require(:course).permit(:course_name,:department_id)
    end
end
