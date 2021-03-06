require 'active_support'
require 'active_support/core_ext'
require 'erb'
require 'active_support/inflector'
require_relative './session'

class ControllerBase
  attr_reader :req, :res, :params

  # Setup the controller
  def initialize(req, res)
    @req = req
    @res = res
    @already_built_response = false
  end

  # Helper method to alias @already_built_response
  def already_built_response?
    @already_built_response
  end

  # Set the response status code and header
  def redirect_to(url)
    raise "You've already redirected" if @already_built_response
    @already_built_response = false
    @res.location = url
    @res.status = 302

    @already_built_response = true

    session.store_session(@res)
  end

  # Populate the response with content.
  # Set the response's content type to the given type.
  # Raise an error if the developer tries to double render.
  def render_content(content, content_type)
    raise "You've already rendered this content" if @already_built_response
    @already_built_response = false
    @res.write(content)
    @res['Content-Type'] = content_type

    @already_built_response = true
    
    session.store_session(@res)
  end

  # use ERB and binding to evaluate templates
  # pass the rendered html to render_content
  def render(template_name)
    fn = File.join("views", self.class.to_s.underscore, template_name.to_s.underscore) + ".html.erb"
    contents = ERB.new(File.read(fn)).result(binding)
    render_content(contents, 'text/html')
  end


  # method exposing a `Session` object
  def session
    @session ||= Session.new(@req)
  end

  # use this with the router to call action_name (:index, :show, :create...)
  def invoke_action(name)
  end
end

# p File.dirname(__FILE__)

