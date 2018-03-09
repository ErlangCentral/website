<form id="js-contact-form" class="contact-form" method="post" action="postback">
    {% wire id="js-contact-form" type="submit" postback={contact} delegate="erlangcentral_contact_form" %}

    <div class="row form__row form-group">
        <div class="col-md-4 form__label__wrapper">
            <label for="name">{_ Name _}</label>
        </div>
        <div class="col-md-8">
            <input id="name" name="name" type="text" placeholder="">
        </div>
    </div>
    {% validate id="name" type={presence} %}

    <div class="row form__row form-group">
        <div class="col-md-4 form__label__wrapper">
            <label for="email">{_ Email _}</label>
        </div>
        <div class="col-md-8">
            <input id="email" name="email" type="text" placeholder="">
        </div>
    </div>
    {% validate id="email" type={presence} type={email} %}

    <div class="row form__row form-group">
        <div class="col-md-4 form__label__wrapper">
            <label for="message">{_ Message _}</label>
        </div>
        <div class="col-md-8">
            <textarea rows="10"
                      id="message"
                      name="message"
                      class="form-control"
            ></textarea>
        </div>
    </div>
    {% validate id="message" type={presence} %}

    <div class="row form__row form-group">
        <div class="col-md-4 form__label__wrapper">

        </div>
        <div class="col-md-8">
            <input type="submit" value="{_ Send message _}" class="btn-default" >
        </div>
    </div>

    <div id="js-error"></div>
</form>