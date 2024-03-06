# frozen_string_literal: true

require "json"

module Vellum
  # A Node Result Event emitted from a Subworkflow Node.
  class SubworkflowNodeResult
    attr_reader :additional_properties

    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SubworkflowNodeResult]
    def initialize(additional_properties: nil)
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of SubworkflowNodeResult
    #
    # @param json_object [JSON]
    # @return [SubworkflowNodeResult]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      JSON.parse(json_object)
      new(additional_properties: struct)
    end

    # Serialize an instance of SubworkflowNodeResult to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      {}.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:); end
  end
end
