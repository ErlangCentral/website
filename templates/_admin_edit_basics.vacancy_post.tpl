{% extends "admin_edit_widget_i18n.tpl" %}

{% block widget_title %}
    {_ Basic _}
    <div class="widget-header-tools"></div>
{% endblock %}

{% block widget_i18n_tab_class %}item{% endblock %}
{% block widget_id %}edit-basics{% endblock %}

{% block widget_content %}
    {% catinclude "_admin_edit_basics_form.tpl" id lang_code_with_brackets=lang_code_with_brackets lang_code_with_dollar=lang_code_with_dollar lang_code_for_id=lang_code_for_id r_language=r_language is_i18n=is_i18n lang_code=lang_code lang=lang %}
{% endblock %}

{% block widget_content_nolang %}
    <fieldset class="form-horizontal">
        <div class="form-group row">
            <label class="control-label col-md-3" for="{{ #type }}">{_ Type _}</label>
            <div class="col-md-9">
                <select class="form-control" name="type" id="{{ #type }}">
                    <option value="permanent">Permanent</option>
                    <option value="contract" {% if r.type == "contract" %} selected {% endif %} >Contract</option>
                </select>
            </div>
        </div>
    </fieldset>
    <fieldset class="form-horizontal">
        <div class="form-group row">
            <label class="control-label col-md-3" for="{{ #workplace }}">{_ Workplace _}</label>
            <div class="col-md-9">
                <select class="form-control" name="workplace" id="{{ #workplace }}">
                    <option value="both">Remote & On site</option>
                    <option value="remote" {% if r.workplace == "remote" %} selected {% endif %} >Remote only</option>
                    <option value="onsite" {% if r.workplace == "onsite" %} selected {% endif %} >On site only</option>
                </select>
            </div>
        </div>
    </fieldset>
{% endblock %}
