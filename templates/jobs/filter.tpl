<div class="row filter">
    <form id="job_filter_form" action="" class="jobs__filter__form filter__form">
        <select name="location" id="filter_form_location" class="filter__form__select">
            <option value="all" selected>Company Location</option>
            {% with m.search[{ginger_distinct_country category="company"}] as result %}
                {% for i in result %}
                    <option value="{{ i }}">{{ m.l10n.country_name[i] }}</option>
                {% endfor %}
            {% endwith %}
        </select>
        <select name="type" id="filter_form_type" class="filter__form__select">
            <option value="all" selected>Type</option>
            <option value="permanent">Permanent</option>
            <option value="contract">Contract</option>
        </select>
        <select name="workplace" id="filter_form_workplace" class="filter__form__select">
            <option value="all" selected>Workplace</option>
            <option value="remote">Remote only</option>
            <option value="onsite">On site only</option>
        </select>
    </form>
</div>

