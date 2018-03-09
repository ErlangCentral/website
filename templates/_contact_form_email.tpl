{% extends "email_base.tpl" %}

{% block title %}{_ Contact form submitted _}{% endblock %}

{% block body %}
<div class="email_template">
    <p>
        {_ Contact form submitted _}<br/>
        <br/>
        <b>{_ Submitted data _}</b><br/>
        {_ Name _}: {{ name|escape }}<br/>
        {_ Email _}: {{ email|escape }}<br/>
        {_ Message _}: {{ message|escape }}<br/>
    </p>
</div>

{% endblock %}
