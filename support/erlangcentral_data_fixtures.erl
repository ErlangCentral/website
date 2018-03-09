-module(erlangcentral_data_fixtures).
-author("Driebit <tech@driebit.nl>").

-export([
    load/1
]).

-include_lib("zotonic.hrl").

%% @doc Load data fixtures
load(Context) ->
    ginger_config:install_config(
        [
            {mod_geo, api_key, "AIzaSyDhQeGj4zk6K60ymnpdKTgO1qD2xJbW-F8"},
            {site, disqus, "erlangcentral-docker"},
            {i18n, language, en}
        ],
        Context
    ),

    schema:load(get_prod_data(Context), Context),

    case ginger_environment:is_prod(Context) of
        false ->
            schema:load(get_dev_data(Context), Context);
        true ->
            noop
    end,

    case ginger_environment:is_dev(Context) of
        true ->
            install_menu(Context);
        false ->
            noop
    end,

    ok.

install_menu(Context) ->
    mod_menu:set_menu(
        m_rsc:rid(main_menu, Context),
        [
            {blogs, []},
            {jobs, []},
            {events, []},
            {developer, []},
            {page_about, []}
        ],
        z_acl:sudo(Context)
    ),
    mod_menu:set_menu(
        m_rsc:rid(footer_menu, Context),
        [
            {blogs, []},
            {events, []},
            {jobs, []},
            {downloads, []}
        ],
        z_acl:sudo(Context)
    ),
    mod_menu:set_menu(
        m_rsc:rid(footer_extra_menu, Context),
        [
            {contact, []},
            {signup_tos, []}
        ],
        z_acl:sudo(Context)
    ).

%% @doc This data is only loaded in dev environment
get_dev_data(_Context) ->
    #datamodel{
        resources = [
            {blogs, text, [
                {title, <<"Blogs">>},
                {page_path, <<"/blogs">>}
            ]},
            {jobs, text, [
                {title, <<"Jobs">>},
                {page_path, <<"/jobs">>}
            ]},
            {events, text, [
                {title, <<"Events">>},
                {page_path, <<"/events">>}
            ]},
            {wiki, text, [
                {title, <<"Wiki">>},
                {page_path, <<"/wiki">>},
                {website, <<"https://erlangcentral.org/wiki/Main_Page">>},
                {is_website_redirect, true}
            ]},
            {page_about, text, [
                {title, <<"About">>},
                {page_path, <<"/about">>}
            ]},
            {developer, text, [
                {title, <<"Developer">>}
            ]},
            {downloads, text, [
                {title, <<"Downloads">>},
                {page_path, <<"/downloads">>}
            ]},
            {contact, text, [
                {title, <<"Contact us">>},
                {page_path, <<"/contact">>}
            ]},
            {signup_tos, text, [
                {title, <<"Terms & privacy">>},
                {page_path, <<"/terms">>}
            ]},
            {footer_extra_menu, menu, [
                {title, <<"Footer extra menu">>}
            ]},
            {footer_menu, menu, [
                {title, <<"Footer menu">>}
            ]},
            {download_erlang, text, [
                {title, <<"Download">>}
            ]},
            {erlang_user_group, text, [
                {title, <<"Erlang User Group">>}
            ]}
        ],
        media = [
        ],
        edges = [
        ]
    }.

%% @doc This data is only loaded in dev, test and acc environments
get_prod_data(_Context) ->
    #datamodel{
        categories = [
            {blog_post, article, [
                {title, {trans, [
                    {en, <<"Blog post">>}
                ]}},
                {language, [en]}
            ]},
            {video_post, article, [
                {title, {trans, [
                    {en, <<"Video">>}
                ]}},
                {language, [en]}
            ]},
            {presentation_post, article, [
                {title, {trans, [
                    {en, <<"Presentation">>}
                ]}},
                {language, [en]}
            ]},
            {vacancy_post, article, [
                {title, {trans, [
                    {en, <<"Vacancy">>}
                ]}},
                {language, [en]}
            ]},
            {company, location, [
                {title, {trans, [
                    {en, <<"Company">>}
                ]}},
                {language, [en]}
            ]},
            {supporter, company, [
                {title, {trans, [
                    {en, <<"Supporter">>}
                ]}},
                {language, [en]}
            ]}
        ],
        predicates = [
            {hascompany, [
                {title, <<"Company">>}], [
                    {blog_post, company},
                    {vacancy_post, company},
                    {video_post, company},
                    {presentation_post, company}
            ]},
            {hasbanner, [
                {title, <<"Banner">>}], [
                    {blog_post, company},
                    {vacancy_post, company},
                    {video_post, company},
                    {presentation_post, company}
            ]}
        ],
        resources = [
        ],
        edges = [
        ],
        data = [
            {acl_rules, [
                {rsc, [
                    {acl_user_group_id, acl_user_group_members},
                    {actions, [insert, update, link]},
                    {is_owner, true},
                    {category_id, vacancy_post}
                ]},
                {rsc, [
                    {acl_user_group_id, acl_user_group_members},
                    {actions, [insert, update, link]},
                    {is_owner, true},
                    {category_id, blog_post}
                ]},
                {rsc, [
                    {acl_user_group_id, acl_user_group_members},
                    {actions, [insert, update, link]},
                    {is_owner, true},
                    {category_id, company}
                ]},
                {rsc, [
                    {acl_user_group_id, acl_user_group_members},
                    {actions, [insert, update, link]},
                    {is_owner, true},
                    {category_id, image}
                ]}
            ]}
        ]
    }.

