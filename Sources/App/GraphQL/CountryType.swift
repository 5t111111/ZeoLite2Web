import GraphQL

extension Country : MapFallibleRepresentable {}

let CountryType = try! GraphQLObjectType(
    name: "Country",
    description: "A country",
    fields: [
        "code": GraphQLField(
            type: GraphQLString,
            description: "The iso code of the country."
        ),
        "names": GraphQLField(
            type: GraphQLList(NameType),
            description: "The names of the country in various languages."
        )
    ],
    interfaces: [],
    isTypeOf: { source, _, _ in
        source is Country
    }
)