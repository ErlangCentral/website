-module(erlangcentral_add_blog_form).
-export([event/2]).

-include_lib("zotonic.hrl").

event(#submit{message={add_blog, []}}, Context) ->
    Id = z_context:get_q("id", Context),
    BlogResourceProps = [
                {category, blog_post},
                {is_published, false},
                {title, z_context:get_q("title", Context)},
                {summary, z_context:get_q("summary", Context)},
                {body, z_context:get_q("body", Context)}
            ],
    case m_rsc:update(Id, BlogResourceProps, Context) of
        {ok, _Rsc} ->
            UserId = z_acl:user(Context),
            m_edge:insert(Id, author, UserId, Context),
            add_picture_and_link(Id, z_context:get_q("title", Context), z_context:get_q("image", Context),Context),
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
            m_edge:insert(LinkId, hasbanner, MediaId, Context);
        _ ->
            noop
    end.
