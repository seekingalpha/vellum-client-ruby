# frozen_string_literal: true

require "json"
require_relative "test_suite_run_deployment_release_tag_exec_config_request"
require_relative "test_suite_run_workflow_release_tag_exec_config_request"

module Vellum
  class TestSuiteRunExecConfigRequest
    attr_reader :member, :discriminant

    private_class_method :new
    alias kind_of? is_a?
    # @param member [Object]
    # @param discriminant [String]
    # @return [TestSuiteRunExecConfigRequest]
    def initialize(member:, discriminant:)
      # @type [Object]
      @member = member
      # @type [String]
      @discriminant = discriminant
    end

    # Deserialize a JSON object to an instance of TestSuiteRunExecConfigRequest
    #
    # @param json_object [JSON]
    # @return [TestSuiteRunExecConfigRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      member = case struct.type
               when "DEPLOYMENT_RELEASE_TAG"
                 TestSuiteRunDeploymentReleaseTagExecConfigRequest.from_json(json_object: json_object)
               when "WORKFLOW_RELEASE_TAG"
                 TestSuiteRunWorkflowReleaseTagExecConfigRequest.from_json(json_object: json_object)
               else
                 TestSuiteRunDeploymentReleaseTagExecConfigRequest.from_json(json_object: json_object)
               end
      new(member: member, discriminant: struct.type)
    end

    # For Union Types, to_json functionality is delegated to the wrapped member.
    #
    # @return [JSON]
    def to_json(*_args)
      case @discriminant
      when "DEPLOYMENT_RELEASE_TAG"
        { **@member.to_json, type: @discriminant }.to_json
      when "WORKFLOW_RELEASE_TAG"
        { **@member.to_json, type: @discriminant }.to_json
      else
        { "type": @discriminant, value: @member }.to_json
      end
      @member.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      case obj.type
      when "DEPLOYMENT_RELEASE_TAG"
        TestSuiteRunDeploymentReleaseTagExecConfigRequest.validate_raw(obj: obj)
      when "WORKFLOW_RELEASE_TAG"
        TestSuiteRunWorkflowReleaseTagExecConfigRequest.validate_raw(obj: obj)
      else
        raise("Passed value matched no type within the union, validation failed.")
      end
    end

    # For Union Types, is_a? functionality is delegated to the wrapped member.
    #
    # @param obj [Object]
    # @return [Boolean]
    def is_a?(obj)
      @member.is_a?(obj)
    end

    # @param member [TestSuiteRunDeploymentReleaseTagExecConfigRequest]
    # @return [TestSuiteRunExecConfigRequest]
    def self.deployment_release_tag(member:)
      new(member: member, discriminant: "DEPLOYMENT_RELEASE_TAG")
    end

    # @param member [TestSuiteRunWorkflowReleaseTagExecConfigRequest]
    # @return [TestSuiteRunExecConfigRequest]
    def self.workflow_release_tag(member:)
      new(member: member, discriminant: "WORKFLOW_RELEASE_TAG")
    end
  end
end
