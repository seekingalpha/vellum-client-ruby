# frozen_string_literal: true

require_relative "vellum_error"
require "json"

module Vellum
  # Output for a test suite run metric that is of type ERROR
  class TestSuiteRunMetricErrorOutput
    attr_reader :value, :name, :additional_properties

    # @param value [VellumError]
    # @param name [String]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TestSuiteRunMetricErrorOutput]
    def initialize(value:, name:, additional_properties: nil)
      # @type [VellumError]
      @value = value
      # @type [String]
      @name = name
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of TestSuiteRunMetricErrorOutput
    #
    # @param json_object [JSON]
    # @return [TestSuiteRunMetricErrorOutput]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["value"].nil?
        value = nil
      else
        value = parsed_json["value"].to_json
        value = VellumError.from_json(json_object: value)
      end
      name = struct.name
      new(value: value, name: name, additional_properties: struct)
    end

    # Serialize an instance of TestSuiteRunMetricErrorOutput to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      { "value": @value, "name": @name }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      VellumError.validate_raw(obj: obj.value)
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
    end
  end
end
