class Admin::TicketHomesController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:destroy]  
  access_control do
      allow :admin, :all
  end  
  layout "inadmin"  
  uses_tiny_mce :options => {
                              :theme => 'advanced',
                              :theme_advanced_resizing => true,
                              :theme_advanced_resize_horizontal => false,
                              :theme_advanced_buttons1 => %w{ newdocument | bold italic underline strikethrough | justifyleft justifycenter justifyright justifyfull styleselect formatselect fontselect fontsizeselect },
                              :theme_advanced_buttons2 => %w{ cut copy paste pastetext pasteword | search replace | bullist numlist | outdent indent blockquote | undo redo | link unlink anchor image cleanup help code | insertdate inserttime preview | forecolor backcolor},
                              :theme_advanced_buttons3 => %w{ tablecontrols | hr removeformat visualaid | sub sup | charmap emotions iespell media advhr | print | ltr rtl | fullscreen},
                              :theme_advanced_buttons4 => %w{ insertlayer moveforward movebackward absolute | styleprops | cite abbr acronym del ins attribs | visualchars nonbreaking pagebreak},
                              #:plugins => %w{ table fullscreen }
                              :extended_valid_elements => "iframe[src|width|height|name|align]",
                              :plugins => %w{ safari pagebreak style layer table save advhr advimage advlink emotions iespell inlinepopups insertdatetime preview media searchreplace print contextmenu paste directionality fullscreen noneditable visualchars nonbreaking xhtmlxtras template},
                              :width =>"100%",
                            	:height =>"400"
                            }  
  
  def index
    @ticket_homes = TicketHome.all_active
    if (@ticket_homes.count > 0)
      redirect_to admin_ticket_home_path(@ticket_homes.first)
    else
      redirect_to new_admin_ticket_home_path
    end  
  end

  def show
    @ticket_home = TicketHome.find(params[:id])
  end

  def new
    @ticket_homes = TicketHome.all_active
    if !(@ticket_homes.count > 0)
      @ticket_home = TicketHome.new
    else
      redirect_to admin_ticket_homes_path
    end
  end

  def create
    @ticket_home = TicketHome.new(params[:ticket_home])
    @ticket_home.published = true
    @ticket_home.active = true
    if @ticket_home.save
      redirect_to [:admin, @ticket_home], :notice => "Successfully created ticket home."
    else
      render :action => 'new'
    end
  end

  def edit
    @ticket_home = TicketHome.find(params[:id])
  end

  def update
    @ticket_home = TicketHome.find(params[:id])
    if @ticket_home.update_attributes(params[:ticket_home])
      redirect_to [:admin, @ticket_home], :notice  => "Successfully updated ticket home."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @ticket_home = TicketHome.find(params[:id])
    @ticket_home.newdestroy
    redirect_to admin_ticket_homes_url, :notice => "Successfully destroyed ticket home."
  end
end
