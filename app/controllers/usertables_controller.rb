class UsertablesController < ApplicationController
  #再进行下面操作时通过id查询到相应的对象
  before_action :set_usertable, only: [:show, :edit, :update, :destroy]

  #查询所有的记录 # GET /usertables   # GET /usertables.json
  def index
    @usertables = Usertable.all
  end

  #删除用户信息 # DELETE /usertables/1  # DELETE /usertables/1.json
  def destroy
    @usertable.destroy
    respond_to do |format|
      format.html { redirect_to usertables_url, notice: '用户已经成功删除.' }
      format.json { head :no_content }
    end
  end
  #跳转到添加用户页面 # GET /usertables/new
  def new
    @usertable = Usertable.new
  end

  #创建一个用户 # POST /usertables  # POST /usertables.json
  def create
    @usertable = Usertable.new(usertable_params)
    respond_to do |format|
      if @usertable.save
        format.html { redirect_to @usertable, notice: '用户保存成功.' }
        format.json { render :show, status: :created, location: @usertable }
      else
        format.html { render :new }
        format.json { render json: @usertable.errors, status: :unprocessable_entity }
      end
    end
  end
  # GET /usertables/1
  # GET /usertables/1.json
  def show
  end
  # GET /usertables/1/edit
  def edit
  end
  # PATCH/PUT /usertables/1
  # PATCH/PUT /usertables/1.json
  def update
    respond_to do |format|
      if @usertable.update(usertable_params)
        format.html { redirect_to @usertable, notice: '用户信息更新成功.' }
        format.json { render :show, status: :ok, location: @usertable }
      else
        format.html { render :edit }
        format.json { render json: @usertable.errors, status: :unprocessable_entity }
      end
    end
  end



  private
  def set_usertable
    @usertable = Usertable.find(params[:id])
  end


    # Never trust parameters from the scary internet, only allow the white list through.
    def usertable_params
      params.require(:usertable).permit(:name, :pwd)
    end
end
