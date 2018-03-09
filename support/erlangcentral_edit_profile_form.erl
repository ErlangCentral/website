-module(erlangcentral_edit_profile_form).
-export([event/2]).

-include_lib("zotonic.hrl").

event(#submit{message={edit_profile, []}}, Context) ->
    Id = z_context:get_q("id", Context),
    PersonResourceProps = [
                {name_first, z_context:get_q("name_first", Context)},
                {name_surname_prefix, z_context:get_q("name_surname_prefix", Context)},
                {name_surname, z_context:get_q("name_surname", Context)},
                {body, z_context:get_q("body", Context)},
                {facebook, z_context:get_q("facebook", Context)},
                {twitter, z_context:get_q("twitter", Context)},
                {github, z_context:get_q("github", Context)},
                {linkedin, z_context:get_q("linkedin", Context)},
                {erlang_since, z_context:get_q("erlang_since", Context)},
                {website, z_context:get_q("website", Context)},
                {address_country, z_context:get_q("address_country", Context)},
                {address_city, z_context:get_q("address_city", Context)}

            ],
    case m_rsc:update(Id, PersonResourceProps, Context) of
        {ok, _Rsc} ->
            add_picture_and_link(Id, z_context:get_q("name_first", Context), z_context:get_q("image", Context),Context),
            Actions = [
                {redirect, [{location, "/page/"++z_convert:to_list(Id)}]}
            ],
            z_render:wire(Actions, Context);
        {error, _ErrorMessage} ->
            render_error(Context);
        _ ->
            render_error(Context)
    end.

render_error(Context) ->
    Text = "An error occured while sending, please try again or email to info@erlangcentral.org",
    z_render:update("js-error", Text, Context).

add_picture_and_link(undefined, _Name, undefined, _Context) ->
    noop;
add_picture_and_link(_LinkId, _Name, undefined, _Context) ->
    noop;
add_picture_and_link(_LinkId, _Name, "", _Context) ->
    noop;
add_picture_and_link(_LinkId, _Name, {upload, [], _TmpFile, undefined, undefined}, _Context) ->
    noop;
add_picture_and_link(LinkId, Name, Upload, Context) ->
    Props = [
        {title, Name}
    ],
    case m_media:insert_file(Upload, Props, [], Context) of
        {ok, MediaId} ->
            m_edge:insert(LinkId, depiction, MediaId, Context);
        _ ->
            noop
    end.
