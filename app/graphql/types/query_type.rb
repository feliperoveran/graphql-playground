Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  field :allLinks, !types[Types::LinkType] do
    resolve -> (obj, args, ctx) { Link.includes(:user, votes: [:user]).all }
  end
end
