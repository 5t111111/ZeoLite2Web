import GraphQL

let graphqlSchema = try! GraphQLSchema(
    query: try! GraphQLObjectType(
        name: "RootQueryType",
        fields: [
            "hello": GraphQLField(
                type: GraphQLString,
                resolve: { _, _, _, _ in "world" }
            ),
            "countryCode": GraphQLField(
                type: GraphQLString,
                resolve: { _, _, _, _ in "world" }
            ),
        ]
    )
)
