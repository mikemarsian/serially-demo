require 'hirb'
Hirb.enable :output=>{
    "Serially::TaskRun"=>{ :options=>{:fields=>%w{id item_class item_id task_name status result_message finished_at}} }
}, :width => 155