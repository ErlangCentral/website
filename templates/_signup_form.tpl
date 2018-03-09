{% wire id="signup_form" type="submit" postback={signup xs_props=xs_props} delegate=signup_delegate %}
<form id="signup_form" class="setcookie form__page" method="post" action="postback">
    {% include form_fields_tpl %}
</form>
