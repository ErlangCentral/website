{% if m.acl.user %}
    {% with m.rsc[m.acl.user] as user %}
        <form id="js-form-apply" class="form__page" method="post" action="postback">
            {% wire id="js-form-apply" type="submit" postback={vacancy id=id} delegate="erlangcentral_apply_job_form" %}
            <p class="intro__small">{_ Job application _}</p>
            <h3 class="form__title" >{{ id.title }}</h3>
            <div class="row form-group form__row">
                <div class="col-md-4 form__label__wrapper">
                    <label for="apply_name">{_ Name _} *</label>
                </div>
                <div class="col-md-8">
                    <input id="apply_firstname" name="apply_firstname" type="text" placeholder="your firstname..." value="{{ user.name_first }}">
                    {% validate id="apply_firstname" only_on_blur type={presence failure_message=_"First name is required"} %}
                </div>
            </div>
            <div class="row form-group form__row">
                <div class="col-md-4 form__label__wrapper"></div>
                <div class="col-md-3 form__middlename__wrapper">
                    <input id="apply_middlename" name="apply_middlename" type="text" placeholder="surname prefix..." value="{{ user.name_middle }}">
                </div>
                <div class="col-md-5 form__lastname__wrapper">
                    <input id="apply_lastname" name="apply_lastname" type="text" placeholder="your surname..." value="{{ user.name_surname }}">
                    {% validate id="apply_lastname" only_on_blur type={presence failure_message=_"Surname is required"} %}
                </div>
            </div>
            <div class="row form-group form__row">
                <div class="col-md-4 form__label__wrapper">
                    <label for="apply_email">{_ Email _} *</label>
                </div>
                <div class="col-md-8">
                    <input id="apply_email" name="apply_email" type="text" placeholder="your email adress..." value="{{ user.email }}">
                    {% validate id="apply_email" only_on_blur type={presence failure_message=_"Email is required"} type={email failure_message=_"Invalid email"} %}
                </div>
            </div>
            <div class="row form-group form__row">
                <div class="col-md-4 form__label__wrapper">
                    <label for="apply_location">{_ Location _}</label>
                </div>
                <div class="col-md-8">
                    <input id="apply_location" name="apply_location" type="text" placeholder="your location">
                </div>
            </div>
            <div class="row form-group form__row">
                <div class="col-md-4 form__label__wrapper">
                    <label for="apply_since">{_ Using Erlang since _}</label>
                </div>
                <div class="col-md-8">
                    <input id="apply_since" name="apply_since" type="text" placeholder="" value="{{ user.erlang_since }}">
                </div>
            </div>
            {% javascript %}
                $( function() {
                    $( "#erlang_since" ).datepicker({dateFormat: "yy-mm-dd"});
                });
            {% endjavascript %}
            <div class="row form-group form__row">
                <div class="col-md-4 form__label__wrapper">
                    <label for="apply_cv">{_ Upload CV _}</label>
                </div>
                <div class="col-md-8">
                    <input id="apply_cv" name="apply_cv" type="file" value="Choose file">
                </div>
            </div>
            <div class="row form-group form__row">
                <div class="col-md-4 form__label__wrapper">
                    <label for="apply_experience">{_ Erlang experience _}</label>
                </div>
                <div class="col-md-8">
                    <textarea id="apply_experience" name="apply_experience" placeholder="your experience"></textarea>
                </div>
            </div>
            <div class="row form-group form__row">
                <div class="col-md-4 form__label__wrapper">
                    <label for="apply_message">{_ Message _}</label>
                </div>
                <div class="col-md-8">
                    <textarea id="apply_message" name="apply_message" placeholder="your motivation"></textarea>
                </div>
            </div>
            <div class="row form-group form__row">
                <div class="col-md-4 form__label__wrapper"></div>
                <div class="col-md-8">
                    <div>
                        <input id="apply_offers" name="apply_offers" type="checkbox" value="1">
                        <span>{_ Please send me email updates on new Erlang job offers _}</span>
                    </div>
                    <div>
                        <input id="apply_terms" name="apply_terms" type="radio" value="1">
                        <span>{_ I accept the terms of uses * _}</span>
                        {% validate id="apply_terms" only_on_blur type={presence failure_message=_"Accepting terms of uses is required"} %}
                    </div>
                </div>
            </div>
            <input type="submit" value="Send application" class="btn-default" >

            <div id="js-message"></div>
        </form>
    {% endwith %}
{% endif %}
