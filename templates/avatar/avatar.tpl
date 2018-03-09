{% with id.o.depiction|last as dep_rsc %}
{% if dep_rsc %}
    {% image dep_rsc.id mediaclass="avatar" alt=dep_rsc.title class=image_class %}
{% endif %}
{% endwith %}
