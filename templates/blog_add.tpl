{% extends "page.tpl" %}

{% block page_class %}form__page__static{% endblock %}

{% block page_header_title %}<h1>{_ Add blog _}</h1>{% endblock %}

{% block page_content %}
{% with false|temporary_rsc:{props category="blog_post" title="Blog user "++m.acl.user.id} as id %}

<form id="js-add-blog-form" class="blog-form form__page" method="post" action="postback" enctype="multipart/form-data">
    {% wire id="js-add-blog-form" type="submit" postback={add_blog} delegate="erlangcentral_add_blog_form" %}

    <input type="hidden" name="id" id="id" value="{{ id }}" />

    <div class="row form__row form-group">
        <div class="col-md-2 form__label__wrapper">
            <label for="title">{_ Title _}</label>
        </div>
        <div class="col-md-10">
            <input id="title" name="title" type="text" placeholder="">
        </div>
    </div>
    {% validate id="title" type={presence} %}

    <div class="row form__row form-group">
        <div class="col-md-2 form__label__wrapper">
            <label for="summary">{_ Introduction _}</label>
        </div>
        <div class="col-md-10">
            <textarea id="summary" name="summary"></textarea>
        </div>
    </div>

    <div class="row form__row form-group">
        <div class="col-md-2 form__label__wrapper">
            <label for="body">{_ About _}</label>
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

    <div class="row form__row form-group">
        <div class="col-md-2 form__label__wrapper">

        </div>
        <div class="col-md-10">
            <input type="submit" value="{_ Add blog _}" class="btn-default" >
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
