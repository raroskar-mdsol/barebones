module Barebones
  class API < Grape::API
    prefix "api"
    version "v1", using: :path
    default_format :json
    format :json

    mount ::Barebones::V1::Ping
    add_swagger_documentation api_version: 'v1'

    # add_swagger_documentation(
    #     info: {
    #         title: "Barebones",
    #         description: "A set of apis required for Patient Profile App.",
    #         contact_name: "Patient Profile Team"
    #     },
    #     api_version: "v1",
    #     hide_documentation_path: true,
    #     mount_path: "/api/v1/swagger_doc",
    #     hide_format: true
    # )
  end
end