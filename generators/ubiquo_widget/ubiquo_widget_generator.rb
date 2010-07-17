class UbiquoWidgetGenerator < Rails::Generator::NamedBase

  def initialize(*runtime_args)
    super(*runtime_args)
  end

  def manifest
    record do |m|
      break if @name.blank?
      m.directory('app/models/widgets')
      m.directory(File.join('app/widgets'))
      m.directory(File.join('app/views/widgets/', @name, 'ubiquo'))
      m.directory(File.join('test/unit/widgets'))
      m.directory(File.join('test/functional/widgets/ubiquo'))
      
      m.template('widget.rb.erb', File.join('app/widgets', "#{@name}_widget.rb"))
      m.template('views/_show.html.erb', File.join('app/views/widgets', @name, "_show.html.erb"))
      m.template('views/ubiquo/_form.html.erb', File.join('app/views/widgets', @name, "ubiquo", "_form.html.erb"))
      m.template('models/component.rb.erb', File.join('app/models/widgets', "#{@name}.rb"))

      m.template('test/unit/widget_test.rb.erb', File.join('test/unit/widgets', "#{@name}_test.rb"))
      m.template('test/functional/widget_test.rb.erb', File.join('test/functional/widgets', "#{@name}_test.rb"))
      m.template('test/functional/ubiquo/widget_test.rb.erb', File.join('test/functional/widgets/ubiquo', "#{@name}_test.rb"))
      m.ubiquo_widget @name
    end
  end

  protected
  
  def banner
    "Usage: #{$0} ubiquo_widget example_widget [attribute:type]"
  end

#  def add_options!(opt)
#    opt.separator ''
#    opt.separator 'Options:'
#    opt.on("--templates template_key, template_key2", Array,
#      "Relate widget with these templates") { |v| options[:templates] = v }
#  end
end
