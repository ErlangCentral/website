{% extends "page.tpl" %}

{% block page_class %}form__page__static{% endblock %}

{% block page_header_title %}<h1>{_ Add job _}</h1>{% endblock %}

{% block page_content %}
{% with false|temporary_rsc:{props category="vacancy_post" title="Vacancy user "++m.acl.user.id} as id %}

<form id="js-add-job-form" class="add-form form__page" method="post" action="postback" enctype="multipart/form-data">
    <div class="add-form_add-job">
        {% wire id="js-add-job-form" type="submit" postback={add_job} delegate="erlangcentral_add_job_form" %}

        <input type="hidden" name="id" id="id" value="{{ id }}" />

        <div class="row form__row form-group">
            <div class="col-md-2 form__label__wrapper">
                <label for="title">{_ Title _} *</label>
            </div>
            <div class="col-md-10">
                <input id="title" name="title" type="text" placeholder="{_ Vacancy title _}">
            </div>
        </div>
        {% validate id="title" type={presence} %}

        <div class="row form__row form-group">
            <div class="col-md-2 form__label__wrapper">
                <label for="publication_end">{_ Valid untill _} *</label>
            </div>
            <div class="col-md-10">
                <input id="publication_end" name="publication_end" type="text" placeholder="{_ Vacancy title _}">
            </div>
        </div>
        {% javascript %}
            $( function() {
                $( "#publication_end" ).datepicker({dateFormat: "yy-mm-dd"});
            } );
        {% endjavascript %}

        <div class="row form__row form-group">
            <div class="col-md-2 form__label__wrapper">
                <label for="type">{_ Type _} *</label>
            </div>
            <div class="col-md-10">
                <select id="type" name="type">
                    <option value="fulltime">{_ Fulltime _}</option>
                    <option value="freelance">{_ Freelance _}</option>
                </select>
            </div>
        </div>
        {% validate id="type" type={presence} %}

        <div class="row form__row form-group">
            <div class="col-md-2 form__label__wrapper">
                <label for="workplace">{_ Workplace _} *</label>
            </div>
            <div class="col-md-10">
                <select id="workplace" name="workplace">
                    <option value="all">{_ Remote & On site _}</option>
                    <option value="remote">{_ Remote only _}</option>
                    <option value="onsite">{_ On site only _}</option>
                </select>
            </div>
        </div>
        {% validate id="workplace" type={presence} %}

        <div class="row form__row form-group">
            <div class="col-md-2 form__label__wrapper">
                <label for="body">{_ About _} *</label>
            </div>
            <div class="col-md-10">
                <textarea rows="10"
                          id="body"
                          name="body"
                          class="body z_editor-init form-control"
                          ></textarea>
            </div>
        </div>
        {% validate id="body" type={presence} %}

        <div class="row form__row form-group">
            <div class="col-md-2 form__label__wrapper">
                <label for="image">{_ Picture _}</label>
            </div>
            <div class="col-md-10">
                <input type="file" name="image" id="image" accept="image/*">
            </div>
        </div>
    </div>
    {% with m.search[{ginger_search cat_exact="company" hasobject=[m.acl.user,'author'] is_published='all' sort='rsc.pivot_title'}] as companies %}
        {% if companies|length > 0 %}
            <div class="row form__row form-group">
                <div class="col-md-2 form__label__wrapper">
                    <label for="company">{_ Select Company _}</label>
                </div>
                <div class="col-md-10">
                    <select id="company" name="company">
                        <option></option>
                        {% for company in companies %}
                            <option value="{{ company.id }}">{{ company.title }}</option>
                        {% endfor %}
                    </select>
                </div>
            </div>

        {% endif %}

        {% include "_add_company_form.tpl" %}

        {% wire name="remove_company_form" action={remove target="company_info"} %}
        {% wire name="show_company_form" action={replace target="company_wrapper" template="_add_company_form.tpl"} %}

        {% javascript %}
            $('#company').on('change', function(){
                selectValue = $(this).val();

                if(selectValue != ''){
                    z_event("remove_company_form");
                } else {
                    z_event("show_company_form");
                }

            });
        {% endjavascript %}
    {% endwith %}

    <div class="row form__row form-group">
        <div class="col-md-2 form__label__wrapper">

        </div>
        <div class="col-md-10">
            <input type="submit" value="{_ Add job _}" class="btn-default" >
        </div>
    </div>

    <div id="js-error"></div>


</form>

{% wire name="zmedia"
    action={
        dialog_open
        template="_action_dialog_connect.tpl"
        title=_"Insert image"
        subject_id=id
        predicate=`depiction`
        tab="upload"
        tabs_enabled=["upload","oembed"]
        callback="window.zAdminMediaDone"
        center=0
    }
%}

{% endwith %}

{% endblock %}

{% block extra_scripts %}

{% javascript %}
z_editor.init();
{% endjavascript %}

{% include "_editor.tpl" overrides_tpl="_tinymce_overrides.tpl" %}

{% endblock %}
