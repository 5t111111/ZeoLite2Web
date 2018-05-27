import GraphQL

extension Name : MapFallibleRepresentable {}

let NameType = try! GraphQLObjectType(
    name: "Name",
    description: "A name of a country in a certain locale",
    fields: [
        "locale": GraphQLField(
            type: GraphQLString,
            description: "Locale"
        ),
        "value": GraphQLField(
            type: GraphQLString,
            description: "Name"
        ),
    ],
    interfaces: [],
    isTypeOf: { source, _, _ in
        source is Name
    }
)
