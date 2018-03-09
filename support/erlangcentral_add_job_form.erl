-module(erlangcentral_add_job_form).
-export([event/2]).

-include_lib("zotonic.hrl").

event(#submit{message={add_job, []}}, Context) ->
    Id = z_context:get_q("id", Context),
    JobResourceProps = [
                {category, vacancy_post},
                {is_published, false},
                {title, z_context:get_q("title", Context)},
                {publication_end, z_convert:to_date(z_context:get_q("publication_end", Context))},
                {type, z_context:get_q("type", Context)},
                {workplace, z_context:get_q("workplace", Context)},
                {body, z_context:get_q("body", Context)}
            ],
    case m_rsc:update(Id, JobResourceProps, Context) of
        {ok, _Rsc} ->
            UserId = z_acl:user(Context),
            m_edge:insert(Id, author, UserId, Context),
            case add_company_to_job(Id, Context) of
                {ok, CompanyId} ->
                    add_picture_and_link(Id, hasbanner, z_context:get_q("title", Context), z_context:get_q("image", Context),Context),
                    add_picture_and_link(CompanyId, depiction, z_context:get_q("company_name", Context), z_context:get_q("company_image", Context),Context),
                    Actions = [
                        {redirect, [{location, "/page/"++z_convert:to_list(Id)}]}
                    ],
                    z_render:wire(Actions, Context);
                {error, _ErrorMessage} ->
                    render_error(Context);
                _ ->
                    render_error(Context)
            end;
        {error, _ErrorMessage} ->
            render_error(Context);
        _ ->
            render_error(Context)
    end.

render_error(Context) ->
    Text = "An error occured while sending, please try again or email to info@erlangcentral.org",
    z_render:update("js-error", Text, Context).

add_company_to_job(JobId, Context) ->
    case z_context:get_q("company", Context, undefined) of
        [] ->
            create_company(JobId, Context);
        undefined ->
            create_company(JobId, Context);
        CompanyId ->
            m_edge:insert(JobId, hascompany, z_convert:to_integer(CompanyId), Context),
            {ok, z_convert:to_integer(CompanyId)}
    end.

create_company(JobId, Context) ->
    CompanyProps = [
                    {category, company},
                    {is_published, false},
                    {title, z_context:get_q("company_name", Context)},
                    {address_street_1, z_context:get_q("company_address", Context)},
                    {address_postcode, z_context:get_q("company_zipcode", Context)},
                    {address_city, z_context:get_q("company_city", Context)},
                    {address_country, z_context:get_q("company_country", Context)},
                    {website, z_context:get_q("company_website", Context)},
                    {facebook, z_context:get_q("company_facebook", Context)},
                    {twitter, z_context:get_q("company_twitter", Context)},
                    {body, z_context:get_q("company_body", Context)}
                ],
    case m_rsc:insert(CompanyProps, Context) of
        {ok, CompanyId} ->
            m_edge:insert(JobId, hascompany, CompanyId, Context),
            UserId = z_acl:user(Context),
            m_edge:insert(CompanyId, author, UserId, Context),
            {ok, CompanyId};
        _ ->
            undefined
    end.

add_picture_and_link(undefined, _Predicate, _Name, undefined, _Context) ->
    noop;
add_picture_and_link(_LinkId, _Predicate, _Name, undefined, _Context) ->
    noop;
add_picture_and_link(_LinkId, _Predicate, _Name, "", _Context) ->
    noop;
add_picture_and_link(_LinkId, _Predicate, _Name, {upload, [], _TmpFile, undefined, undefined}, _Context) ->
    noop;
add_picture_and_link(LinkId, Predicate, Name, Upload, Context) ->
    Props = [
        {title, Name}
    ],
    case m_media:insert_file(Upload, Props, [], Context) of
        {ok, MediaId} ->
            m_edge:insert(LinkId, Predicate, MediaId, Context);
        _ ->
            noop
    end.
