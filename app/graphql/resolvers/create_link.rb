class Resolvers::CreateLink < GraphQL::Function
  # passed as "args"
  argument :description, !types.String
  argument :url, !types.String

  # return type of the mutation
  type Types::LinkType

  def call(_obj, args, ctx)
    Link.create!(
      description: args[:description],
      url: args[:url],
      user: ctx[:current_user]
    )

  rescue ActiveRecord::RecordInvalid => e
    GraphQL::ExecutionError.new(e.record.errors.full_messages)
  end
end
