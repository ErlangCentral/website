{% extends "page.tpl" %}

{% block page_class %}form__page__static{% endblock %}

{% block page_header_title %}<h1>{_ Edit profile _}</h1>{% endblock %}

{% block page_content %}


<form id="js-edit-profile-form" class="blog-form form__page" method="post" action="postback" enctype="multipart/form-data">
    {% wire id="js-edit-profile-form" type="submit" postback={edit_profile} delegate="erlangcentral_edit_profile_form" %}

    <input type="hidden" name="id" id="id" value="{{ id }}" />

    <div class="row form-group form__row">
        <div class="col-md-3 form__label__wrapper">
            <label for="name_first">{_ Name _} *</label>
        </div>
        <div class="col-md-9">
            <input id="name_first" name="name_first" type="text" placeholder="your first name..." value="{{ id.name_first }}">
            {% validate id="name_first" only_on_blur type={presence failure_message=_"First name is required"} %}
        </div>
    </div>
    <div class="row form-group form__row">
        <div class="col-md-3 form__label__wrapper"></div>
        <div class="col-md-4 form__middlename__wrapper">
            <input id="name_surname_prefix" name="name_surname_prefix" type="text" placeholder="surname prefix..." value="{{ id.name_surname_prefix }}">
        </div>
        <div class="col-md-5 form__lastname__wrapper">
            <input id="name_surname" name="name_surname" type="text" placeholder="your surname..." value="{{ id.name_surname }}">
            {% validate id="name_surname" only_on_blur type={presence failure_message=_"Surname is required"} %}
        </div>
    </div>
    <div class="row form-group form__row">
        <div class="col-md-3 form__label__wrapper">
            <label for="email">{_ Email _} *</label>
        </div>
        <div class="col-md-9">
            <input id="email" name="email" type="text" placeholder="your email adress..." value="{{ id.email }}">
            {% validate id="email" only_on_blur type={presence failure_message=_"Email is required"} type={email failure_message=_"Invalid email"} %}
        </div>
    </div>

    <div class="row form-group form__row">
        <div class="col-md-3 form__label__wrapper">
            <label for="website">{_ Website _}</label>
        </div>
        <div class="col-md-9">
            <input id="website" name="website" type="text" placeholder="your website adress..." value="{{ id.website }}">
        </div>
    </div>
    {# {% validate id="website" name="website"
        type={format pattern="^[a-z0-9-]+(\\.[a-z0-9-]+)+$" failure_message=_"Enter a valid website like \"www.example.com\" or \"http://test.local\"."}
    %} #}
    <div class="row form-group form__row">
        <div class="col-md-3 form__label__wrapper">
            <label for="facebook">{_ Facebook _}</label>
        </div>
        <div class="col-md-9">
            <input id="facebook" name="facebook" type="text" placeholder="your facebook page..." value="{{ id.facebook }}">
        </div>
    </div>
    {# {% validate id="facebook" name="facebook"
        type={format pattern="/(?:https?:\/\/)?(?:www\.)?facebook\.com\/(?:(?:\w)*#!\/)?(?:pages\/)?(?:[\w\-]*\/)*?(\/)?([^/?]*)/"|stringify failure_message=_"Enter a valid facebook page like \"https://facebook.com/erlangcentral/\" or \"http://facebook.com/erlangcentral/\"."}
    %} #}
    <div class="row form-group form__row">
        <div class="col-md-3 form__label__wrapper">
            <label for="twitter">{_ Twitter _}</label>
        </div>
        <div class="col-md-9">
            <input id="twitter" name="twitter" type="text" placeholder="your twitter page..." value="{{ id.twitter }}">
        </div>
    </div>
    {# {% validate id="twitter" name="twitter"
        type={format pattern="/(?:https?:\/\/)?(?:www\.)?twitter\.com\/(?:(?:\w)*#!\/)?(?:pages\/)?(?:[\w\-]*\/)*?(\/)?([^/?]*)/"|stringify failure_message=_"Enter a valid twitter page like \"https://twitter.com/erlangcentral/\" or \"http://twitter.com/erlangcentral/\"."}
    %} #}
    <div class="row form-group form__row">
        <div class="col-md-3 form__label__wrapper">
            <label for="github">{_ Github _}</label>
        </div>
        <div class="col-md-9">
            <input id="github" name="github" type="text" placeholder="your github page..." value="{{ id.github }}">
        </div>
    </div>
{#     {% validate id="github" name="github"
        type={format pattern="/(?:https?:\/\/)?(?:www\.)?github\.com\/(?:(?:\w)*#!\/)?(?:pages\/)?(?:[\w\-]*\/)*?(\/)?([^/?]*)/"|stringify failure_message=_"Enter a valid github page like \"https://github.com/erlangcentral/\" or \"http://github.com/erlangcentral/\"."}
    %} #}

    <div class="row form-group form__row">
        <div class="col-md-3 form__label__wrapper">
            <label for="linkedin">{_ Linkedin _}</label>
        </div>
        <div class="col-md-9">
            <input id="linkedin" name="linkedin" type="text" placeholder="your linkedin page..." value="{{ id.linkedin }}">
        </div>
    </div>
{#     {% validate id="linkedin" name="linkedin"
        type={format pattern="/(?:https?:\/\/)?(?:www\.)?github\.com\/(?:(?:\w)*#!\/)?(?:pages\/)?(?:[\w\-]*\/)*?(\/)?([^/?]*)/"|stringify failure_message=_"Enter a valid github page like \"https://github.com/erlangcentral/\" or \"http://github.com/erlangcentral/\"."}
    %} #}

    <div class="row form-group form__row">
        <div class="col-md-3 form__label__wrapper">
            <label class="control-label" for="address_country">{_ Country _}</label>
        </div>
        <div class="col-md-9">
            <span class="admin-text-header"></span>
            {% if m.modules.active.mod_l10n %}
                <select id="address_country" name="address_country">
                    <option value=""></option>
                    {% optional include "_l10n_country_options.tpl" country=id.address_country %}
                </select>
            {% else %}
                <input id="address_country" type="text" name="address_country" value="{{ r.address_country }}">
            {% endif %}
        </div>
    </div>

    <div class="row form-group form__row">
        <div class="col-md-3 form__label__wrapper">
            <label for="address_city">{_ city _}</label>
        </div>
        <div class="col-md-9">
            <input id="address_city" name="address_city" type="text" placeholder="your city adress..." value="{{ id.address_city }}">
        </div>
    </div>

    <div class="row form-group form__row">
        <div class="col-md-3 form__label__wrapper">
            <label for="erlang_since">{_ Using Erlang since _}</label>
        </div>
        <div class="col-md-9">
            <input id="erlang_since" name="erlang_since" type="text" placeholder="" value="{{ id.erlang_since }}">
        </div>
    </div>

    <div class="row form__row form-group">
        <div class="col-md-3 form__label__wrapper">
            <label for="body">{_ About _}</label>
        </div>
        <div class="col-md-9">
            <textarea rows="10"
                      id="body"
                      name="body"
                      class="body z_editor-init form-control"
                      >{{ id.body|escape }}</textarea>
        </div>
    </div>

    <div class="row form__row form-group">
        <div class="col-md-3 form__label__wrapper">
            <label for="image">{_ Picture _}</label>
        </div>
        <div class="col-md-9">
            <input type="file" name="image" id="image" accept="image/*">
        </div>
    </div>

    <div class="row form__row form-group">
        <div class="col-md-3 form__label__wrapper">

        </div>
        <div class="col-md-9">
            <input type="submit" value="{_ Save profile _}" class="btn-default" >
        </div>
    </div>

    <div id="js-error"></div>

</form>

{% endblock %}

{% block extra_scripts %}

{% javascript %}
z_editor.init();
{% endjavascript %}

{% include "_editor.tpl" overrides_tpl="_tinymce_overrides.tpl" %}

{% endblock %}
