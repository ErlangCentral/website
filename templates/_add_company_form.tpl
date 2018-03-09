<div id="company_wrapper">
    <div id="company_info">
        <h2 class="add-job__company-section__title">{_ Company information _}</h2>

        <div class="row form__row form-group">
            <div class="col-md-2 form__label__wrapper">
                <label for="company_name">{_ Company Name _} *</label>
            </div>
            <div class="col-md-10">
                <input id="company_name" name="company_name" type="text" placeholder="">
            </div>
        </div>
        {% validate id="company_name" type={presence} %}

        <div class="row form__row form-group">
            <div class="col-md-2 form__label__wrapper">
                <label for="company_image">{_ Logo _}</label>
            </div>
            <div class="col-md-10">
                <input type="file" name="company_image" id="company_image" accept="image/*">
            </div>
        </div>

        <div class="row form__row form-group">
            <div class="col-md-2 form__label__wrapper">
                <label for="company_body">{_ About _} *</label>
            </div>
            <div class="col-md-10">
                    <textarea rows="10"
                              id="company_body"
                              name="company_body"
                              class="body z_editor-init form-control"
                    ></textarea>
            </div>
        </div>
        {% validate id="company_body" type={presence} %}

        <div class="row form__row form-group">
            <div class="col-md-2 form__label__wrapper">
                <label for="company_address">{_ Address _} *</label>
            </div>
            <div class="col-md-10">
                <input id="company_address" name="company_address" type="text" placeholder="">
            </div>
        </div>
        {% validate id="company_address" type={presence} %}

        <div class="row form__row form-group">
            <div class="col-md-2 form__label__wrapper">
                <label for="company_zipcode">{_ Zipcode _} *</label>
            </div>
            <div class="col-md-10">
                <input id="company_zipcode" name="company_zipcode" type="text" placeholder="">
            </div>
        </div>
        {% validate id="company_zipcode" type={presence} %}

        <div class="row form__row form-group">
            <div class="col-md-2 form__label__wrapper">
                <label for="company_city">{_ City _} *</label>
            </div>
            <div class="col-md-10">
                <input id="company_city" name="company_city" type="text" placeholder="">
            </div>
        </div>
        {% validate id="company_city" type={presence} %}

        <div class="row form__row form-group">
            <div class="col-md-2 form__label__wrapper">
                <label for="company_country">{_ Country _} *</label>
            </div>
            <div class="col-md-10">
                <select id="company_country" name="company_country">
                    {% optional include "_l10n_country_options.tpl" %}
                </select>
            </div>
        </div>
        {% validate id="company_country" type={presence} %}

        <div class="row form__row form-group">
            <div class="col-md-2 form__label__wrapper">
                <label for="company_website">{_ Website _}</label>
            </div>
            <div class="col-md-10">
                <input id="company_website" name="company_website" type="text" placeholder="">
            </div>
        </div>

        <div class="row form__row form-group">
            <div class="col-md-2 form__label__wrapper">
                <label for="company_facebook">{_ Facebook _}</label>
            </div>
            <div class="col-md-10">
                <input id="company_facebook" name="company_facebook" type="text" placeholder="">
            </div>
        </div>

        <div class="row form__row form-group">
            <div class="col-md-2 form__label__wrapper">
                <label for="company_twitter">{_ Twitter _}</label>
            </div>
            <div class="col-md-10">
                <input id="company_twitter" name="company_twitter" type="text" placeholder="">
            </div>
        </div>
    </div>
</div>