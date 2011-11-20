class CommentsController < ApplicationController
  
  def create
    @sfdc = Databasedotcom::Client.new("config/databasedotcom.yml")
    @sfdc.authenticate :token => session[:token], :instance_url => ENV['sfdc_instance_url']
    @sfdc.materialize("CaseComment") 
    comment = CaseComment.create('CommentBody' => params[:comment][:description],'ParentId' => params[:comment][:case_id],'IsPublished' => true)

    result  = "<div class='comments'><div class='label'>XYZ said:</div><div class='comment'>"
    result += comment['CommentBody']
    result += "</div><div class='clear'></div></div>"
    render :text => result.html_safe
  end
end
