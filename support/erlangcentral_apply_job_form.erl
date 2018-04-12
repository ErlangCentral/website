-module(erlangcentral_apply_job_form).
-export([event/2]).

-include_lib("zotonic.hrl").

event(#submit{message={vacancy, [{id, Id}]}}, Context) ->
    File = z_context:get_q("apply_cv", Context),
    Vars = [
                {id, Id},
                {apply_firstname, z_context:get_q("apply_firstname", Context)},
                {apply_middlename, z_context:get_q("apply_middlename", Context)},
                {apply_lastname, z_context:get_q("apply_lastname", Context)},
                {apply_email, z_context:get_q("apply_email", Context)},
                {apply_location, z_context:get_q("apply_location", Context)},
                {apply_since, z_context:get_q("apply_since", Context)},
                {apply_cv, z_context:get_q("apply_cv", Context)},
                {apply_experience, z_context:get_q("apply_experience", Context)},
                {apply_message, z_context:get_q("apply_message", Context)},
                {apply_offers, z_context:get_q("apply_offers", Context)},
                {apply_terms, z_context:get_q("apply_terms", Context)}
            ],
    Email = get_email(Id, Context),
    Uploads = case File of
                undefined ->
                  [];
                #upload{} ->
                  [File]
              end,
    z_email:send(#email{
                    to=Email,
                    html_tpl="_vancancy_apply_form_email.tpl",
                    vars=Vars,
                    attachments=Uploads
                  },
                  Context),

    Text = "The application has been sent.",
    z_render:update("js-form-apply", Text, Context).

get_email(Id, Context) ->
  case get_author_email(Id, Context) of
    undefined ->
      case get_company_email(Id, Context) of
        undefined ->
          case m_rsc:p(Id, email, Context) of
            undefined ->
              m_config:get_value(site, contact_email, "info@erlangcentral.org", Context);
            <<>> ->
              m_config:get_value(site, contact_email, "info@erlangcentral.org", Context);
            VacancyEmail ->
              VacancyEmail
          end;
        CompanyEmail ->
          CompanyEmail
      end;
    AuthorEmail ->
      AuthorEmail
  end.

get_author_email(Id, Context) ->
  case m_rsc:o(Id, author, 1, Context) of
    undefined ->
      undefined;
    Author ->
      case m_rsc:p(Author, email, Context) of
        <<>> -> undefined;
        Value -> Value
      end
  end.

get_company_email(Id, Context) ->
  case m_rsc:o(Id, hascompany, 1, Context) of
    undefined ->
      undefined;
    Company ->
      case m_rsc:p(Company, email, Context) of
        <<>> -> undefined;
        Value -> Value
      end
  end.
