local CustomHandler = {
  VERSION  = "0.1.0",
  PRIORITY = 2000,
}

function CustomHandler:init_worker()
  -- Implement logic for the init_worker phase here (http/stream)
  kong.log("init_worker")
  self.echo_string = ""
end


function CustomHandler:preread(config)
  -- Implement logic for the preread phase here (stream)
  kong.log("preread")
end


function CustomHandler:certificate(config)
  -- Implement logic for the certificate phase here (http/stream)
  kong.log("certificate")
end

function CustomHandler:rewrite(config)
  -- Implement logic for the rewrite phase here (http)
  kong.log("rewrite")
end

function CustomHandler:access(config)
  -- Implement logic for the rewrite phase here (http)
  kong.log("access")
  self.echo_string = kong.request.get_header(conf.requestHeader)
end

function CustomHandler:header_filter(config)
  -- Implement logic for the header_filter phase here (http)
  kong.log("header_filter")
  kong.log("In EchoHandler:header_filter(). self.echo_string is: ")

  if self.echo_string ~= nil and self.echo_string ~= "" then
    kong.response.set_header(conf.responseHeader, self.echo_string)
  end
end

function CustomHandler:body_filter(config)
  -- Implement logic for the body_filter phase here (http)
  kong.log("body_filter")
end

function CustomHandler:log(config)
  -- Implement logic for the log phase here (http/stream)
  kong.log("log")
end

-- return the created table, so that Kong can execute it
return CustomHandler
