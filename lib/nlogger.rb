
module Nlogger
  # options can be:
  # :status_code
  # :controller
  # :action 
  # :caller
  # :exception
  # :object
  # :start_time
  # :end_time
  
  def self.Log(level, message, options={})
    ret_string = ''

    case level
      when 'INFO'
        ret_val = send_logging_service(level, message, options)
      when 'ERROR'
        # send email
        ret_string = send_logging_service(level, message, options)
        send_email(level, message, options)
      when 'FIRE'
        # send email
        ret_string = send_logging_service(level, message, options)
        send_email(level, message, options)
      when 'DEBUG'
        # do nothing .. the logging has been already done in the file
        ret_string = send_logging_service(level, message, options)
      when 'DATA'
        # send email
        ret_string = send_logging_service(level, message, options)
        send_email(level, message, options)
      else
        # wrong level, throw error
        ret_string = ''
    end # end of case level

    return ret_string

  end

  private
  def self.send_email(level, message, options={})
    #NloggerMailer.notify(get_small_message(level, message), get_detailed_message(level, message, options)).deliver
  end

  def self.send_logging_service(level, message, options)
    if options[:exception].present?
      #Rollbar.report_exception(options[:exception])
    else
      #Rollbar.report_message(message, level, :caller => options[:caller], :object => options[:object])
    end

    return get_detailed_message(level,message,options)

  end

  def self.get_small_message(level, message)
    "Level => #{level} Message => #{message.truncate(7, separator: ' ')}"
  end

  def self.get_detailed_message(level, message, options)
    detailed_message = '<br/>'
    detailed_message << "<strong> Level </strong> => #{level}" << '<br/> <br/>'
    detailed_message << "<strong> Message </strong> => #{message}" << '<br/> <br/>'
    if options.present?
      if options[:exception].present?
        detailed_message << "<strong> Exception </strong> => #{options[:exception].inspect}" << '<br/> <br/>'
        detailed_message << "<strong> Exception details </strong> => #{options[:exception].to_yaml}" << '<br/> <br/>'
        detailed_message << "<strong> Exception backtrace </strong> => #{options[:exception].backtrace.inspect}" << '<br/> <br/>'
      end
      detailed_message << "<strong> Options object </strong> => #{options.to_yaml}" << '<br/> <br/>'
    end
    detailed_message.html_safe
  end

end