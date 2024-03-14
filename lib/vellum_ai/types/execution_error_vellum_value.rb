# frozen_string_literal: true

require_relative "vellum_error"
require "json"

module Vellum
  class ExecutionErrorVellumValue
    attr_reader :id, :name, :value, :additional_properties

    # @param id [String] The variable's uniquely identifying internal id.
    # @param name [String]
    # @param value [VellumError]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [ExecutionErrorVellumValue]
    def initialize(id:, name:, value: nil, additional_properties: nil)
      # @type [String] The variable's uniquely identifying internal id.
      @id = id
      # @type [String]
      @name = name
      # @type [VellumError]
      @value = value
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of ExecutionErrorVellumValue
    #
    # @param json_object [JSON]
    # @return [ExecutionErrorVellumValue]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = struct.id
      name = struct.name
      if parsed_json["value"].nil?
        value = nil
      else
        value = parsed_json["value"].to_json
        value = VellumError.from_json(json_object: value)
      end
      new(id: id, name: name, value: value, additional_properties: struct)
    end

    # Serialize an instance of ExecutionErrorVellumValue to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      { "id": @id, "name": @name, "value": @value }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.value.nil? || VellumError.validate_raw(obj: obj.value)
    end
  end
end
