<div class="form-group">
    <input class="form-control" type="text" id="username" name="username" value="" autofocus="autofocus" autocomplete="on" placeholder="{_ Username _}" />
    {% validate id="username"
        type={presence failure_message=_"Enter your username"}
        only_on_submit
    %}
</div>

<div class="form-group login__password__wrapper">
    <input class="form-control" type="password" id="password" name="password" value="" autocomplete="on" placeholder="{_ Password _}" />
    {% validate id="password"
        type={presence failure_message=_"Enter your password"}
        only_on_submit
    %}
</div>

<div class="form-group login__controls">
    <button class="btn btn-default" type="submit">{_ Sign in _}</button>
    <a href="{% url logon_reminder %}" class="link login__controls__forgot-password" id="{{ #link_reset }}">{_ Forgot your password? _}</a>
    <span class="login__controls__signup-label">new here?</span>
    <a href="/signup" class="btn btn" >{_ Sign up _}</a>
</div>
