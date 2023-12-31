# frozen_string_literal: true

require 'yaml'

# Module that can be included (mixin) to take and output Yaml data
module YmlBuddy
  def take_yaml(yaml)
    @data = YAML.load(yaml)
  end

  def to_yaml
    @data.to_yaml
  end
end
