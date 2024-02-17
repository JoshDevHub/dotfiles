require 'reline/face'

Reline::Face.config(:completion_dialog) do |conf|
  conf.define(:default, foreground: "#cad3f5", background: "#363a4f")
  conf.define(:enhanced, foreground: "#cad3f5", background: "#5b6078")
  conf.define(:scrollbar, foreground: "#c6a0f6", background: "#181926")
end

IRB.conf[:EVAL_HISTORY] = 25

def cp(string)
  `echo "#{string}" | xsel -ib`
  puts "copied to clipboard"
end

if defined? Rails
  banner = if Rails.env.production?
             "\e[38;2;237;135;150m #{Rails.env} \e[0m"
           else
             "\e[38;2;166;218;149m #{Rails.env} \e[0m"
           end

  IRB.conf[:PROMPT][:CUSTOM] = IRB.conf[:PROMPT][:DEFAULT].merge(
    PROMPT_I: banner + IRB.conf[:PROMPT][:DEFAULT][:PROMPT_I]
  )

  IRB.conf[:PROMPT_MODE] = :CUSTOM
end
