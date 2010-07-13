require 'socket'
require 'rubygems'
require 'yaml'

=begin
class ProcessLog
	@@queue=nil

	def initialize
		@@queue=Queue.new
	end

	def self.spawner(server)
	#puts " PROCESS FORKED "	
	while(new_sock=server.accept)
			puts " CONNECTION ACCEPTED: by PID : #{$$}"
			t=Thread.new{handle_request(new_sock)}	
			t.join
	 end
    end  ## Function Ended


	 def self.handle_request(new_sock)
	#puts "inside thread"
	#fd=File.open("/store/temp","a+")
	#puts fd
	while	message = new_sock.gets
	
	#	fd.puts message
	#	puts message
		if message.include?("Bye") 
			#puts "connection closed"
			#new_sock.close
		end 
	        @book = Book.new
     		#puts @books
     		@book.testdata=message
     		@book.save
   
	end ## while ended
  end  ## Function Ended
	

end ## Class ProcessLOg Ended
=end




class LlloggerController < ApplicationController

   def list
      @lllogger = Lllogger.find(:all)
   end
   
   def show
      @lllogger = Lllogger.find(params[:id])
   end
   
   def new
      @lllogger = Lllogger.new
      #@subjects = Subject.find(:all)
   end
   
   def create
      puts "is everything ok"
      @lllogger = Lllogger.new(params[:lllogger])
      if @lllogger.save
            redirect_to :action => 'list'
      else
            #@subjects = Subject.find(:all)
            #render :action => 'new'
      end
   end 
      
   def edit
      @lllogger = Lllogger.find(params[:id])
   end
   
   def update
      @lllogger = Lllogger.find(params[:id])
      if @lllogger.update_attributes(params[:lllogger])
         redirect_to :action => 'show', :id => @lllogger
      else
         #@subjects = Subject.find(:all)
         #render :action => 'edit'
      end
   end
   
   def delete
      Lllogger.find(params[:id]).destroy
      redirect_to :action => 'list'
   end
   
   
   
   
   ##################  ##################   ##################
   ##################   MY STUFF STARTS    ##################  
   ##################  ##################  ##################
   
   
   def self.test
     puts " this is a  test method"
     server=TCPServer.open(12121)
   	 puts server
   	 puts "Server is ready to listen the requests"
   	 
   	 2.times do 
	
		fork do
			#puts "in the child"
		        spawner(server)
		end
	 end   
   	Process.waitall
   end ## Function Ended
   	 
   	 
   	
	def self.spawner(server)
	#puts " PROCESS FORKED "	
	while(new_sock=server.accept)
			puts " CONNECTION ACCEPTED: by PID : #{$$}"
			t=Thread.new{handle_request(new_sock)}	
			t.join
	 end
    end  ## Function Ended


	 def self.handle_request(new_sock)
	#puts "inside thread"

          while message=new_sock.read(8)
                puts "Control Bytes Read : " + message.length.to_s
                puts "UNPACKING MESSAGE STARTS"
                arr=message.unpack("a4N")
                puts arr[0]
                puts arr[1]
                puts arr[1].class
                str=arr[1]

                puts "RECVING INFO BYTES :"

                puts "YAMLised Hash (str) Recieved : "
                info_bytes=new_sock.read(arr[1])

                puts info_bytes

                puts ""
                puts "YAMLised Hash after converting to hash : calling YAML LOAD "
                puts ""

                log_hash=YAML::load(info_bytes)

                puts ""
                puts "CLASS AFTER YAML LOADING : " + log_hash.class.to_s

                puts ""
                puts "ITERATING THROUGH HASH NOW : "
                puts ""
                log_hash.each {|ele| p ele}
	
	        
                @lllogger = Lllogger.new
     		#puts @lllogger
     		@lllogger.message=log_hash['message']
     		@lllogger.class_name=log_hash['class_name']
                @lllogger.severity=log_hash['severity']
                @lllogger.process_id=log_hash['process_id']
                @lllogger.task_list_id =log_hash['task_list_id']
                @lllogger.time_at =log_hash['time_at']
                @lllogger.filename=log_hash['filename']
                @lllogger.task_id=log_hash['task_id']
                @lllogger.node_ip_address=log_hash['node_ip_address']
                @lllogger.task_name=log_hash['task_name']
                @lllogger.stack_trace=log_hash['stack_trace']
                @lllogger.function_name=log_hash['function_name']
                @lllogger.node_mac_address=log_hash['node_mac_address']
                @lllogger.module_name=log_hash['module_name']
     		@lllogger.task_command_line=log_hash['task_command_line']
     		@lllogger.node_name=log_hash['node_name']
     		@lllogger.line_number=log_hash['line_number']



                @lllogger.save
   
	end ## while ended
  end  ## Function Ended

       
end
