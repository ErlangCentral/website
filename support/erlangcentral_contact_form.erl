-module(erlangcentral_contact_form).
-export([event/2]).

-include_lib("zotonic.hrl").

event(#submit{message={contact, []}}, Context) ->
    Vars = [
                {name, z_context:get_q("name", Context)},
                {email, z_context:get_q("email", Context)},
                {message, z_context:get_q("message", Context)}
            ],

    Email = m_config:get_value(site, contact_email, "info@erlangcentral.org", Context),
    z_email:send_render(Email, "_contact_form_email.tpl", Vars, Context),

    z_render:update(
        "js-contact-form",
        z_template:render(
            "_contact_form_response.tpl",
            [],
            Context
        ),
        Context
    ).