{% extends "email_base.tpl" %}

{% block title %}{_ New job application submitted for _} {{ m.rsc[id].title }}{% endblock %}

{% block body %}
<div class="email_template">
    <p>
        New job application submitted for: <a href="{{ m.rsc[id].page_url }}">{{ m.rsc[id].title }}</a>
        <br/>
        <b>{_ Submitted information _}</b><br/>
        {_ Name _}: {{ apply_firstname|escape }} {{ apply_middlename|escape }} {{ apply_lastname|escape }}<br/>
        {_ Email _}: {{ apply_email|escape }}<br/>
        {_ Location _}: {{ apply_location|escape }}<br/>
        {_ Using Erlang since _}: {{ apply_since|escape }}<br/>
        {_ Erlang experience _}: {{ apply_experience|escape }}<br/>
        {_ Message _}: {{ apply_message|escape }}<br/>
        {_ Updates on new Erlang job offers _}: {{ apply_offers|escape }}<br/>
    </p>
</div>

{% endblock %}