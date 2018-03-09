{% with company as company %}
    {% if company.address_city and company.address_country %}
        {{ company.address_city }}, {{ m.l10n.country_name[company.address_country] }}
    {% elseif company.address_city %}
        {{ company.address_city }}
    {% elseif company.address_country %}
        {{ m.l10n.country_name[company.address_country] }}
    {% endif %}
{% endwith %}

