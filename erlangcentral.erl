-module(erlangcentral).
-author("Driebit <tech@driebit.nl>").

-mod_title("erlangcentral").
-mod_description("").
-mod_prio(10).
-mod_depends([mod_ginger_base]).

-mod_schema(672).

-include_lib("zotonic.hrl").

-export([
    init/1,
    observe_search_query/2,
    observe_custom_pivot/2,
    manage_schema/2,
    observe_acl_is_allowed/2
]).

init(Context) ->
    z_pivot_rsc:define_custom_pivot(vacancy, [
        {location, "varchar(2)"},
        {type, "varchar(80)"},
        {workplace, "varchar(10)"}
    ], Context),
        ok.

manage_schema(install, Context) ->
    erlangcentral_data_fixtures:load(Context);
manage_schema(_, Context) ->
    manage_schema(install, Context).

observe_search_query({search_query, {ginger_distinct_country, [{category,Category}]}, _OffsetLimit}, Context) ->
    {ok, CategoryId} = m_category:name_to_id(Category, Context),
    %% Note: check on joined jobs if they are also published & active
    QueryResult = z_db:q(
        "select distinct c.pivot_country from rsc c
        join edge e on c.id = e.object_id and e.predicate_id = $1
        join rsc j on j.id = e.subject_id and j.is_published='t' and j.publication_end > now()
        where c.pivot_country is not null and c.is_published='t' and c.category_id = $2
        order by c.pivot_country
        ",
        [
            m_rsc:name_to_id_check(hascompany, Context),
            CategoryId
        ],
        Context
    ),
    QueryResult;
observe_search_query(#search_query{}, _Context) ->
    undefined.

observe_custom_pivot({custom_pivot, Id}, Context) ->
    Company = m_rsc:o(Id, hascompany, 1, Context),
    Location = m_rsc:p(Company, address_country, Context),
    Workplace = m_rsc:p(Id, workplace, "both", Context),

    Type = m_rsc:p(Id, type, Context),

    {vacancy, [
        {location, Location},
        {type, Type},
        {workplace, Workplace}
    ]}.


observe_acl_is_allowed(#acl_is_allowed{action = update, object = person_profile}, Context) ->
    %% Retrieve object for ACL checking on its contents

    z_acl:is_allowed(update, z_context:get_q(<<"id">>, Context), Context);
observe_acl_is_allowed(#acl_is_allowed{}, _Context) ->
    undefined.
