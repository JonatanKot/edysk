class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    folder = Folder.create!(:name => '/')
    if folder.save
      @user.folder = folder
      session[:folder] = folder
      if @user.save
        session[:user_id] = @user.id
        redirect_to users_path
      else
        render :new
      end
    else
      render :new
    end
  end

  def show
    @user = User.find(session[:user_id])
  end

  def index
    @user = User.find(session[:user_id])
    @folder = Folder.find(session[:folder_id])
  end

  def upload
    #@user = User.find(session[:user_id])
    folder = Folder.find(session[:folder_id])
    #@user.files.attach(io: File.open('/home/marek/Downloads/9f5.gif'), filename: '9f5.gif')
    folder.files.attach(params[:files])
    redirect_to users_path
  end

  def remove
    folder = Folder.find(session[:folder_id])
    folder.files[params[:file_id].to_i].purge
    redirect_to users_path
  end
  
  def removef
    folder = Folder.find(params[:folder_id].to_i)
    folder.files.purge
    folder.destroy
    redirect_to users_path
  end
  
  def chdir
    session[:folder_id] = params[:folder_id].to_i
    redirect_to users_path
  end
  
  def create_folder
    folder = Folder.find(session[:folder_id])
    Folder.create!(:name => params[:name]).move_to_child_of(folder)
    redirect_to users_path
  end
  
  def change_filename
    folder = Folder.find(session[:folder_id])
    folder.files[params[:file_id].to_i].blob.update!(filename: params[:name])
    redirect_to users_path
  end
  
  def change_dirname
    folder = Folder.find(params[:folder_id].to_i)
    folder.name = params[:name]
    folder.save
    redirect_to users_path
  end
  
  def generate_link
    folder = Folder.find(session[:folder_id])
    folder.links.create(:link => params[:link], :fid => params[:fid])
    folder.save
    redirect_to users_path
  end
  
  def remove_link
    folder = Folder.find(session[:folder_id])
    folder.links.delete(params[:link_id].to_i)
    folder.save
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
